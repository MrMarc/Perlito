
class Main {
    use MiniPerl6::Precedence;
    use MiniPerl6::Grammar;
    use MiniPerl6::Perl5::Emitter;

   
    my $reduce_to_ast = sub ($op_stack, $num_stack) {
        my $last_op = $op_stack.shift;
        if $last_op[0] eq 'prefix' {
            push $num_stack,
                Apply.new(
                    namespace => '',
                    code      => 'prefix:<' ~ $last_op[1] ~ '>',
                    arguments => [ pop($num_stack) ],
                  );
        }
        elsif $last_op[0] eq 'postfix' {
            push $num_stack,
                Apply.new(
                    namespace => '',
                    code      => 'postfix:<' ~ $last_op[1] ~ '>',
                    arguments => [ pop($num_stack) ],
                  );
        }
        elsif MiniPerl6::Precedence::is_assoc_type('list', $last_op[1]) {
            my $arg;
            if $num_stack.elems < 2 {
                $arg = [ pop($num_stack) ];
                push $num_stack, { op => [ 'postfix', $last_op[1] ], val => $arg };
                return;
            }
            else {
                $arg = [ pop($num_stack), pop($num_stack) ];
            }
            if     (($arg[1]).isa('Hash'))
                && ($last_op[0] eq 'infix') 
                && (((($arg[1]){'op'})[0]) eq 'list') 
                && ($last_op[1] eq ((($arg[1]){'op'})[1])) 
            {
                push $num_stack,
                  {
                    op  => $last_op,
                    val => [ $arg[0], @( ($arg[1]){'val'} ) ]
                  };
                return;
            }
            push $num_stack, { op => ['list', $last_op[1]], val => $arg };
        }
        elsif MiniPerl6::Precedence::is_assoc_type('chain', $last_op[1]) {
            if $num_stack < 2 {
                die "Missing value after operator";
            }
            my $arg = [ pop($num_stack), pop($num_stack) ];
            if ($arg[1]).isa('Hash')
                && MiniPerl6::Precedence::is_assoc_type('chain', ($arg[1]){op} ) 
            {
                push $num_stack,
                  {
                    op    => ['infix', $last_op],
                    val   => [ $arg[0] ],
                    chain => $arg[1]
                  };
                return;
            }
            push $num_stack, { op => ['infix', $last_op], val => $arg };
        }
        elsif $last_op[0] eq 'ternary' {
            if ( $num_stack < 3 ) {
                die "Missing value after ternary operator";
            }
            push $num_stack,
              {
                op  => $last_op,
                val => [ pop($num_stack), pop($num_stack), pop($num_stack) ]
              };
        }
        else {
            if ( $num_stack.elems < 2 ) {
                die "Missing value after operator";
            }
            my $v2 = pop($num_stack);
            push $num_stack,
                Apply.new(
                    namespace => '',
                    code      => 'infix:<' ~ $last_op[1] ~ '>',
                    arguments => [ pop($num_stack), $v2 ],
                  );
        }
    };
    


    token paren_lexer { 
        | '+'                           { make [ 'op',      '+' ] }
        | '|'                           { make [ 'op',      '|' ] }
        | '&'                           { make [ 'op',      '&' ] }
        | <MiniPerl6::Grammar.ident>    { make [ 'term',    ~$<MiniPerl6::Grammar.ident> ] }
        | '(' <paren_parse>             { make [ 'term',    $$<paren_parse> ] }
        | ' '+                          { make [ 'space',   ' ' ] }
        | ')'                           { make [ 'end',     ')' ] }
    }
    method paren_parse ($str, $pos) {
        say "paren_parse ",$str," at ",$pos;
        my $expr;
        my $last_pos = $pos;
        my $get_token = sub {
            my $m = self.paren_lexer($str, $last_pos);
            if !$m {
                die "Expected closing parenthesis";
            }
            my $v = $$m;
            $last_pos = $m.to;
            say "paren_lexer " ~ $v.perl;
            return $v;
        };
        my $res = MiniPerl6::Precedence::precedence_parse($get_token, $reduce_to_ast);
        say $res.perl;
        return MiniPerl6::Match.new( 
            'str' => $str, 'from' => $pos, 'to' => $last_pos, 'bool' => 1, capture => $res);
    }


    token lexer { 
        | '+'                           { make [ 'op',      '+' ] }
        | '|'                           { make [ 'op',      '|' ] }
        | '&'                           { make [ 'op',      '&' ] }
        | <MiniPerl6::Grammar.ident>    { make [ 'term',    ~$<MiniPerl6::Grammar.ident> ] }
        | '(' <paren_parse>             { make [ 'term',    $$<paren_parse> ] }
        | ' '+                          { make [ 'space',   ' ' ] }
        | ';'                           { make [ 'end',     ';' ] }
        | '}'                           { make [ 'end',     '}' ] }
    }
    method exp_parse ($str, $pos) {
        say "exp_parse ",$str," at ",$pos;
        my $expr;
        my $last_pos = $pos;
        my $get_token = sub {
            my $m = self.lexer($str, $last_pos);
            if !$m {
                return undef;
            }
            my $v = $$m;
            $last_pos = $m.to;
            say "lexer " ~ $v.perl;
            return $v;
        };
        my $res = MiniPerl6::Precedence::precedence_parse($get_token, $reduce_to_ast);
        say $res.perl;
        return MiniPerl6::Match.new( 
            'str' => $str, 'from' => $pos, 'to' => $last_pos, 'bool' => 1, capture => $res)
    } 


    my $s = '; a|b| (c+y) & x ;...';
    my $res = Main.exp_parse( $s, 1 );
    say ($$res).perl;
    say "from: ", $res.from, " to: ", $res.to, " tail: ", substr($s, $res.to);

}

