# Do not edit this file - Generated by Perlito5 9.0
use v5;
use Perlito5::Perl5::Runtime;
package main;
undef();
use Perlito5::AST;
package Perlito5::Perl5;
do { for ($_) {
    sub Perlito5::Perl5::tab {
        ((my  $level) = shift());
join("", '    ' x $level)
    };
    ((my  %safe_char) = (' ', 1, '!', 1, '"', 1, '#', 1, '$', 1, '%', 1, '&', 1, '(', 1, ')', 1, '*', 1, '+', 1, ',', 1, '-', 1, '.', 1, '/', 1, ':', 1, ';', 1, '<', 1, '=', 1, '>', 1, '?', 1, '@', 1, '[', 1, ']', 1, '^', 1, '_', 1, '`', 1, '{', 1, '|', 1, '}', 1, '~', 1));
    sub Perlito5::Perl5::escape_string {
        ((my  $s) = shift());
        (my  @out);
        ((my  $tmp) = '');
        if (($s eq '')) {
            return (chr(39) . chr(39))
        };
        for my $i ((0 .. (length($s) - 1))) {
            ((my  $c) = substr($s, $i, 1));
            if ((((((($c ge 'a') && ($c le 'z'))) || ((($c ge 'A') && ($c le 'Z')))) || ((($c ge '0') && ($c le '9')))) || exists($safe_char{$c}))) {
                ($tmp = ($tmp . $c))
            }
            else {
                if (($tmp ne '')) {
                    push(@out, (chr(39) . $tmp . chr(39)) )
                };
                push(@out, ('chr(' . ord($c) . ')') );
                ($tmp = '')
            }
        };
        if (($tmp ne '')) {
            push(@out, (chr(39) . $tmp . chr(39)) )
        };
        return (join(' . ', @out))
    }
}};
package Perlito5::AST::CompUnit;
do { for ($_) {
    sub Perlito5::AST::CompUnit::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (my  @body);
        for (@{$self->{'body'}}) {
            if (defined($_)) {
                push(@body, $_ )
            }
        };
        (Perlito5::Perl5::tab($level) . 'package ' . $self->{'name'} . ';' . chr(10) . join(';' . chr(10), map($_->emit_perl5($level), @body)) . ';' . chr(10) . chr(10))
    };
    sub Perlito5::AST::CompUnit::emit_perl5_program {
        ((my  $comp_units) = $_[0]);
        ((my  $str) = ('' . 'use v5;' . chr(10) . 'use Perlito5::Perl5::Runtime;' . chr(10)));
        for my $comp_unit (@{$comp_units}) {
            ($str = ($str . $comp_unit->emit_perl5(0)))
        };
        ($str = ($str . '1;' . chr(10)));
        return ($str)
    }
}};
package Perlito5::AST::Val::Int;
do { for ($_) {
    sub Perlito5::AST::Val::Int::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perlito5::Perl5::tab($level) . $self->{'int'})
    }
}};
package Perlito5::AST::Val::Num;
do { for ($_) {
    sub Perlito5::AST::Val::Num::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perlito5::Perl5::tab($level) . $self->{'num'})
    }
}};
package Perlito5::AST::Val::Buf;
do { for ($_) {
    sub Perlito5::AST::Val::Buf::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perlito5::Perl5::tab($level) . Perlito5::Perl5::escape_string($self->{'buf'}))
    }
}};
package Perlito5::AST::Lit::Block;
do { for ($_) {
    sub Perlito5::AST::Lit::Block::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perlito5::Perl5::tab($level) . 'do { for ($_) {' . chr(10) . join(';' . chr(10), map($_->emit_perl5(($level + 1)), @{$self->{'stmts'}})) . chr(10) . Perlito5::Perl5::tab($level) . '}}')
    }
}};
package Perlito5::AST::Index;
do { for ($_) {
    sub Perlito5::AST::Index::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        if (($self->{'obj'}->isa('Perlito5::AST::Var') && ($self->{'obj'}->sigil() eq '$'))) {
            ((my  $v) = $self->{'obj'});
            return (($v->emit_perl5($level) . '[' . $self->{'index_exp'}->emit_perl5() . ']'))
        };
        ($self->{'obj'}->emit_perl5($level) . '->[' . $self->{'index_exp'}->emit_perl5() . ']')
    }
}};
package Perlito5::AST::Lookup;
do { for ($_) {
    sub Perlito5::AST::Lookup::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        if (($self->{'obj'}->isa('Perlito5::AST::Var') && ($self->{'obj'}->sigil() eq '$'))) {
            ((my  $v) = $self->{'obj'});
            return (($v->emit_perl5($level) . '{' . $self->autoquote($self->{'index_exp'})->emit_perl5($level) . '}'))
        };
        ($self->{'obj'}->emit_perl5($level) . '->{' . $self->autoquote($self->{'index_exp'})->emit_perl5($level) . '}')
    }
}};
package Perlito5::AST::Var;
do { for ($_) {
    sub Perlito5::AST::Var::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $ns) = '');
        if ($self->{'namespace'}) {
            if ((($self->{'namespace'} eq 'main') && (substr($self->{'name'}, 0, 1) eq '^'))) {
                return ((Perlito5::Perl5::tab($level) . $self->{'sigil'} . '{' . $self->{'name'} . '}'))
            }
            else {
                ($ns = ($self->{'namespace'} . '::'))
            }
        };
        return ((Perlito5::Perl5::tab($level) . $self->{'sigil'} . $ns . $self->{'name'}))
    }
}};
package Perlito5::AST::Proto;
do { for ($_) {
    sub Perlito5::AST::Proto::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perlito5::Perl5::tab($level) . $self->{'name'})
    }
}};
package Perlito5::AST::Call;
do { for ($_) {
    sub Perlito5::AST::Call::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $invocant) = $self->{'invocant'}->emit_perl5());
        if (($self->{'method'} eq 'postcircumfix:<[ ]>')) {
            return ((Perlito5::Perl5::tab($level) . $invocant . '->[' . $self->{'arguments'}->emit_perl5() . ']'))
        };
        if (($self->{'method'} eq 'postcircumfix:<{ }>')) {
            return ((Perlito5::Perl5::tab($level) . $invocant . '->{' . Perlito5::AST::Lookup->autoquote($self->{'arguments'})->emit_perl5($level) . '}'))
        };
        ((my  $meth) = $self->{'method'});
        if (($meth eq 'postcircumfix:<( )>')) {
            ($meth = '')
        };
        if ((ref($meth) eq 'Perlito5::AST::Var')) {
            ($meth = $meth->emit_perl5())
        };
        (Perlito5::Perl5::tab($level) . $invocant . '->' . $meth . '(' . join(', ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')')
    }
}};
package Perlito5::AST::Apply;
do { for ($_) {
    ((my  %op_prefix_perl5) = ('say', 'Perlito5::Runtime::say', 'print', 'print', 'keys', 'keys', 'values', 'values', 'warn', 'warn', 'prefix:<!>', '!', 'prefix:<++>', '++', 'prefix:<-->', '--', 'prefix:<+>', '+', 'prefix:<->', '-', 'prefix:<-d>', '-d', 'prefix:<-e>', '-e', 'prefix:<-f>', '-f', 'prefix:<not>', 'not'));
    ((my  %op_infix_perl5) = ('list:<,>', ', ', 'list:<.>', ' . ', 'infix:<+>', ' + ', 'infix:<->', ' - ', 'infix:<*>', ' * ', 'infix:</>', ' / ', 'infix:<%>', ' % ', 'infix:<**>', ' ** ', 'infix:<>>', ' > ', 'infix:<<>', ' < ', 'infix:<>=>', ' >= ', 'infix:<<=>', ' <= ', 'infix:<&>', ' & ', 'infix:<|>', ' | ', 'infix:<^>', ' ^ ', 'infix:<&&>', ' && ', 'infix:<||>', ' || ', 'infix:<and>', ' and ', 'infix:<or>', ' or ', 'infix:<//>', ' // ', 'infix:<eq>', ' eq ', 'infix:<ne>', ' ne ', 'infix:<le>', ' le ', 'infix:<ge>', ' ge ', 'infix:<==>', ' == ', 'infix:<!=>', ' != ', 'infix:<=~>', ' =~ ', 'infix:<!~>', ' !~ '));
    sub Perlito5::AST::Apply::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $apply) = $self->op_assign());
        if ($apply) {
            return ($apply->emit_perl5($level))
        };
        ((my  $ns) = '');
        if ($self->{'namespace'}) {
            ($ns = ($self->{'namespace'} . '::'))
        };
        ((my  $code) = ($ns . $self->{'code'}));
        if ((ref($code) ne '')) {
            return ((Perlito5::Perl5::tab($level) . '(' . $self->{'code'}->emit_perl5() . ')->(' . join(', ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')'))
        };
        if (exists($op_infix_perl5{$code})) {
            return ((Perlito5::Perl5::tab($level) . '(' . join($op_infix_perl5{$code}, (map($_->emit_perl5(), @{$self->{'arguments'}}))) . ')'))
        };
        if (exists($op_prefix_perl5{$code})) {
            return ((Perlito5::Perl5::tab($level) . $op_prefix_perl5{$code} . '(' . join(', ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')'))
        };
        if (($self->{'code'} eq 'p5:s')) {
            return ((Perlito5::Perl5::tab($level) . 's!' . $self->{'arguments'}->[0]->{'buf'} . '!' . $self->{'arguments'}->[1]->{'buf'} . '!' . $self->{'arguments'}->[2]))
        };
        if (($self->{'code'} eq 'p5:m')) {
            (my  $s);
            if ($self->{'arguments'}->[0]->isa('Perlito5::AST::Val::Buf')) {
                ($s = $self->{'arguments'}->[0]->{'buf'})
            }
            else {
                for my $ast (@{$self->{'arguments'}->[0]->{'arguments'}}) {
                    if ($ast->isa('Perlito5::AST::Val::Buf')) {
                        ($s = ($s . $ast->{'buf'}))
                    }
                    else {
                        ($s = ($s . $ast->emit_perl5()))
                    }
                }
            };
            return ((Perlito5::Perl5::tab($level) . 'm!' . $s . '!' . $self->{'arguments'}->[1]))
        };
        if (($self->{'code'} eq 'p5:tr')) {
            return ((Perlito5::Perl5::tab($level) . 'tr!' . $self->{'arguments'}->[0]->{'buf'} . '!' . $self->{'arguments'}->[1]->{'buf'} . '!'))
        };
        if (($code eq '__PACKAGE__')) {
            return (('"' . $Perlito5::PKG_NAME . '"'))
        };
        if (($self->{'code'} eq 'package')) {
            return ((Perlito5::Perl5::tab($level) . 'package ' . $self->{'namespace'}))
        };
        if (($code eq 'undef')) {
            return ((Perlito5::Perl5::tab($level) . 'undef()'))
        };
        if (($code eq 'scalar')) {
            return ((Perlito5::Perl5::tab($level) . 'scalar(' . ($self->{'arguments'}->[0]->emit_perl5()) . ')'))
        };
        if (($code eq 'pop')) {
            return ((Perlito5::Perl5::tab($level) . 'pop(' . ($self->{'arguments'}->[0]->emit_perl5()) . ')'))
        };
        if (($code eq 'push')) {
            return ((Perlito5::Perl5::tab($level) . 'push(' . ($self->{'arguments'}->[0]->emit_perl5()) . ', ' . ($self->{'arguments'}->[1])->emit_perl5() . ' )'))
        };
        if (($code eq 'shift')) {
            if (($self->{'arguments'} && @{$self->{'arguments'}})) {
                return ((Perlito5::Perl5::tab($level) . 'shift(' . join(' ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')'))
            };
            return ('shift()')
        };
        if (($code eq 'unshift')) {
            return ((Perlito5::Perl5::tab($level) . 'unshift(' . $self->{'arguments'}->[0]->emit_perl5() . ', ' . $self->{'arguments'}->[1]->emit_perl5() . ')'))
        };
        if (($code eq 'map')) {
            ((my  $str) = shift(@{$self->{'arguments'}}));
            return ((Perlito5::Perl5::tab($level) . 'map(' . $str->emit_perl5() . ', ' . join(',', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'infix:<x>')) {
            return (('join("", ' . join(' x ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'infix:<=>>')) {
            return ((Perlito5::Perl5::tab($level) . Perlito5::AST::Lookup->autoquote($self->{'arguments'}->[0])->emit_perl5($level) . ', ' . $self->{'arguments'}->[1]->emit_perl5($level)))
        };
        if (($code eq 'join')) {
            ((my  $str) = shift(@{$self->{'arguments'}}));
            return ((Perlito5::Perl5::tab($level) . 'join(' . $str->emit_perl5() . ', ' . join(',', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'circumfix:<[ ]>')) {
            return ((Perlito5::Perl5::tab($level) . '[' . join(', ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ']'))
        };
        if (($code eq 'circumfix:<{ }>')) {
            return ((Perlito5::Perl5::tab($level) . '{' . join(', ', map($_->emit_perl5(), @{$self->{'arguments'}})) . '}'))
        };
        if (($code eq 'prefix:<' . chr(92) . '>')) {
            return ((Perlito5::Perl5::tab($level) . chr(92) . join(' ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ''))
        };
        if (($code eq 'prefix:<$>')) {
            return ((Perlito5::Perl5::tab($level) . '${' . join(' ', map($_->emit_perl5(), @{$self->{'arguments'}})) . '}'))
        };
        if (($code eq 'prefix:<@>')) {
            return ((Perlito5::Perl5::tab($level) . '@{' . join(' ', map($_->emit_perl5(), @{$self->{'arguments'}})) . '}'))
        };
        if (($code eq 'prefix:<%>')) {
            return ((Perlito5::Perl5::tab($level) . '%{' . join(' ', map($_->emit_perl5(), @{$self->{'arguments'}})) . '}'))
        };
        if (($code eq 'prefix:<&>')) {
            return ((Perlito5::Perl5::tab($level) . '&{' . join(' ', map($_->emit_perl5(), @{$self->{'arguments'}})) . '}'))
        };
        if (($code eq 'prefix:<$#>')) {
            return ((Perlito5::Perl5::tab($level) . '$#{' . join(' ', map($_->emit_perl5(), @{$self->{'arguments'}})) . '}'))
        };
        if (($code eq 'postfix:<++>')) {
            return ((Perlito5::Perl5::tab($level) . '(' . join(' ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')++'))
        };
        if (($code eq 'postfix:<-->')) {
            return ((Perlito5::Perl5::tab($level) . '(' . join(' ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')--'))
        };
        if (($code eq 'infix:<..>')) {
            return ((Perlito5::Perl5::tab($level) . '(' . join(' .. ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'ternary:<? :>')) {
            return ((Perlito5::Perl5::tab($level) . '(' . $self->{'arguments'}->[0]->emit_perl5() . ' ? ' . $self->{'arguments'}->[1]->emit_perl5() . ' : ' . $self->{'arguments'}->[2]->emit_perl5() . ')'))
        };
        if (($code eq 'circumfix:<( )>')) {
            return ((Perlito5::Perl5::tab($level) . '(' . join(', ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'infix:<=>')) {
            return ((Perlito5::Perl5::tab($level) . emit_perl5_bind($self->{'arguments'}->[0], $self->{'arguments'}->[1])))
        };
        if (($code eq 'require')) {
            return (('Perlito5::Grammar::Use::require(' . $self->{'arguments'}->[0]->emit_perl5() . ')'))
        };
        if (($code eq 'do')) {
            ((my  $ast) = Perlito5::AST::Apply->new('code', 'eval', 'namespace', '', 'arguments', [Perlito5::AST::Apply->new('code', 'slurp', 'namespace', 'Perlito5::IO', 'arguments', $self->{'arguments'})]));
            return ($ast->emit_perl5($level))
        };
        if (($code eq 'eval')) {
            ((my  $arg) = $self->{'arguments'}->[0]);
            (my  $eval);
            if ($arg->isa('Perlito5::AST::Do')) {
                ($eval = $arg->emit_perl5(($level + 1), $wantarray))
            }
            else {
                ($eval = ('(do { ' . 'my $m = Perlito5::Grammar->exp_stmts(' . '"do {" . ' . $arg->emit_perl5(($level + 1), 'scalar') . ' . "}", 0);' . 'my $source = Perlito5::Match::flat($m)->[0]->emit_perl5(0, "scalar");' . 'eval $source;' . '})'))
            };
            return ((Perlito5::Perl5::tab($level) . $eval))
        };
        if (($code eq 'return')) {
            return ((Perlito5::Perl5::tab($level) . 'return (' . join(', ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')'))
        };
        if (($self->{'bareword'} && !(@{$self->{'arguments'}}))) {
            return ((Perlito5::Perl5::tab($level) . $code))
        };
        (Perlito5::Perl5::tab($level) . $code . '(' . join(', ', map($_->emit_perl5(), @{$self->{'arguments'}})) . ')')
    };
    sub Perlito5::AST::Apply::emit_perl5_bind {
        ((my  $parameters) = shift());
        ((my  $arguments) = shift());
        if ($parameters->isa('Perlito5::AST::Call')) {
            if ((($parameters->method() eq 'postcircumfix:<{ }>') || ($parameters->method() eq 'postcircumfix:<[ ]>'))) {
                return (('(' . $parameters->emit_perl5() . ' = ' . $arguments->emit_perl5() . ')'))
            }
        };
        ('(' . $parameters->emit_perl5() . ' = ' . $arguments->emit_perl5() . ')')
    }
}};
package Perlito5::AST::If;
do { for ($_) {
    sub Perlito5::AST::If::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        return ((Perlito5::Perl5::tab($level) . 'if (' . $self->{'cond'}->emit_perl5() . ') {' . chr(10) . (($self->{'body'} ? (join(';' . chr(10), map($_->emit_perl5(($level + 1)), @{$self->{'body'}->stmts()})) . chr(10)) : '')) . Perlito5::Perl5::tab($level) . '}' . ((($self->{'otherwise'} && scalar(@{$self->{'otherwise'}->stmts()})) ? ((chr(10) . Perlito5::Perl5::tab($level) . 'else {' . chr(10) . join(';' . chr(10), map($_->emit_perl5(($level + 1)), @{$self->{'otherwise'}->stmts()})) . chr(10) . Perlito5::Perl5::tab($level) . '}')) : ''))))
    }
}};
package Perlito5::AST::When;
do { for ($_) {
    sub Perlito5::AST::When::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        return ((Perlito5::Perl5::tab($level) . 'when (' . $self->{'cond'}->emit_perl5() . ') {' . chr(10) . (($self->{'body'} ? (join(';' . chr(10), map($_->emit_perl5(($level + 1)), @{$self->{'body'}->stmts()})) . chr(10)) : '')) . Perlito5::Perl5::tab($level) . '}'))
    }
}};
package Perlito5::AST::While;
do { for ($_) {
    sub Perlito5::AST::While::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $cond) = $self->{'cond'});
        (Perlito5::Perl5::tab($level) . 'for ( ' . (($self->{'init'} ? ($self->{'init'}->emit_perl5() . '; ') : '; ')) . (($cond ? ($cond->emit_perl5() . '; ') : '; ')) . (($self->{'continue'} ? ($self->{'continue'}->emit_perl5() . ' ') : ' ')) . ') {' . chr(10) . join(';' . chr(10), map($_->emit_perl5(($level + 1)), @{$self->{'body'}->stmts()})) . chr(10) . Perlito5::Perl5::tab($level) . '}')
    }
}};
package Perlito5::AST::For;
do { for ($_) {
    sub Perlito5::AST::For::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (my  $cond);
        if ((ref($self->{'cond'}) eq 'ARRAY')) {
            ($cond = ((($self->{'cond'}->[0] ? ($self->{'cond'}->[0]->emit_javascript(($level + 1)) . '; ') : '; ')) . (($self->{'cond'}->[1] ? ($self->{'cond'}->[1]->emit_javascript(($level + 1)) . '; ') : '; ')) . (($self->{'cond'}->[2] ? ($self->{'cond'}->[2]->emit_javascript(($level + 1)) . ' ') : ' '))))
        }
        else {
            ($cond = $self->{'cond'}->emit_perl5())
        };
        (my  $sig);
        if ($self->{'body'}->sig()) {
            ($sig = ('my ' . $self->{'body'}->sig()->emit_perl5() . ' '))
        };
        return ((Perlito5::Perl5::tab($level) . 'for ' . $sig . '(' . $cond . ') {' . chr(10) . join(';' . chr(10), map($_->emit_perl5(($level + 1)), @{$self->{'body'}->stmts()})) . chr(10) . Perlito5::Perl5::tab($level) . '}'))
    }
}};
package Perlito5::AST::Decl;
do { for ($_) {
    sub Perlito5::AST::Decl::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $decl) = $self->{'decl'});
        ((my  $str) = ('(' . $self->{'decl'} . ' ' . $self->{'type'} . ' ' . $self->{'var'}->emit_perl5() . ')'));
        return ((Perlito5::Perl5::tab($level) . $str))
    }
}};
package Perlito5::AST::Sub;
do { for ($_) {
    sub Perlito5::AST::Sub::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $name) = '');
        if ($self->{'name'}) {
            ($name = ($self->{'namespace'} . '::' . $self->{'name'} . ' '))
        };
        ((my  $sig) = $self->{'sig'});
        ((my  $i) = 0);
        (Perlito5::Perl5::tab($level) . 'sub ' . $name . '{' . chr(10) . join(';' . chr(10), map($_->emit_perl5(($level + 1)), @{$self->{'block'}})) . chr(10) . Perlito5::Perl5::tab($level) . '}')
    }
}};
package Perlito5::AST::Do;
do { for ($_) {
    sub Perlito5::AST::Do::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $block) = $self->simplify()->block());
        (Perlito5::Perl5::tab($level) . '(do {' . chr(10) . join(';' . chr(10), map((defined($_) && $_->emit_perl5(($level + 1))), @{$block})) . chr(10) . Perlito5::Perl5::tab($level) . '})')
    }
}};
package Perlito5::AST::Use;
do { for ($_) {
    sub Perlito5::AST::Use::emit_perl5 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        if ((($self->{'mod'} eq 'strict') || ($self->{'mod'} eq 'feature'))) {
            return ((chr(10) . Perlito5::Perl5::tab($level) . '# ' . $self->{'code'} . ' ' . $self->{'mod'} . chr(10)))
        };
        (Perlito5::Perl5::tab($level) . $self->{'code'} . ' ' . $self->{'mod'})
    }
}};

1;
