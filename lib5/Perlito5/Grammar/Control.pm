# Do not edit this file - Generated by Perlito5 8.0
use v5;
use utf8;
use strict;
use warnings;
no warnings ('redefine', 'once', 'void', 'uninitialized', 'misc', 'recursion');
use Perlito5::Perl5::Runtime;
our $MATCH = Perlito5::Match->new();
package main;
package Perlito5::Grammar;
sub unless {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = Perlito5::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
    ($MATCH->{('bool')} = (((do {
    ((my  $pos1) = $MATCH->{('to')});
    ((do {
    ((((((((((('u' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')}))))) && ((('n' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('l' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('e' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('s' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('s' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = $grammar->ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $m2) = $grammar->exp($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $body) = $MATCH->{('exp')}->flat()->{'end_block'});
    if ((!(defined($body)))) {
        die(('Missing code block in ' . chr(39) . 'unless' . chr(39)))
    };
    ($MATCH->{('capture')} = If->new(('cond' => $MATCH->{('exp')}->flat()->{'exp'}), ('body' => Lit::Block->new(('stmts' => []))), ('otherwise' => $body)));
    1
})))
}))
}))));
    $MATCH
};
sub if {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = Perlito5::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
    ($MATCH->{('bool')} = (((do {
    ((my  $pos1) = $MATCH->{('to')});
    ((do {
    ((((((('i' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')}))))) && ((('f' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = $grammar->ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $m2) = $grammar->exp($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $pos1) = $MATCH->{('to')});
    ((((do {
    ((((((((do {
    ((my  $m2) = $grammar->opt_ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
})) && ((('e' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('l' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('s' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('e' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = $grammar->exp2($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'exp2'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $body) = $MATCH->{('exp')}->flat()->{'end_block'});
    ((my  $otherwise) = ($MATCH->{('exp2')}->flat())->{'exp'});
    if ((!(defined($body)))) {
        die(('Missing code block in ' . chr(39) . 'if' . chr(39)))
    };
    if ((!((defined($otherwise))))) {
        die(('Missing code block in ' . chr(39) . 'else' . chr(39)))
    };
    ($MATCH->{('capture')} = If->new(('cond' => $MATCH->{('exp')}->flat()->{'exp'}), ('body' => $body), ('otherwise' => $otherwise)));
    1
})))
})) || ((do {
    ($MATCH->{('to')} = $pos1);
    ((((((((do {
    ((my  $m2) = $grammar->opt_ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
})) && ((('e' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('l' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('s' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = $grammar->if($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'if'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $body) = $MATCH->{('exp')}->flat()->{'end_block'});
    if ((!(defined($body)))) {
        die(('Missing code block in ' . chr(39) . 'if' . chr(39)))
    };
    ($MATCH->{('capture')} = If->new(('cond' => $MATCH->{('exp')}->flat()->{'exp'}), ('body' => $body), ('otherwise' => Lit::Block->new(('stmts' => [$MATCH->{('if')}->flat()])))));
    1
}))))
}))) || ((do {
    ($MATCH->{('to')} = $pos1);
    (((do {
    ((my  $body) = $MATCH->{('exp')}->flat()->{'end_block'});
    if ((!(defined($body)))) {
        die(('Missing code block in ' . chr(39) . 'if' . chr(39)))
    };
    ($MATCH->{('capture')} = If->new(('cond' => $MATCH->{('exp')}->flat()->{'exp'}), ('body' => $body), ('otherwise' => Lit::Block->new(('stmts' => [])))));
    1
})))
})))
})))
}))
}))));
    $MATCH
};
sub when {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = Perlito5::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
    ($MATCH->{('bool')} = (((do {
    ((my  $pos1) = $MATCH->{('to')});
    ((do {
    ((((((((('w' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')}))))) && ((('h' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('e' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('n' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = $grammar->ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $m2) = $grammar->exp($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $body) = $MATCH->{('exp')}->flat()->{'end_block'});
    if ((!(defined($body)))) {
        die(('Missing code block in ' . chr(39) . 'when' . chr(39)))
    };
    ($MATCH->{('capture')} = When->new(('parameters' => $MATCH->{('exp')}->flat()->{'exp'}), ('body' => $body)));
    1
})))
}))
}))));
    $MATCH
};
sub for {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = Perlito5::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
    ($MATCH->{('bool')} = (((do {
    ((my  $pos1) = $MATCH->{('to')});
    ((do {
    (((((((('f' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')}))))) && ((('o' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('r' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $last_pos) = $MATCH->{('to')});
    if ((!(((do {
    (('each' eq substr($str, $MATCH->{('to')}, 4)) && (($MATCH->{('to')} = (4 + $MATCH->{('to')}))))
}))))) {
        ($MATCH->{('to')} = $last_pos)
    };
    1
}))) && ((do {
    ((my  $m2) = $grammar->ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $pos1) = $MATCH->{('to')});
    (((do {
    ((((((((((((((((('m' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')}))))) && ((('y' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = $grammar->ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $m2) = Perlito5::Grammar->var_ident($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'Perlito5::Grammar.var_ident'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $m2) = $grammar->opt_ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && ((('(' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = Perlito5::Expression->paren_parse($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'Perlito5::Expression.paren_parse'} = $m2);
        1
    }
    else {
        0
    }
}))) && (((')' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = $grammar->opt_ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && (((chr(123) eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = $grammar->opt_ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $m2) = Perlito5::Grammar->exp_stmts($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'Perlito5::Grammar.exp_stmts'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $m2) = $grammar->opt_ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && (((chr(125) eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ($MATCH->{('capture')} = For->new(('cond' => $MATCH->{('Perlito5::Expression.paren_parse')}->flat()), ('topic' => undef()), ('body' => Lit::Block->new(('stmts' => $MATCH->{('Perlito5::Grammar.exp_stmts')}->flat()), ('sig' => $MATCH->{('Perlito5::Grammar.var_ident')}->flat())))));
    1
})))
})) || ((do {
    ($MATCH->{('to')} = $pos1);
    ((((do {
    ((my  $m2) = $grammar->exp($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
})) && ((do {
    ((my  $body) = $MATCH->{('exp')}->flat()->{'end_block'});
    if ((!(defined($body)))) {
        die(('Missing code block in ' . chr(39) . 'when' . chr(39)))
    };
    ($MATCH->{('capture')} = For->new(('cond' => $MATCH->{('exp')}->flat()->{'exp'}), ('topic' => undef()), ('body' => $body)));
    1
}))))
})))
})))
}))
}))));
    $MATCH
};
sub while {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = Perlito5::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
    ($MATCH->{('bool')} = (((do {
    ((my  $pos1) = $MATCH->{('to')});
    ((do {
    (((((((((('w' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')}))))) && ((('h' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('i' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('l' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((('e' eq substr($str, $MATCH->{('to')}, 1)) && (($MATCH->{('to')} = (1 + $MATCH->{('to')})))))) && ((do {
    ((my  $m2) = $grammar->ws($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $m2) = $grammar->exp($str, $MATCH->{('to')}));
    if (($m2->{('bool')})) {
        ($MATCH->{('to')} = $m2->{('to')});
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ((my  $body) = $MATCH->{('exp')}->flat()->{'end_block'});
    if ((!(defined($body)))) {
        die(('Missing code block in ' . chr(39) . 'while' . chr(39)))
    };
    ($MATCH->{('capture')} = While->new(('cond' => $MATCH->{('exp')}->flat()->{'exp'}), ('body' => $body)));
    1
})))
}))
}))));
    $MATCH
};

1;
