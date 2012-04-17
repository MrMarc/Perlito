# Do not edit this file - Generated by Perlito5 9.0
use v5;
use Perlito5::Perl5::Runtime;
package main;
use v5;
package Perlito5::Grammar::String;
use Perlito5::Precedence;
Perlito5::Precedence::add_term(chr(39), sub {
    Perlito5::Grammar::String->term_q_quote($_[0], $_[1])
});
Perlito5::Precedence::add_term('"', sub {
    Perlito5::Grammar::String->term_qq_quote($_[0], $_[1])
});
Perlito5::Precedence::add_term('/', sub {
    Perlito5::Grammar::String->term_m_quote($_[0], $_[1])
});
Perlito5::Precedence::add_term('<', sub {
    Perlito5::Grammar::String->term_glob($_[0], $_[1])
});
Perlito5::Precedence::add_term('<<', sub {
    Perlito5::Grammar::String->here_doc_wanted($_[0], $_[1])
});
Perlito5::Precedence::add_term('`', sub {
    Perlito5::Grammar::String->term_qx($_[0], $_[1])
});
Perlito5::Precedence::add_term('m', sub {
    Perlito5::Grammar::String->term_m_quote($_[0], $_[1])
});
Perlito5::Precedence::add_term('q', sub {
    Perlito5::Grammar::String->term_q_quote($_[0], $_[1])
});
Perlito5::Precedence::add_term('qq', sub {
    Perlito5::Grammar::String->term_qq_quote($_[0], $_[1])
});
Perlito5::Precedence::add_term('qw', sub {
    Perlito5::Grammar::String->term_qw_quote($_[0], $_[1])
});
Perlito5::Precedence::add_term('qx', sub {
    Perlito5::Grammar::String->term_qx($_[0], $_[1])
});
Perlito5::Precedence::add_term('s', sub {
    Perlito5::Grammar::String->term_s_quote($_[0], $_[1])
});
Perlito5::Precedence::add_term('tr', sub {
    Perlito5::Grammar::String->term_tr_quote($_[0], $_[1])
});
Perlito5::Precedence::add_term('y', sub {
    Perlito5::Grammar::String->term_tr_quote($_[0], $_[1])
});
sub Perlito5::Grammar::String::term_q_quote {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = {'str', $str, 'from', $pos, 'to', $pos});
    ((my  $tmp) = (((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (((('q' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))) && ((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (('#' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((((do {
    ((my  $m2) = Perlito5::Grammar::Space->opt_ws($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
})) && ((do {
    ((my  $tmp) = $MATCH);
    ($MATCH = {'str', $str, 'from', $tmp->{'to'}, 'to', $tmp->{'to'}});
    ((my  $res) = ((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((my  $m2) = Perlito5::Grammar->word($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
}))
})));
    ($MATCH = ($res ? 0 : $tmp))
}))) && ((('' ne substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'})))))))
})))
})))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    ((((chr(39) eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))))
})))
})) && ((do {
    ((my  $m2) = $grammar->q_quote_parse($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        ($MATCH->{'q_quote_parse'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ($MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'q_quote_parse'})]);
    1
})))
}))
}))));
    ($tmp ? $MATCH : 0)
};
sub Perlito5::Grammar::String::term_qq_quote {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = {'str', $str, 'from', $pos, 'to', $pos});
    ((my  $tmp) = (((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (((('qq' eq substr($str, $MATCH->{'to'}, 2)) && (($MATCH->{'to'} = (2 + $MATCH->{'to'}))))) && ((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (('#' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((((do {
    ((my  $m2) = Perlito5::Grammar::Space->opt_ws($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
})) && ((do {
    ((my  $tmp) = $MATCH);
    ($MATCH = {'str', $str, 'from', $tmp->{'to'}, 'to', $tmp->{'to'}});
    ((my  $res) = ((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((my  $m2) = Perlito5::Grammar->word($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
}))
})));
    ($MATCH = ($res ? 0 : $tmp))
}))) && ((('' ne substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'})))))))
})))
})))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((('"' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))))
})))
})) && ((do {
    ((my  $m2) = $grammar->qq_quote_parse($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        ($MATCH->{'qq_quote_parse'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ($MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'qq_quote_parse'})]);
    1
})))
}))
}))));
    ($tmp ? $MATCH : 0)
};
sub Perlito5::Grammar::String::term_qw_quote {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = {'str', $str, 'from', $pos, 'to', $pos});
    ((my  $tmp) = (((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    (((((('qw' eq substr($str, $MATCH->{'to'}, 2)) && (($MATCH->{'to'} = (2 + $MATCH->{'to'}))))) && ((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (('#' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((((do {
    ((my  $m2) = Perlito5::Grammar::Space->opt_ws($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
})) && ((do {
    ((my  $tmp) = $MATCH);
    ($MATCH = {'str', $str, 'from', $tmp->{'to'}, 'to', $tmp->{'to'}});
    ((my  $res) = ((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((my  $m2) = Perlito5::Grammar->word($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
}))
})));
    ($MATCH = ($res ? 0 : $tmp))
}))) && ((('' ne substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'})))))))
})))
}))) && ((do {
    ((my  $m2) = $grammar->qw_quote_parse($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        ($MATCH->{'qw_quote_parse'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ($MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'qw_quote_parse'})]);
    1
})))
}))
}))));
    ($tmp ? $MATCH : 0)
};
sub Perlito5::Grammar::String::term_m_quote {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = {'str', $str, 'from', $pos, 'to', $pos});
    ((my  $tmp) = (((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (((('m' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))) && ((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (('#' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((((do {
    ((my  $m2) = Perlito5::Grammar::Space->opt_ws($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
})) && ((do {
    ((my  $tmp) = $MATCH);
    ($MATCH = {'str', $str, 'from', $tmp->{'to'}, 'to', $tmp->{'to'}});
    ((my  $res) = ((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((my  $m2) = Perlito5::Grammar->word($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
}))
})));
    ($MATCH = ($res ? 0 : $tmp))
}))) && ((('' ne substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'})))))))
})))
})))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((('/' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))))
})))
})) && ((do {
    ((my  $m2) = $grammar->m_quote_parse($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        ($MATCH->{'m_quote_parse'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ($MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'m_quote_parse'})]);
    1
})))
}))
}))));
    ($tmp ? $MATCH : 0)
};
sub Perlito5::Grammar::String::term_s_quote {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = {'str', $str, 'from', $pos, 'to', $pos});
    ((my  $tmp) = (((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    (((((('s' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))) && ((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (('#' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((((do {
    ((my  $m2) = Perlito5::Grammar::Space->opt_ws($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
})) && ((do {
    ((my  $tmp) = $MATCH);
    ($MATCH = {'str', $str, 'from', $tmp->{'to'}, 'to', $tmp->{'to'}});
    ((my  $res) = ((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((my  $m2) = Perlito5::Grammar->word($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
}))
})));
    ($MATCH = ($res ? 0 : $tmp))
}))) && ((('' ne substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'})))))))
})))
}))) && ((do {
    ((my  $m2) = $grammar->s_quote_parse($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        ($MATCH->{'s_quote_parse'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ($MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'s_quote_parse'})]);
    1
})))
}))
}))));
    ($tmp ? $MATCH : 0)
};
sub Perlito5::Grammar::String::term_qx {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = {'str', $str, 'from', $pos, 'to', $pos});
    ((my  $tmp) = (((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (((('qx' eq substr($str, $MATCH->{'to'}, 2)) && (($MATCH->{'to'} = (2 + $MATCH->{'to'}))))) && ((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (('#' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((((do {
    ((my  $m2) = Perlito5::Grammar::Space->opt_ws($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
})) && ((do {
    ((my  $tmp) = $MATCH);
    ($MATCH = {'str', $str, 'from', $tmp->{'to'}, 'to', $tmp->{'to'}});
    ((my  $res) = ((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((my  $m2) = Perlito5::Grammar->word($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
}))
})));
    ($MATCH = ($res ? 0 : $tmp))
}))) && ((('' ne substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'})))))))
})))
})))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((('`' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))))
})))
})) && ((do {
    ((my  $m2) = $grammar->qx_quote_parse($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        ($MATCH->{'qx_quote_parse'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ($MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'qx_quote_parse'})]);
    1
})))
}))
}))));
    ($tmp ? $MATCH : 0)
};
sub Perlito5::Grammar::String::term_glob {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = {'str', $str, 'from', $pos, 'to', $pos});
    ((my  $tmp) = (((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((((('<' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))) && ((do {
    ((my  $m2) = $grammar->glob_quote_parse($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        ($MATCH->{'glob_quote_parse'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ($MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'glob_quote_parse'})]);
    1
})))
}))
}))));
    ($tmp ? $MATCH : 0)
};
sub Perlito5::Grammar::String::term_tr_quote {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = {'str', $str, 'from', $pos, 'to', $pos});
    ((my  $tmp) = (((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    (((((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (('tr' eq substr($str, $MATCH->{'to'}, 2)) && (($MATCH->{'to'} = (2 + $MATCH->{'to'}))))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((('y' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))))
})))
})) && ((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    (('#' eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((((do {
    ((my  $m2) = Perlito5::Grammar::Space->opt_ws($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
})) && ((do {
    ((my  $tmp) = $MATCH);
    ($MATCH = {'str', $str, 'from', $tmp->{'to'}, 'to', $tmp->{'to'}});
    ((my  $res) = ((do {
    ((my  $pos1) = $MATCH->{'to'});
    ((do {
    ((my  $m2) = Perlito5::Grammar->word($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        1
    }
    else {
        0
    }
}))
})));
    ($MATCH = ($res ? 0 : $tmp))
}))) && ((('' ne substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'})))))))
})))
}))) && ((do {
    ((my  $m2) = $grammar->tr_quote_parse($str, $MATCH->{'to'}));
    if ($m2) {
        ($MATCH->{'to'} = $m2->{'to'});
        ($MATCH->{'tr_quote_parse'} = $m2);
        1
    }
    else {
        0
    }
}))) && ((do {
    ($MATCH->{'capture'} = ['term', Perlito5::Match::flat($MATCH->{'tr_quote_parse'})]);
    1
})))
}))
}))));
    ($tmp ? $MATCH : 0)
};
((my  %pair) = ('{', '}', '(', ')', '[', ']', '<', '>'));
((my  %escape_sequence) = ('a', '7', 'b', '8', 'e', '27', 'f', '12', 'n', '10', 'r', '13', 't', '9'));
((my  %hex) = map(+(($_, 1)), ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')));
sub Perlito5::Grammar::String::q_quote_parse {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $delimiter) = substr($str, ($pos - 1), 1));
    ((my  $open_delimiter) = $delimiter);
    if (exists($pair{$delimiter})) {
        ($delimiter = $pair{$delimiter})
    };
    return ($self->string_interpolation_parse($str, $pos, $open_delimiter, $delimiter, 0))
};
sub Perlito5::Grammar::String::qq_quote_parse {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $delimiter) = substr($str, ($pos - 1), 1));
    ((my  $open_delimiter) = $delimiter);
    if (exists($pair{$delimiter})) {
        ($delimiter = $pair{$delimiter})
    };
    return ($self->string_interpolation_parse($str, $pos, $open_delimiter, $delimiter, 1))
};
sub Perlito5::Grammar::String::qw_quote_parse {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $delimiter) = substr($str, ($pos - 1), 1));
    ((my  $open_delimiter) = $delimiter);
    if (exists($pair{$delimiter})) {
        ($delimiter = $pair{$delimiter})
    };
    ((my  $m) = $self->string_interpolation_parse($str, $pos, $open_delimiter, $delimiter, 0));
    if ($m) {
        ($m->{'capture'} = Perlito5::AST::Apply->new('code', 'list:<,>', 'arguments', [map(Perlito5::AST::Val::Buf->new('buf', $_), split(' ', Perlito5::Match::flat($m)->{'buf'}))], 'namespace', ''))
    };
    return ($m)
};
sub Perlito5::Grammar::String::m_quote_parse {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $delimiter) = substr($str, ($pos - 1), 1));
    ((my  $open_delimiter) = $delimiter);
    ((my  $closing_delimiter) = $delimiter);
    if (exists($pair{$delimiter})) {
        ($closing_delimiter = $pair{$delimiter})
    };
    ((my  $part1) = $self->string_interpolation_parse($str, $pos, $open_delimiter, $closing_delimiter, 2));
    if ($part1) {

    }
    else {
        return ($part1)
    };
    ((my  $str_regex) = $part1->{'capture'});
    ((my  $p) = $part1->{'to'});
    ((my  $modifiers) = '');
    ((my  $m) = Perlito5::Grammar->ident($str, $p));
    if ($m) {
        ($modifiers = Perlito5::Match::flat($m));
        ($part1->{'to'} = $m->{'to'})
    };
    ($part1->{'capture'} = Perlito5::AST::Apply->new('code', 'p5:m', 'arguments', [$str_regex, $modifiers], 'namespace', ''));
    return ($part1)
};
sub Perlito5::Grammar::String::s_quote_parse {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $delimiter) = substr($str, ($pos - 1), 1));
    ((my  $open_delimiter) = $delimiter);
    ((my  $closing_delimiter) = $delimiter);
    if (exists($pair{$delimiter})) {
        ($closing_delimiter = $pair{$delimiter})
    };
    ((my  $part1) = $self->string_interpolation_parse($str, $pos, $open_delimiter, $closing_delimiter, 1));
    if ($part1) {

    }
    else {
        return ($part1)
    };
    ((my  $str_regex) = Perlito5::AST::Val::Buf->new('buf', substr($str, $pos, (($part1->{'to'} - $pos) - 1))));
    (my  $part2);
    (my  $m);
    ((my  $p) = $part1->{'to'});
    if (exists($pair{$delimiter})) {
        ($m = Perlito5::Grammar::Space->opt_ws($str, $p));
        ($p = $m->{'to'});
        ($delimiter = substr($str, $p, 1));
        ((my  $open_delimiter) = $delimiter);
        ($p)++;
        ($closing_delimiter = $delimiter);
        if (exists($pair{$delimiter})) {
            ($closing_delimiter = $pair{$delimiter})
        };
        ($part2 = $self->string_interpolation_parse($str, $p, $open_delimiter, $closing_delimiter, 1));
        if ($part2) {

        }
        else {
            return ($part2)
        }
    }
    else {
        ($part2 = $self->string_interpolation_parse($str, $p, $open_delimiter, $closing_delimiter, 1));
        if ($part2) {

        }
        else {
            return ($part2)
        }
    };
    ($p = $part2->{'to'});
    ((my  $modifiers) = '');
    ($m = Perlito5::Grammar->ident($str, $p));
    if ($m) {
        ($modifiers = Perlito5::Match::flat($m));
        ($part2->{'to'} = $m->{'to'})
    };
    ($part2->{'capture'} = Perlito5::AST::Apply->new('code', 'p5:s', 'arguments', [$str_regex, Perlito5::Match::flat($part2), $modifiers], 'namespace', ''));
    return ($part2)
};
sub Perlito5::Grammar::String::qx_quote_parse {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $delimiter) = substr($str, ($pos - 1), 1));
    ((my  $open_delimiter) = $delimiter);
    if (exists($pair{$delimiter})) {
        ($delimiter = $pair{$delimiter})
    };
    ((my  $m) = $self->string_interpolation_parse($str, $pos, $open_delimiter, $delimiter, 0));
    if ($m) {
        ($m->{'capture'} = Perlito5::AST::Apply->new('code', 'qx', 'arguments', [Perlito5::Match::flat($m)], 'namespace', ''))
    };
    return ($m)
};
sub Perlito5::Grammar::String::glob_quote_parse {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $delimiter) = substr($str, ($pos - 1), 1));
    ((my  $open_delimiter) = $delimiter);
    if (exists($pair{$delimiter})) {
        ($delimiter = $pair{$delimiter})
    };
    ((my  $m) = $self->string_interpolation_parse($str, $pos, $open_delimiter, $delimiter, 0));
    if ($m) {
        ($m->{'capture'} = Perlito5::AST::Apply->new('code', 'glob', 'arguments', [Perlito5::Match::flat($m)], 'namespace', ''))
    };
    return ($m)
};
sub Perlito5::Grammar::String::tr_quote_parse {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $delimiter) = substr($str, ($pos - 1), 1));
    ((my  $open_delimiter) = $delimiter);
    ((my  $closing_delimiter) = $delimiter);
    if (exists($pair{$delimiter})) {
        ($closing_delimiter = $pair{$delimiter})
    };
    ((my  $part1) = $self->string_interpolation_parse($str, $pos, $open_delimiter, $closing_delimiter, 1));
    if ($part1) {

    }
    else {
        return ($part1)
    };
    ((my  $str_regex) = Perlito5::AST::Val::Buf->new('buf', substr($str, $pos, (($part1->{'to'} - $pos) - 1))));
    (my  $part2);
    (my  $m);
    ((my  $p) = $part1->{'to'});
    if (exists($pair{$delimiter})) {
        ($m = Perlito5::Grammar::Space->opt_ws($str, $p));
        ($p = $m->{'to'});
        ($delimiter = substr($str, $p, 1));
        ((my  $open_delimiter) = $delimiter);
        ($p)++;
        ($closing_delimiter = $delimiter);
        if (exists($pair{$delimiter})) {
            ($closing_delimiter = $pair{$delimiter})
        };
        ($part2 = $self->string_interpolation_parse($str, $p, $open_delimiter, $closing_delimiter, 1));
        if ($part2) {

        }
        else {
            return ($part2)
        }
    }
    else {
        ($part2 = $self->string_interpolation_parse($str, $p, $open_delimiter, $closing_delimiter, 1));
        if ($part2) {

        }
        else {
            return ($part2)
        }
    };
    ($p = $part2->{'to'});
    ((my  $modifiers) = '');
    ($m = Perlito5::Grammar->ident($str, $p));
    if ($m) {
        ($modifiers = Perlito5::Match::flat($m));
        ($part2->{'to'} = $m->{'to'})
    };
    ($part2->{'capture'} = Perlito5::AST::Apply->new('code', 'p5:tr', 'arguments', [$str_regex, Perlito5::Match::flat($part2), $modifiers], 'namespace', ''));
    return ($part2)
};
sub Perlito5::Grammar::String::string_interpolation_parse {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $open_delimiter) = $_[3]);
    ((my  $delimiter) = $_[4]);
    ((my  $interpolate) = $_[5]);
    ((my  $p) = $pos);
    ((my  $balanced) = ($open_delimiter && exists($pair{$open_delimiter})));
    (my  @args);
    ((my  $buf) = '');
    for ( ; (($p < length($str)) && (substr($str, $p, length($delimiter)) ne $delimiter)); do { for ($_) {

}} ) {
        ((my  $c) = substr($str, $p, 1));
        ((my  $c2) = substr($str, ($p + 1), 1));
        (my  $m);
        ((my  $more) = '');
        if ((($balanced && ($c eq chr(92))) && ((($c2 eq $open_delimiter) || ($c2 eq $delimiter))))) {
            ($p)++;
            ($c = $c2)
        }
        else {
            if (($balanced && ($c eq $open_delimiter))) {
                ($buf = ($buf . $c));
                ($p)++;
                ($m = $self->string_interpolation_parse($str, $p, $open_delimiter, $delimiter, $interpolate));
                ($more = $delimiter)
            }
            else {
                if (($interpolate && ((($c eq '$') || ($c eq '@'))))) {
                    ($m = Perlito5::Grammar::String->double_quoted_var($str, $p, $delimiter, $interpolate))
                }
                else {
                    if (($c eq chr(92))) {
                        if (($interpolate == 2)) {

                        }
                        else {
                            if (($interpolate == 1)) {
                                ($m = Perlito5::Grammar::String->double_quoted_unescape($str, $p))
                            }
                            else {
                                ($m = (($c2 eq chr(92)) ? {'str', $str, 'from', $p, 'to', ($p + 2), 'capture', Perlito5::AST::Val::Buf->new('buf', chr(92))} : (($c2 eq chr(39)) ? {'str', $str, 'from', $p, 'to', ($p + 2), 'capture', Perlito5::AST::Val::Buf->new('buf', chr(39))} : 0)))
                            }
                        }
                    }
                }
            }
        };
        if ($m) {
            ((my  $obj) = Perlito5::Match::flat($m));
            if ((ref($obj) eq 'Perlito5::AST::Val::Buf')) {
                ($buf = ($buf . $obj->{'buf'}));
                ($obj = undef())
            };
            if ($obj) {
                if (length($buf)) {
                    push(@args, Perlito5::AST::Val::Buf->new('buf', $buf) );
                    ($buf = '')
                };
                push(@args, $obj )
            };
            ($p = $m->{'to'});
            ($buf = ($buf . $more))
        }
        else {
            ($p)++;
            if ((($c eq chr(10)) || ($c eq chr(13)))) {
                ((my  $m) = $self->here_doc($str, $p));
                if (($p != $m->{'to'})) {
                    ($p = $m->{'to'})
                }
                else {
                    ($buf = ($buf . $c))
                }
            }
            else {
                ($buf = ($buf . $c))
            }
        }
    };
    if (length($buf)) {
        push(@args, Perlito5::AST::Val::Buf->new('buf', $buf) )
    };
    if ((substr($str, $p, length($delimiter)) ne $delimiter)) {
        die(('Can' . chr(39) . 't find string terminator ' . chr(39) . $delimiter . chr(39) . ' anywhere before EOF'))
    };
    ($p = ($p + length($delimiter)));
    (my  $ast);
    if (!(@args)) {
        ($ast = Perlito5::AST::Val::Buf->new('buf', ''))
    }
    else {
        if ((@args == 1)) {
            ($ast = $args[0])
        }
        else {
            ($ast = Perlito5::AST::Apply->new('namespace', '', 'code', 'list:<.>', 'arguments', \@args))
        }
    };
    return ({'str', $str, 'from', $pos, 'to', $p, 'capture', $ast})
};
(my  @Here_doc);
sub Perlito5::Grammar::String::here_doc_wanted {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    (my  $delimiter);
    ((my  $type) = 'double_quote');
    ((my  $p) = $pos);
    if ((substr($str, $p, 2) eq '<<')) {
        ($p = ($p + 2));
        ((my  $quote) = substr($str, $p, 1));
        if ((($quote eq chr(39)) || ($quote eq '"'))) {
            ($p = ($p + 1));
            ((my  $m) = $self->string_interpolation_parse($str, $p, $quote, $quote, 0));
            if ($m) {
                ($p = $m->{'to'});
                ($delimiter = Perlito5::Match::flat($m)->{'buf'});
                ($type = (($quote eq chr(39)) ? 'single_quote' : 'double_quote'))
            }
        }
        else {
            if (($quote eq chr(92))) {
                ($p = ($p + 1))
            };
            ((my  $m) = Perlito5::Grammar->ident($str, $p));
            if ($m) {
                ($p = $m->{'to'});
                ($delimiter = Perlito5::Match::flat($m));
                ($type = (($quote eq chr(92)) ? 'single_quote' : 'double_quote'))
            }
            else {
                die('Use of bare << to mean <<"" is deprecated')
            }
        }
    };
    if (!(defined($delimiter))) {
        return (0)
    };
    ((my  $placeholder) = Perlito5::AST::Apply->new('code', 'list:<.>', 'namespace', '', 'arguments', [Perlito5::AST::Apply->new('code', 'list:<.>', 'namespace', '', 'arguments', [])]));
    push(@Here_doc, [$type, $placeholder->{'arguments'}->[0]->{'arguments'}, $delimiter] );
    return ({'str', $str, 'from', $pos, 'to', $p, 'capture', ['term', $placeholder]})
};
sub Perlito5::Grammar::String::newline {
    ((my  $grammar) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $MATCH) = {'str', $str, 'from', $pos, 'to', $pos});
    ((my  $tmp) = (((do {
    ((my  $pos1) = $MATCH->{'to'});
    (((do {
    ((((chr(10) eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))) && ((do {
    ((my  $m) = $MATCH);
    if (!(((do {
    ((chr(13) eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))
})))) {
        ($MATCH = $m)
    };
    1
})))
})) || ((do {
    ($MATCH->{'to'} = $pos1);
    (((((chr(13) eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))) && ((do {
    ((my  $m) = $MATCH);
    if (!(((do {
    ((chr(10) eq substr($str, $MATCH->{'to'}, 1)) && (($MATCH->{'to'} = (1 + $MATCH->{'to'}))))
})))) {
        ($MATCH = $m)
    };
    1
}))))
})))
}))));
    ($tmp ? $MATCH : 0)
};
sub Perlito5::Grammar::String::here_doc {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    if (!(@Here_doc)) {
        return ({'str', $str, 'from', $pos, 'to', $pos})
    };
    ((my  $p) = $pos);
    ((my  $here) = shift(@Here_doc));
    ((my  $type) = $here->[0]);
    ((my  $result) = $here->[1]);
    ((my  $delimiter) = $here->[2]);
    if (($type eq 'single_quote')) {
        for ( ; ($p < length($str)); do { for ($_) {

}} ) {
            if ((substr($str, $p, length($delimiter)) eq $delimiter)) {
                push(@{$result}, Perlito5::AST::Val::Buf->new('buf', substr($str, $pos, ($p - $pos))) );
                ($p = ($p + length($delimiter)));
                ((my  $m) = $self->newline($str, $p));
                if ((($p >= length($str)) || $m)) {
                    if ($m) {
                        ($p = $m->{'to'})
                    };
                    return ({'str', $str, 'from', $pos, 'to', ($p - 1)})
                }
            };
            for ( ; (($p < length($str)) && (((substr($str, $p, 1) ne chr(10)) && (substr($str, $p, 1) ne chr(13))))); do { for ($_) {

}} ) {
                ($p)++
            };
            for ( ; (($p < length($str)) && (((substr($str, $p, 1) eq chr(10)) || (substr($str, $p, 1) eq chr(13))))); do { for ($_) {

}} ) {
                ($p)++
            }
        }
    }
    else {
        (my  $m);
        if ((substr($str, $p, length($delimiter)) eq $delimiter)) {
            ($p = ($p + length($delimiter)));
            ($m = $self->newline($str, $p));
            if ((($p >= length($str)) || $m)) {
                push(@{$result}, Perlito5::AST::Val::Buf->new('buf', '') );
                if ($m) {
                    ($p = $m->{'to'})
                };
                return ({'str', $str, 'from', $pos, 'to', $p})
            }
        };
        ($m = $self->string_interpolation_parse($str, $pos, '', (chr(10) . $delimiter . chr(10)), 1));
        if ($m) {
            push(@{$result}, Perlito5::Match::flat($m) );
            push(@{$result}, Perlito5::AST::Val::Buf->new('buf', chr(10)) );
            ($m->{'to'} = ($m->{'to'} - 1));
            return ($m)
        }
    };
    die(('Can' . chr(39) . 't find string terminator "' . $delimiter . '" anywhere before EOF'))
};
sub Perlito5::Grammar::String::double_quoted_unescape {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $c2) = substr($str, ($pos + 1), 1));
    (my  $m);
    if (exists($escape_sequence{$c2})) {
        ($m = {'str', $str, 'from', $pos, 'to', ($pos + 2), 'capture', Perlito5::AST::Val::Buf->new('buf', chr($escape_sequence{$c2}))})
    }
    else {
        if (($c2 eq 'c')) {
            ((my  $c3) = ((ord(substr($str, ($pos + 2), 1)) - ord('A')) + 1));
            if (($c3 < 0)) {
                ($c3 = (128 + $c3))
            };
            ($m = {'str', $str, 'from', $pos, 'to', ($pos + 3), 'capture', Perlito5::AST::Val::Buf->new('buf', chr($c3))})
        }
        else {
            if (($c2 eq 'x')) {
                if ((substr($str, ($pos + 2), 1) eq '{')) {
                    ((my  $p) = ($pos + 3));
                    for ( ; (($p < length($str)) && (substr($str, $p, 1) ne '}'));  ) {
                        ($p)++
                    };
                    ((my  $tmp) = oct(('0x' . substr($str, ($pos + 3), ($p - $pos)))));
                    ($m = {'str', $str, 'from', $pos, 'to', ($p + 1), 'capture', Perlito5::AST::Apply->new('arguments', [Perlito5::AST::Val::Int->new('int', $tmp)], 'code', 'chr')})
                }
                else {
                    ((my  $p) = ($pos + 2));
                    if ($hex{uc(substr($str, $p, 1))}) {
                        ($p)++
                    };
                    if ($hex{uc(substr($str, $p, 1))}) {
                        ($p)++
                    };
                    ((my  $tmp) = oct(('0x' . substr($str, ($pos + 2), ($p - $pos)))));
                    ($m = {'str', $str, 'from', $pos, 'to', $p, 'capture', Perlito5::AST::Apply->new('arguments', [Perlito5::AST::Val::Int->new('int', $tmp)], 'code', 'chr')})
                }
            }
            else {
                ($m = {'str', $str, 'from', $pos, 'to', ($pos + 2), 'capture', Perlito5::AST::Val::Buf->new('buf', $c2)})
            }
        }
    };
    return ($m)
};
sub Perlito5::Grammar::String::double_quoted_var_with_subscript {
    ((my  $self) = $_[0]);
    ((my  $m_var) = $_[1]);
    ((my  $interpolate) = $_[2]);
    ((my  $str) = $m_var->{'str'});
    ((my  $pos) = $m_var->{'to'});
    ((my  $p) = $pos);
    (my  $m_index);
    if ((substr($str, $p, 1) eq '[')) {
        if (($interpolate == 2)) {
            ((my  $m) = ((Perlito5::Expression->term_digit($str, ($p + 1)) || (((substr($str, ($p + 1), 1) eq '-') && Perlito5::Expression->term_digit($str, ($p + 2))))) || Perlito5::Expression->term_sigil($str, ($p + 1))));
            if ($m) {

            }
            else {
                return ($m_var)
            };
            if ((substr($str, $m->{'to'}, 1) eq ']')) {

            }
            else {
                return ($m_var)
            }
        };
        ($p)++;
        ($m_index = Perlito5::Expression->list_parse($str, $p));
        if ($m_index) {
            ((my  $exp) = $m_index->{'capture'}->{'exp'});
            ($p = $m_index->{'to'});
            if ((($exp ne '*undef*') && (substr($str, $p, 1) eq ']'))) {
                ($p)++;
                ($m_index->{'capture'} = Perlito5::AST::Index->new('obj', $m_var->{'capture'}, 'index_exp', $exp));
                ($m_index->{'to'} = $p);
                return ($self->double_quoted_var_with_subscript($m_index, $interpolate))
            }
        }
    };
    ($m_index = Perlito5::Expression->term_curly($str, $pos));
    if ($m_index) {
        ($m_index->{'capture'} = Perlito5::AST::Lookup->new('obj', $m_var->{'capture'}, 'index_exp', Perlito5::Match::flat($m_index)->[2]->[0]));
        return ($self->double_quoted_var_with_subscript($m_index, $interpolate))
    };
    return ($m_var)
};
sub Perlito5::Grammar::String::double_quoted_var {
    ((my  $self) = $_[0]);
    ((my  $str) = $_[1]);
    ((my  $pos) = $_[2]);
    ((my  $delimiter) = $_[3]);
    ((my  $interpolate) = $_[4]);
    ((my  $c) = substr($str, $pos, 1));
    if ((($c eq '$') && (substr($str, ($pos + 1), 1) eq '{'))) {
        ((my  $m) = Perlito5::Expression->term_sigil($str, $pos));
        if ($m) {

        }
        else {
            return ($m)
        };
        ((my  $var) = Perlito5::Match::flat($m)->[1]);
        ($m->{'capture'} = $var);
        return ($m)
    }
    else {
        if ((($c eq '$') && (substr($str, ($pos + 1), length($delimiter)) ne $delimiter))) {
            ((my  $m) = Perlito5::Expression->term_sigil($str, $pos));
            if ($m) {

            }
            else {
                return ($m)
            };
            ($m->{'capture'} = $m->{'capture'}->[1]);
            return ($self->double_quoted_var_with_subscript($m, $interpolate))
        }
        else {
            if ((($c eq '@') && (substr($str, ($pos + 1), length($delimiter)) ne $delimiter))) {
                ((my  $m) = Perlito5::Expression->term_sigil($str, $pos));
                if ($m) {

                }
                else {
                    return ($m)
                };
                ($m->{'capture'} = $m->{'capture'}->[1]);
                ($m = $self->double_quoted_var_with_subscript($m, $interpolate));
                ($m->{'capture'} = Perlito5::AST::Apply->new('code', 'join', 'arguments', [Perlito5::AST::Val::Buf->new('buf', ' '), $m->{'capture'}], 'namespace', ''));
                return ($m)
            }
        }
    };
    return (0)
};
1;

1;
