# Do not edit this file - Generated by Perlito5 8.0
use v5;
use utf8;
use strict;
use warnings;
no warnings ('redefine', 'once', 'void', 'uninitialized', 'misc', 'recursion');
use Perlito5::Perl5::Runtime;
our $MATCH = Perlito5::Match->new();
package main;
package Perlito5::Precedence;
sub new {
    ((my  $class) = shift());
    bless((do {
    (my  %a);
    (do {
        ((my  $_i) = 0);
        ((my  @_a) = @_);
        for ( ; (($_i < scalar(@_a)));  ) {
            ($a{$_a[$_i]} = $_a[($_i + 1)]);
            ($_i = ($_i + 2))
        }
    });
    \%a
}), $class)
};
((my  $Operator) = (do {
    (my  %a);
    \%a
}));
((my  $Precedence) = (do {
    (my  %a);
    \%a
}));
((my  $Assoc) = (do {
    (my  %a);
    \%a
}));
((my  $Allow_space_before) = (do {
    (my  %a);
    \%a
}));
sub is_assoc_type {
    ((my  $assoc_type) = shift());
    ((my  $op_name) = shift());
    return ($Assoc->{$assoc_type}->{$op_name})
};
sub is_fixity_type {
    ((my  $fixity_type) = shift());
    ((my  $op_name) = shift());
    return ($Operator->{$fixity_type}->{$op_name})
};
sub is_term {
    ((my  $token) = shift());
    ((($token->[0] eq 'term')) || (($token->[0] eq 'postfix_or_term')))
};
sub is_ident_middle {
    ((my  $c) = shift());
    ((((($c ge 'a') && ($c le 'z'))) || ((($c ge '0') && ($c le '9')))) || (($c eq '_')))
};
((my  @Term_chars) = (2));
((my  @Term) = ((do {
    (my  %a);
    \%a
}), (do {
    (my  %a);
    \%a
}), (do {
    (my  %a);
    ($a{'->'} = sub  {
    Perlito5::Expression->arrow($_[0], $_[1])
});
    \%a
})));
(my  @Op);
(my  $End_token);
((my  @Op_chars) = (3, 2, 1));
sub op_parse {
    ((my  $self) = shift());
    ((my  $str) = shift());
    ((my  $pos) = shift());
    for my $tok (@{$End_token}) {
        ((my  $l) = length($tok));
        ((my  $s) = substr($str, $pos, $l));
        if ((($s eq $tok))) {
            ((my  $c1) = substr($str, (($pos + $l) - 1), 1));
            ((my  $c2) = substr($str, ($pos + $l), 1));
            if ((!(((is_ident_middle($c1) && ((is_ident_middle($c2) || ($c2 eq '(')))))))) {
                return (Perlito5::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1), ('capture' => (do {
    (my  @a);
    (my  @v);
    push(@a, 'end' );
    push(@a, $s );
    \@a
}))))
            }
        }
    };
    for my $len (@Term_chars) {
        ((my  $term) = substr($str, $pos, $len));
        if ((exists($Term[$len]->{$term}))) {
            ((my  $m) = $Term[$len]->{$term}->($str, $pos));
            if ($m->{('bool')}) {
                return ($m)
            }
        }
    };
    for my $len (@Op_chars) {
        ((my  $op) = substr($str, $pos, $len));
        if ((exists($Op[$len]->{$op}))) {
            ((my  $c1) = substr($str, (($pos + $len) - 1), 1));
            ((my  $c2) = substr($str, ($pos + $len), 1));
            if ((!(((is_ident_middle($c1) && ((is_ident_middle($c2) || ($c2 eq '(')))))))) {
                return (Perlito5::Match->new(('str' => $str), ('from' => $pos), ('to' => ($pos + $len)), ('bool' => 1), ('capture' => (do {
    (my  @a);
    (my  @v);
    push(@a, 'op' );
    push(@a, $op );
    \@a
}))))
            }
        }
    };
    return (Perlito5::Match->new(('bool' => 0)))
};
sub add_op {
    ((my  $fixity) = shift());
    ((my  $name) = shift());
    ((my  $precedence) = shift());
    ((my  $param) = shift());
    if ((!((defined($param))))) {
        ($param = (do {
    (my  %a);
    \%a
}))
    };
    ((my  $assoc) = ($param->{'assoc'} || 'left'));
    ($Operator->{$fixity}->{$name} = 1);
    ($Precedence->{$name} = $precedence);
    ($Assoc->{$assoc}->{$name} = 1);
    ($Allow_space_before->{$fixity}->{$name} = ($param->{'no_space_before'} ? 0 : 1));
    ($Op[length($name)]->{$name} = 1)
};
((my  $prec) = 100);
add_op('postfix', '.( )', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', '.[ ]', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', '.' . chr(123) . ' ' . chr(125), $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', '( )', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', '[ ]', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', 'funcall', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', 'funcall_no_params', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', 'methcall', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', 'methcall_no_params', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', 'block', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', 'hash', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
($prec = ($prec - 1));
add_op('prefix', '++', $prec);
add_op('prefix', '--', $prec);
add_op('postfix', '++', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
add_op('postfix', '--', $prec, (do {
    (my  %a);
    ($a{'no_space_before'} = 1);
    \%a
}));
($prec = ($prec - 1));
add_op('infix', '**', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
($prec = ($prec - 1));
add_op('prefix', chr(92), $prec);
add_op('prefix', '+', $prec);
add_op('prefix', '-', $prec);
add_op('prefix', chr(36), $prec);
add_op('prefix', chr(38), $prec);
add_op('prefix', '*', $prec);
add_op('prefix', chr(64), $prec);
add_op('prefix', chr(37), $prec);
add_op('prefix', chr(33), $prec);
add_op('prefix', chr(63), $prec);
($prec = ($prec - 1));
add_op('infix', '*', $prec);
add_op('infix', chr(47), $prec);
($prec = ($prec - 1));
add_op('infix', '+', $prec);
add_op('infix', '-', $prec);
($prec = ($prec - 1));
add_op('infix', 'x', $prec);
($prec = ($prec - 1));
add_op('infix', '.', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'list');
    \%a
}));
($prec = ($prec - 1));
add_op('infix', chr(38), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'list');
    \%a
}));
add_op('prefix', chr(38), $prec);
($prec = ($prec - 1));
add_op('infix', chr(124), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'list');
    \%a
}));
add_op('prefix', chr(124), $prec);
($prec = ($prec - 1));
add_op('infix', '<' . chr(61) . '>', $prec);
add_op('infix', 'leg', $prec);
add_op('infix', 'cmp', $prec);
add_op('infix', 'does', $prec);
add_op('infix', 'but', $prec);
add_op('infix', '..', $prec);
($prec = ($prec - 1));
add_op('infix', 'ne', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', 'eq', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', 'lt', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', 'le', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', 'gt', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', 'ge', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', '<' . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', '>' . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', chr(61) . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', chr(33) . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', '<', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', '>', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
add_op('infix', chr(126) . chr(126), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'chain');
    \%a
}));
($prec = ($prec - 1));
add_op('infix', chr(38) . chr(38), $prec);
($prec = ($prec - 1));
add_op('infix', chr(124) . chr(124), $prec);
add_op('infix', chr(47) . chr(47), $prec);
($prec = ($prec - 1));
add_op('ternary', chr(63) . chr(63) . ' ' . chr(33) . chr(33), $prec);
add_op('ternary', chr(63) . ' :', $prec);
($prec = ($prec - 1));
add_op('infix', chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', chr(124) . chr(124) . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', chr(38) . chr(38) . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', chr(124) . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', chr(38) . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', chr(47) . chr(47) . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', '+' . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', '-' . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', '*' . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', chr(47) . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
add_op('infix', '.' . chr(61), $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'right');
    \%a
}));
($prec = ($prec - 1));
add_op('prefix', 'not', $prec);
($prec = ($prec - 1));
add_op('infix', chr(61) . '>', $prec);
($prec = ($prec - 1));
add_op('list', ',', $prec, (do {
    (my  %a);
    ($a{'assoc'} = 'list');
    \%a
}));
($prec = ($prec - 1));
add_op('infix', 'and', $prec);
($prec = ($prec - 1));
add_op('infix', 'or', $prec);
($prec = ($prec - 1));
add_op('infix', '*start*', $prec);
sub precedence_parse {
    ((my  $self) = shift());
    ((my  $get_token) = $self->{'get_token'});
    ((my  $reduce) = $self->{'reduce'});
    ((my  $last_end_token) = $End_token);
    ($End_token = $self->{'end_token'});
    ((my  $op_stack) = (do {
    (my  @a);
    (my  @v);
    \@a
}));
    ((my  $num_stack) = (do {
    (my  @a);
    (my  @v);
    \@a
}));
    ((my  $last) = (do {
    (my  @a);
    (my  @v);
    push(@a, 'op' );
    push(@a, '*start*' );
    \@a
}));
    ((my  $last_has_space) = 0);
    ((my  $token) = $get_token->());
    if ((($token->[0]) eq 'space')) {
        ($token = $get_token->())
    };
    for ( ; ((defined($token)) && (($token->[0] ne 'end')));  ) {
        if (((($token->[1] eq ',')) && (((($last->[1] eq '*start*')) || (($last->[1] eq ',')))))) {
            push(@{$num_stack}, (do {
    (my  @a);
    (my  @v);
    push(@a, 'term' );
    push(@a, undef() );
    \@a
}) )
        };
        if ((($Operator->{'prefix'}->{$token->[1]} && (((($last->[1] eq '*start*')) || !((is_term($last)))))))) {
            ($token->[0] = 'prefix');
            unshift(@{$op_stack}, $token)
        }
        else {
            if (((($Operator->{'postfix'})->{$token->[1]} && is_term($last)) && (($Allow_space_before->{'postfix'}->{$token->[1]} || !(($last_has_space)))))) {
                ((my  $pr) = $Precedence->{$token->[1]});
                for ( ; (scalar(@{$op_stack}) && (($pr <= $Precedence->{($op_stack->[0])->[1]})));  ) {
                    $reduce->($op_stack, $num_stack)
                };
                if ((($token->[0]) ne 'postfix_or_term')) {
                    ($token->[0] = 'postfix')
                };
                unshift(@{$op_stack}, $token)
            }
            else {
                if ((((($token->[1] eq 'block')) && is_term($last)) && $last_has_space)) {
                    for ( ; (scalar(@{$op_stack}));  ) {
                        $reduce->($op_stack, $num_stack)
                    };
                    push(@{$num_stack}, $token );
                    ($End_token = $last_end_token);
                    return ($num_stack)
                }
                else {
                    if ((is_term($token))) {
                        if ((is_term($last))) {
                            Perlito5::Runtime::say((chr(35) . '      last:  '), $last);
                            Perlito5::Runtime::say((chr(35) . '      token: '), $token);
                            Perlito5::Runtime::say((chr(35) . '      space: '), $last_has_space);
                            die(('Value tokens must be separated by an operator'))
                        };
                        ($token->[0] = 'term');
                        push(@{$num_stack}, $token )
                    }
                    else {
                        if (($Precedence->{$token->[1]})) {
                            ((my  $pr) = $Precedence->{$token->[1]});
                            if (($Assoc->{'right'}->{$token->[1]})) {
                                for ( ; ((scalar(@{$op_stack}) && (($pr < $Precedence->{($op_stack->[0])->[1]}))));  ) {
                                    $reduce->($op_stack, $num_stack)
                                }
                            }
                            else {
                                for ( ; ((scalar(@{$op_stack}) && (($pr <= $Precedence->{($op_stack->[0])->[1]}))));  ) {
                                    $reduce->($op_stack, $num_stack)
                                }
                            };
                            if (($Operator->{'ternary'}->{$token->[1]})) {
                                ($token->[0] = 'ternary')
                            }
                            else {
                                ($token->[0] = 'infix')
                            };
                            unshift(@{$op_stack}, $token)
                        }
                        else {
                            die(('Unknown token: ' . chr(39)), $token->[1], (chr(39)))
                        }
                    }
                }
            }
        };
        ($last = $token);
        ($token = $get_token->());
        if ((($token->[0] eq 'space'))) {
            ($token = $get_token->());
            ($last_has_space = 1)
        }
        else {
            ($last_has_space = 0)
        }
    };
    if (((defined($token) && (($token->[0] ne 'end'))))) {
        die(('Unexpected end token: '), $token)
    };
    for ( ; (scalar(@{$op_stack}));  ) {
        $reduce->($op_stack, $num_stack)
    };
    ($End_token = $last_end_token);
    return ($num_stack)
};
1;

1;
