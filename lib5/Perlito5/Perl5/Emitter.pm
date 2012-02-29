# Do not edit this file - Generated by Perlito5 8.0
use v5;
use utf8;
use strict;
use warnings;
no warnings ('redefine', 'once', 'void', 'uninitialized', 'misc', 'recursion');
use Perlito5::Perl5::Runtime;
our $MATCH = Perlito5::Match->new();
package main;
use v5;
use Perlito5::AST;
package Perl5;
(do {
    sub tab {
        ((my  $level) = shift());
        (('    ') x $level)
    };
    ((my  %safe_char) = (('_' => 1), (',' => 1), ('.' => 1), (':' => 1), ('-' => 1), ('+' => 1), ('*' => 1), (' ' => 1), ('(' => 1), (')' => 1), ('<' => 1), ('>' => 1), ('[' => 1), (']' => 1)));
    sub escape_string {
        ((my  $s) = shift());
        (my  @out);
        ((my  $tmp) = '');
        if (($s eq '')) {
            return ((chr(39) . chr(39)))
        };
        for my $i ((0 .. (length($s) - 1))) {
            ((my  $c) = substr($s, $i, 1));
            if (((((((($c ge 'a') && ($c le 'z'))) || ((($c ge 'A') && ($c le 'Z')))) || ((($c ge '0') && ($c le '9')))) || exists($safe_char{$c})))) {
                ($tmp = ($tmp . $c))
            }
            else {
                if (($tmp ne '')) {
                    push(@out, (chr(39) . $tmp . chr(39)) )
                };
                push(@out, ('chr(' . ord($c) . (')')) );
                ($tmp = '')
            }
        };
        if (($tmp ne '')) {
            push(@out, (chr(39) . $tmp . chr(39)) )
        };
        return (join(' . ', @out))
    }
});
package CompUnit;
(do {
    sub emit_perl5 {
        $_[0]->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (my  @body);
        for ((@{$self->{('body')}})) {
            if ((defined($_))) {
                push(@body, $_ )
            }
        };
        (Perl5::tab($level) . 'package ' . $self->{('name')} . (chr(59)) . (chr(10)) . join((chr(59) . chr(10)), map($_->emit_perl5_indented($level), @body)) . (chr(59) . chr(10)) . (chr(10)))
    };
    sub emit_perl5_program {
        ((my  $comp_units) = $_[0]);
        ((my  $str) = ('' . ('use v5' . chr(59) . chr(10)) . ('use utf8' . chr(59) . chr(10)) . ('use strict' . chr(59) . chr(10)) . ('use warnings' . chr(59) . chr(10)) . ('no warnings (' . chr(39) . 'redefine' . chr(39) . ', ' . chr(39) . 'once' . chr(39) . ', ' . chr(39) . 'void' . chr(39) . ', ' . chr(39) . 'uninitialized' . chr(39) . ', ' . chr(39) . 'misc' . chr(39) . ', ' . chr(39) . 'recursion' . chr(39) . ')' . chr(59) . chr(10)) . ('use Perlito5::Perl5::Runtime' . chr(59) . chr(10)) . ('our ' . chr(36) . 'MATCH ' . chr(61) . ' Perlito5::Match->new()' . chr(59) . chr(10))));
        for my $comp_unit (@{$comp_units}) {
            ($str = ($str . $comp_unit->emit_perl5_indented(0)))
        };
        ($str = ($str . ('1' . chr(59) . chr(10))));
        return ($str)
    }
});
package Val::Int;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perl5::tab($level) . $self->{('int')})
    }
});
package Val::Num;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perl5::tab($level) . $self->{('num')})
    }
});
package Val::Buf;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perl5::tab($level) . Perl5::escape_string($self->{('buf')}))
    }
});
package Lit::Block;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perl5::tab($level) . ('sub ' . chr(123) . chr(10)) . join((chr(59) . chr(10)), map($_->emit_perl5_indented(($level + 1)), @{$self->{('stmts')}})) . (chr(10)) . Perl5::tab($level) . (chr(125)))
    }
});
package Index;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        if ((($self->{('obj')}->isa('Var') && ($self->{('obj')}->sigil() eq chr(36))))) {
            ((my  $v) = $self->{('obj')});
            return (($v->emit_perl5_indented($level) . '[' . $self->{('index_exp')}->emit_perl5() . ']'))
        };
        ($self->{('obj')}->emit_perl5_indented($level) . '->[' . $self->{('index_exp')}->emit_perl5() . ']')
    }
});
package Lookup;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        if ((($self->{('obj')}->isa('Var') && ($self->{('obj')}->sigil() eq chr(36))))) {
            ((my  $v) = $self->{('obj')});
            return (($v->emit_perl5_indented($level) . chr(123) . $self->{('index_exp')}->emit_perl5() . chr(125)))
        };
        ($self->{('obj')}->emit_perl5_indented($level) . '->' . chr(123) . $self->{('index_exp')}->emit_perl5() . chr(125))
    }
});
package Var;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $ns) = '');
        if (($self->{('namespace')})) {
            ($ns = ($self->{('namespace')} . '::'))
        };
        return ((Perl5::tab($level) . $self->{('sigil')} . $ns . $self->{('name')}))
    };
    sub plain_name {
        ((my  $self) = $_[0]);
        if (($self->{('namespace')})) {
            return (($self->{('namespace')} . '::' . $self->{('name')}))
        };
        return ($self->{('name')})
    }
});
package Proto;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (Perl5::tab($level) . $self->{('name')})
    }
});
package Call;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $invocant) = $self->{('invocant')}->emit_perl5());
        if ((($self->{('method')} eq 'postcircumfix:<[ ]>'))) {
            return ((Perl5::tab($level) . $invocant . '->[' . $self->{('arguments')}->emit_perl5() . ']'))
        };
        if ((($self->{('method')} eq 'postcircumfix:<' . chr(123) . ' ' . chr(125) . '>'))) {
            return ((Perl5::tab($level) . $invocant . '->' . chr(123) . $self->{('arguments')}->emit_perl5() . chr(125)))
        };
        ((my  $meth) = $self->{('method')});
        if ((($meth eq 'postcircumfix:<( )>'))) {
            ($meth = '')
        };
        (Perl5::tab($level) . $invocant . '->' . $meth . '(' . join(', ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')')
    }
});
package Apply;
(do {
    ((my  %op_prefix_perl5) = (('say' => 'Perlito5::Runtime::say'), ('print' => 'print'), ('grep' => 'Perlito5::Runtime::grep'), ('sort' => 'Perlito5::Runtime::sort'), ('keys' => 'keys'), ('values' => 'values'), ('warn' => 'warn'), ('prefix:<' . chr(33) . '>' => chr(33)), ('prefix:<++>' => '++'), ('prefix:<-->' => '--'), ('prefix:<+>' => '+')));
    ((my  %op_infix_perl5) = (('list:<.>' => ' . '), ('infix:<+>' => ' + '), ('infix:<->' => ' - '), ('infix:<*>' => ' * '), ('infix:<' . chr(47) . '>' => ' ' . chr(47) . ' '), ('infix:<>>' => ' > '), ('infix:<<>' => ' < '), ('infix:<>' . chr(61) . '>' => ' >' . chr(61) . ' '), ('infix:<<' . chr(61) . '>' => ' <' . chr(61) . ' '), ('infix:<x>' => ' x '), ('infix:<' . chr(38) . chr(38) . '>' => ' ' . chr(38) . chr(38) . ' '), ('infix:<' . chr(124) . chr(124) . '>' => ' ' . chr(124) . chr(124) . ' '), ('infix:<and>' => ' and '), ('infix:<or>' => ' or '), ('infix:<' . chr(47) . chr(47) . '>' => ' ' . chr(47) . chr(47) . ' '), ('infix:<eq>' => ' eq '), ('infix:<ne>' => ' ne '), ('infix:<le>' => ' le '), ('infix:<ge>' => ' ge '), ('infix:<' . chr(61) . chr(61) . '>' => ' ' . chr(61) . chr(61) . ' '), ('infix:<' . chr(33) . chr(61) . '>' => ' ' . chr(33) . chr(61) . ' '), ('infix:<' . chr(61) . '>>' => ' ' . chr(61) . '> ')));
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $apply) = $self->op_assign());
        if (($apply)) {
            return ($apply->emit_perl5_indented($level))
        };
        ((my  $ns) = '');
        if (($self->{('namespace')})) {
            ($ns = ($self->{('namespace')} . '::'))
        };
        ((my  $code) = ($ns . $self->{('code')}));
        if ((ref(($code ne '')))) {
            return ((Perl5::tab($level) . '(' . $self->{('code')}->emit_perl5() . ')->(' . join(', ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')'))
        };
        if ((exists($op_infix_perl5{$code}))) {
            return ((Perl5::tab($level) . '(' . join($op_infix_perl5{$code}, (map($_->emit_perl5(), @{$self->{('arguments')}}))) . ')'))
        };
        if ((exists($op_prefix_perl5{$code}))) {
            return ((Perl5::tab($level) . $op_prefix_perl5{$code} . '(' . join(', ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')'))
        };
        if ((($self->{('code')} eq 'package'))) {
            return ((Perl5::tab($level) . 'package ' . $self->{('namespace')}))
        };
        if ((($code eq 'undef'))) {
            return ((Perl5::tab($level) . 'undef()'))
        };
        if ((($code eq 'scalar'))) {
            return ((Perl5::tab($level) . 'scalar(' . ($self->{('arguments')}->[0]->emit_perl5()) . ')'))
        };
        if ((($code eq 'pop'))) {
            return ((Perl5::tab($level) . 'pop(' . ($self->{('arguments')}->[0]->emit_perl5()) . ')'))
        };
        if ((($code eq 'push'))) {
            return ((Perl5::tab($level) . 'push(' . ($self->{('arguments')}->[0]->emit_perl5()) . ', ' . ($self->{('arguments')}->[1])->emit_perl5() . ' )'))
        };
        if ((($code eq 'shift'))) {
            if ((($self->{('arguments')} && @{$self->{('arguments')}}))) {
                return ((Perl5::tab($level) . 'shift(' . join(' ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')'))
            };
            return ('shift()')
        };
        if ((($code eq 'unshift'))) {
            return ((Perl5::tab($level) . 'unshift(' . $self->{('arguments')}->[0]->emit_perl5() . ', ' . $self->{('arguments')}->[1]->emit_perl5() . ')'))
        };
        if ((($code eq 'map'))) {
            ((my  $str) = shift(@{$self->{('arguments')}}));
            return ((Perl5::tab($level) . 'map(' . $str->emit_perl5() . ', ' . join(',', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')'))
        };
        if ((($code eq 'join'))) {
            ((my  $str) = shift(@{$self->{('arguments')}}));
            return ((Perl5::tab($level) . 'join(' . $str->emit_perl5() . ', ' . join(',', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')'))
        };
        if ((($code eq 'circumfix:<[ ]>'))) {
            return ((Perl5::tab($level) . '[' . join(', ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ']'))
        };
        if ((($code eq 'circumfix:<' . chr(123) . ' ' . chr(125) . '>'))) {
            return ((Perl5::tab($level) . chr(123) . join(', ', map($_->emit_perl5(), @{$self->{('arguments')}})) . chr(125)))
        };
        if ((($code eq 'prefix:<' . chr(92) . '>'))) {
            return ((Perl5::tab($level) . chr(92) . join(' ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ''))
        };
        if ((($code eq 'prefix:<' . chr(36) . '>'))) {
            return ((Perl5::tab($level) . chr(36) . chr(123) . join(' ', map($_->emit_perl5(), @{$self->{('arguments')}})) . chr(125)))
        };
        if ((($code eq 'prefix:<' . chr(64) . '>'))) {
            return ((Perl5::tab($level) . chr(64) . chr(123) . join(' ', map($_->emit_perl5(), @{$self->{('arguments')}})) . chr(125)))
        };
        if ((($code eq 'prefix:<' . chr(37) . '>'))) {
            return ((Perl5::tab($level) . chr(37) . chr(123) . join(' ', map($_->emit_perl5(), @{$self->{('arguments')}})) . chr(125)))
        };
        if ((($code eq 'postfix:<++>'))) {
            return ((Perl5::tab($level) . '(' . join(' ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')++'))
        };
        if ((($code eq 'postfix:<-->'))) {
            return ((Perl5::tab($level) . '(' . join(' ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')--'))
        };
        if ((($code eq 'infix:<..>'))) {
            return ((Perl5::tab($level) . '(' . join(' .. ', map($_->emit_perl5(), @{$self->{('arguments')}})) . (')')))
        };
        if ((($code eq 'ternary:<' . chr(63) . chr(63) . ' ' . chr(33) . chr(33) . '>'))) {
            return ((Perl5::tab($level) . '(' . $self->{('arguments')}->[0]->emit_perl5() . ' ' . chr(63) . ' ' . $self->{('arguments')}->[1]->emit_perl5() . ' : ' . $self->{('arguments')}->[2]->emit_perl5() . ')'))
        };
        if ((($code eq 'circumfix:<( )>'))) {
            return ((Perl5::tab($level) . '(' . join(', ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')'))
        };
        if ((($code eq 'infix:<' . chr(61) . '>'))) {
            return ((Perl5::tab($level) . emit_perl5_bind($self->{('arguments')}->[0], $self->{('arguments')}->[1])))
        };
        if ((($code eq 'return'))) {
            return ((Perl5::tab($level) . 'return (' . join(', ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')'))
        };
        (Perl5::tab($level) . $code . '(' . join(', ', map($_->emit_perl5(), @{$self->{('arguments')}})) . ')')
    };
    sub emit_perl5_bind {
        ((my  $parameters) = shift());
        ((my  $arguments) = shift());
        if (($parameters->isa('Call'))) {
            if (((($parameters->method() eq 'postcircumfix:<' . chr(123) . ' ' . chr(125) . '>') || ($parameters->method() eq 'postcircumfix:<[ ]>')))) {
                return (('(' . $parameters->emit_perl5() . ' ' . chr(61) . ' ' . $arguments->emit_perl5() . ')'))
            }
        };
        ('(' . $parameters->emit_perl5() . ' ' . chr(61) . ' ' . $arguments->emit_perl5() . ')')
    }
});
package If;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        return ((Perl5::tab($level) . 'if (' . $self->{('cond')}->emit_perl5() . (') ' . chr(123) . chr(10)) . (($self->{('body')} ? (join((chr(59) . chr(10)), map($_->emit_perl5_indented(($level + 1)), @{$self->{('body')}->stmts()})) . (chr(10))) : '')) . Perl5::tab($level) . (chr(125)) . ((($self->{('otherwise')} && scalar(@{$self->{('otherwise')}->stmts()})) ? ((chr(10) . Perl5::tab($level) . ('else ' . chr(123) . chr(10)) . join((chr(59) . chr(10)), map($_->emit_perl5_indented(($level + 1)), @{$self->{('otherwise')}->stmts()})) . (chr(10)) . Perl5::tab($level) . (chr(125)))) : ''))))
    }
});
package While;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $cond) = $self->{('cond')});
        (Perl5::tab($level) . 'for ( ' . (($self->{('init')} ? ($self->{('init')}->emit_perl5() . chr(59) . ' ') : chr(59) . ' ')) . (($cond ? ($cond->emit_perl5() . chr(59) . ' ') : chr(59) . ' ')) . (($self->{('continue')} ? ($self->{('continue')}->emit_perl5() . ' ') : ' ')) . ') ' . chr(123) . (chr(10)) . join((chr(59) . chr(10)), map($_->emit_perl5_indented(($level + 1)), @{$self->{('body')}->stmts()})) . (chr(10)) . Perl5::tab($level) . (chr(125)))
    }
});
package For;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $cond) = $self->{('cond')});
        (my  $sig);
        if (($self->{('body')}->sig())) {
            ($sig = ('my ' . $self->{('body')}->sig()->emit_perl5() . ' '))
        };
        return ((Perl5::tab($level) . 'for ' . $sig . '(' . $cond->emit_perl5() . ') ' . chr(123) . (chr(10)) . join((chr(59) . chr(10)), map($_->emit_perl5_indented(($level + 1)), @{$self->{('body')}->stmts()})) . (chr(10)) . Perl5::tab($level) . (chr(125))))
    }
});
package Decl;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $decl) = $self->{('decl')});
        ((my  $name) = $self->{('var')}->plain_name());
        ((my  $str) = ('(' . $self->{('decl')} . ' ' . $self->{('type')} . ' ' . $self->{('var')}->emit_perl5() . ')'));
        return ((Perl5::tab($level) . $str))
    }
});
package Sub;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $sig) = $self->{('sig')});
        ((my  $pos) = $sig->positional());
        ((my  $i) = 0);
        (Perl5::tab($level) . 'sub ' . $self->{('name')} . (' ' . chr(123) . chr(10)) . join((chr(59) . chr(10)), map($_->emit_perl5_indented(($level + 1)), @{$self->{('block')}})) . (chr(10)) . Perl5::tab($level) . (chr(125)))
    }
});
package Do;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        ((my  $block) = $self->simplify()->block());
        (Perl5::tab($level) . ('(do ' . chr(123) . chr(10)) . join((chr(59) . chr(10)), map((defined($_) && $_->emit_perl5_indented(($level + 1))), @{$block})) . (chr(10)) . Perl5::tab($level) . (chr(125) . ')'))
    }
});
package Use;
(do {
    sub emit_perl5 {
        ((my  $self) = $_[0]);
        $self->emit_perl5_indented(0)
    };
    sub emit_perl5_indented {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        if (((($self->{('mod')} eq 'strict') || ($self->{('mod')} eq 'feature')))) {
            return ((chr(10) . Perl5::tab($level) . (chr(35) . ' use ') . $self->{('mod')} . (chr(10))))
        };
        (Perl5::tab($level) . 'use ' . $self->{('mod')})
    }
});

1;
