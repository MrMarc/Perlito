# Do not edit this file - Generated by Perlito 7.0
use v5;
use utf8;
use strict;
use warnings;
no warnings ('redefine', 'once', 'void', 'uninitialized', 'misc', 'recursion');
use Perlito::Perl5::Runtime;
use Perlito::Perl5::Prelude;
our $MATCH = Perlito::Match->new();
{
package GLOBAL;
    sub new { shift; bless { @_ }, "GLOBAL" }

    # use v6 
;
    {
    package Main;
        sub new { shift; bless { @_ }, "Main" }
        use Perlito::Go::Emitter;
        use Perlito::Lisp::Emitter;
        use Perlito::Perl5::Emitter;
        use Perlito::Javascript::Emitter;
        use Perlito::Parrot::Emitter;
        use Perlito::Python::Emitter;
        use Perlito::Ruby::Emitter;
        use Perlito::Grammar;
        use Perlito::Grammar::Control;
        use Perlito::Grammar::Regex;
        use Perlito::Emitter::Token;
        use Perlito::Expression;
        use Perlito::Precedence;
        use Perlito::Macro;
        ((my  $_V6_COMPILER_NAME = undef) = 'Perlito');
        ((my  $_V6_COMPILER_VERSION = undef) = '7.0');
        ((my  $source = undef) = '');
        ((my  $backend = undef) = '');
        ((my  $execute = undef) = 0);
        ((my  $verbose = undef) = 0);
        ((my  $comp_units = undef) = do {
    (my  $List_a = []);
    (my  $List_v = []);
    $List_a
});
        ((my  $perl6lib = undef) = '.' . chr(47) . 'lib');
        ((my  $expand_use = undef) = 1);
        if (Main::bool($verbose)) {
            warn(chr(47) . chr(47) . ' Perlito compiler');
            warn(chr(47) . chr(47) . ' ARGS: ', Main::perl((\@ARGV), ))
        };
        (my  $Hash_module_seen = {});
        sub module_name {
            my $grammar = $_[0];
            my $str = $_[1];
            my $pos = $_[2];
            (my  $MATCH = undef);
            ($MATCH = Perlito::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
            (($MATCH)->{bool} = ((do {
    ((my  $pos1 = undef) = $MATCH->to());
    (do {
    Main::and((do {
    ((my  $m2 = undef) = Perlito::Grammar->ident($str, $MATCH->to()));
    if (Main::bool($m2)) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'Perlito::Grammar.ident'} = $m2);
        1
    }
    else {
        0
    }
}), sub { (do {
    ((my  $pos1 = undef) = $MATCH->to());
    Main::or((do {
    Main::and(Main::and((Main::and(('::' eq substr($str, $MATCH->to(), 2)), sub { ((($MATCH)->{to} = (2 + $MATCH->to()))) })), sub { (do {
    ((my  $m2 = undef) = $grammar->module_name($str, $MATCH->to()));
    if (Main::bool($m2)) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'module_name'} = $m2);
        1
    }
    else {
        0
    }
}) }), sub { (Main::or((do {
    ($MATCH->{capture} = (do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, ("" . $MATCH->{'Perlito::Grammar.ident'}) );
    ($List_v = ((${$MATCH->{'module_name'}}) || []));
    for my $x ( @{[0 .. ((scalar( @{$List_v} ) - 1))] || []} ) {
        push( @{$List_a}, $List_v->[$x] )
    };
    $List_a
}))
}), sub { 1 })) })
}), sub { (do {
    (($MATCH)->{to} = $pos1);
    (Main::and(1, sub { (Main::or((do {
    ($MATCH->{capture} = (do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, ("" . $MATCH->{'Perlito::Grammar.ident'}) );
    $List_a
}))
}), sub { 1 })) }))
}) })
}) })
})
})));
            $MATCH
        };
        sub modulename_to_filename {
            my $s = $_[0];
            ((my  $ident = undef) = Main->module_name($s, 0));
            return scalar (Main::join((${$ident}), chr(47)))
        };
        sub expand_use {
            my $stmt = $_[0];
            ((my  $module_name = undef) = $stmt->mod());
            if (Main::bool(($module_name eq 'v6'))) {
                return ()
            }
            else {

            };
            if (Main::bool(!Main::bool(($Hash_module_seen->{$module_name})))) {
                ($Hash_module_seen->{$module_name} = 1);
                if (Main::bool(Main::or((($backend eq 'perl5')), sub { (($backend eq 'ast-perl6')) }))) {

                }
                else {
                    ((my  $filename = undef) = $module_name);
                    ($filename = $perl6lib . chr(47) . modulename_to_filename($filename) . '.pm');
                    if (Main::bool(($verbose))) {
                        warn(chr(47) . chr(47) . ' now loading: ', $filename)
                    };
                    ((my  $source = undef) = IO::slurp($filename));
                    ((my  $m = undef) = Perlito::Grammar->exp_stmts($source, 0));
                    add_comp_unit(${$m})
                }
            }
        };
        sub add_comp_unit {
            my $List_parse = $_[0];
            for my $comp_unit ( @{$List_parse || []} ) {
                if (Main::bool(Main::and($expand_use, sub { Main::isa($comp_unit, 'Use') }))) {
                    expand_use($comp_unit)
                }
                else {
                    if (Main::bool(Main::isa($comp_unit, 'CompUnit'))) {
                        if (Main::bool($verbose)) {
                            warn('parsed comp_unit: ' . chr(39), $comp_unit->name(), chr(39))
                        };
                        for my $stmt ( @{(($comp_unit->body()) || []) || []} ) {
                            if (Main::bool(Main::and($expand_use, sub { Main::isa($stmt, 'Use') }))) {
                                expand_use($stmt)
                            }
                        }
                    }
                };
                push( @{$comp_units}, $comp_unit )
            }
        };
        if (Main::bool(Main::or((((\@ARGV)->[0] eq '-v')), sub { (((\@ARGV)->[0] eq '--verbose')) }))) {
            ($verbose = 1);
            shift( @{(\@ARGV)} )
        };
        if (Main::bool((substr((\@ARGV)->[0], 0, 2) eq '-C'))) {
            ($backend = substr((\@ARGV)->[0], 2, 10));
            ($execute = 0);
            shift( @{(\@ARGV)} );
            if (Main::bool(Main::or(Main::or((($backend eq 'perl5')), sub { (($backend eq 'python')) }), sub { (($backend eq 'ruby')) }))) {
                ($expand_use = 0)
            }
        };
        if (Main::bool((substr((\@ARGV)->[0], 0, 2) eq '-B'))) {
            ($backend = substr((\@ARGV)->[0], 2, 10));
            ($execute = 1);
            shift( @{(\@ARGV)} );
            if (Main::bool(Main::or(Main::or((($backend eq 'perl5')), sub { (($backend eq 'python')) }), sub { (($backend eq 'ruby')) }))) {
                ($expand_use = 0)
            }
        };
        if (Main::bool(Main::or((((\@ARGV)->[0] eq '-V')), sub { (((\@ARGV)->[0] eq '--version')) }))) {
            ($backend = '');
            Main::say($_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION);
            shift( @{(\@ARGV)} )
        }
        else {
            if (Main::bool(Main::or(Main::or((((\@ARGV)->[0] eq '-h')), sub { (((\@ARGV)->[0] eq '--help')) }), sub { (($backend eq '')) }))) {
                ($backend = '');
                Main::say($_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION, chr(10) . 'perlito ' . chr(91) . 'switches' . chr(93) . ' ' . chr(91) . 'programfile' . chr(93) . chr(10) . '  switches:' . chr(10) . '    -h --help' . chr(10) . '    -v --verbose' . chr(10) . '    -V --version' . chr(10) . '    -Ctarget        target backend: go, js, lisp, parrot, perl5, python, ruby, ast-perl6' . chr(10) . '    --expand_use --noexpand_use' . chr(10) . '                    expand ' . chr(39) . 'use' . chr(39) . ' statements at compile time' . chr(10) . '    -e program      one line of program ' . chr(40) . 'omit programfile' . chr(41) . chr(10));
                shift( @{(\@ARGV)} )
            }
        };
        if (Main::bool(((\@ARGV)->[0] eq '--expand_use'))) {
            ($expand_use = 1);
            shift( @{(\@ARGV)} )
        };
        if (Main::bool(((\@ARGV)->[0] eq '--noexpand_use'))) {
            ($expand_use = 0);
            shift( @{(\@ARGV)} )
        };
        if (Main::bool(Main::and($backend, sub { (\@ARGV) }))) {
            (my  $prelude_filename = undef);
            if (Main::bool(($backend eq 'lisp'))) {
                ($prelude_filename = $perl6lib . chr(47) . 'Perlito' . chr(47) . 'Lisp' . chr(47) . 'Prelude.pm')
            };
            if (Main::bool(($backend eq 'js'))) {
                ($prelude_filename = $perl6lib . chr(47) . 'Perlito' . chr(47) . 'Javascript' . chr(47) . 'Prelude.pm')
            };
            if (Main::bool(($backend eq 'go'))) {
                ($prelude_filename = $perl6lib . chr(47) . 'Perlito' . chr(47) . 'Go' . chr(47) . 'Prelude.pm')
            };
            if (Main::bool($prelude_filename)) {
                if (Main::bool($verbose)) {
                    warn(chr(47) . chr(47) . ' loading lib: ', $prelude_filename)
                };
                ($source = IO::slurp($prelude_filename));
                ((my  $m = undef) = Perlito::Grammar->exp_stmts($source, 0));
                add_comp_unit(${$m})
            };
            if (Main::bool(((\@ARGV)->[0] eq '-e'))) {
                shift( @{(\@ARGV)} );
                if (Main::bool($verbose)) {
                    warn(chr(47) . chr(47) . ' source from command line: ', (\@ARGV)->[0])
                };
                ($source = shift( @{(\@ARGV)} ))
            }
            else {
                if (Main::bool($verbose)) {
                    warn(chr(47) . chr(47) . ' source from file: ', (\@ARGV)->[0])
                };
                ($source = IO::slurp(shift( @{(\@ARGV)} )))
            };
            if (Main::bool($verbose)) {
                warn(chr(47) . chr(47) . ' backend: ', $backend);
                warn('now parsing')
            };
            ((my  $m = undef) = Perlito::Grammar->exp_stmts($source, 0));
            add_comp_unit(${$m});
            ($comp_units = do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, CompUnit->new(('name' => 'GLOBAL'), ('body' => $comp_units)) );
    $List_a
});
            if (Main::bool(($backend eq 'ast-perl6'))) {
                Main::say(chr(35) . ' AST dump - do not edit this file - Generated by ', $_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION);
                Main::say(Main::perl($comp_units, ))
            };
            if (Main::bool(($backend eq 'go'))) {
                Main::say(chr(47) . chr(47) . ' Do not edit this file - Generated by ', $_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION);
                ((my  $filename = undef) = $perl6lib . chr(47) . 'Perlito' . chr(47) . 'Go' . chr(47) . 'Runtime.go');
                if (Main::bool(($verbose))) {
                    warn(chr(47) . chr(47) . ' now loading: ', $filename)
                };
                ((my  $source = undef) = IO::slurp($filename));
                Main::say($source);
                Main::say(CompUnit::emit_go_program($comp_units))
            };
            if (Main::bool(($backend eq 'lisp'))) {
                Main::say(chr(59) . chr(59) . ' Do not edit this file - Generated by ', $_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION);
                ((my  $filename = undef) = $perl6lib . chr(47) . 'Perlito' . chr(47) . 'Lisp' . chr(47) . 'Runtime.lisp');
                if (Main::bool(($verbose))) {
                    warn(chr(47) . chr(47) . ' now loading: ', $filename)
                };
                ((my  $source = undef) = IO::slurp($filename));
                Main::say($source);
                Main::say(CompUnit::emit_lisp_program($comp_units));
                Main::say(chr(40) . 'compiler-main' . chr(41));
                Main::say(chr(59) . chr(59) . ' Note: the line below creates a binary executable:');
                Main::say(chr(59) . chr(59) . ' ' . chr(40) . 'sb-ext:save-lisp-and-die ' . chr(34) . 'tmp.out' . chr(34) . ' :toplevel ' . chr(39) . 'compiler-main :executable t ' . chr(41))
            };
            if (Main::bool(($backend eq 'perl5'))) {
                Main::say(chr(35) . ' Do not edit this file - Generated by ', $_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION);
                Main::print(CompUnit::emit_perl5_program($comp_units))
            };
            if (Main::bool(($backend eq 'js'))) {
                Main::say(chr(47) . chr(47) . ' Do not edit this file - Generated by ', $_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION);
                ((my  $filename = undef) = $perl6lib . chr(47) . 'Perlito' . chr(47) . 'Javascript' . chr(47) . 'Runtime.js');
                if (Main::bool(($verbose))) {
                    warn(chr(47) . chr(47) . ' now loading: ', $filename)
                };
                ((my  $source = undef) = IO::slurp($filename));
                Main::say($source);
                Main::print(CompUnit::emit_javascript_program($comp_units))
            };
            if (Main::bool(($backend eq 'python'))) {
                Main::say(chr(35) . ' Do not edit this file - Generated by ', $_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION);
                Main::say(chr(35) . '-*- coding: utf-8 -*-');
                Main::say('');
                Main::say('from Perlito__Python__Runtime import *');
                Main::say('from Perlito__Python__Prelude import *');
                Main::say('import __builtin__');
                Main::say('__all__ ' . chr(61) . ' ' . chr(91) . chr(93));
                Main::say('');
                for my $c ( @{(($comp_units) || []) || []} ) {
                    Main::say($c->emit_python())
                }
            };
            if (Main::bool(($backend eq 'ruby'))) {
                Main::say(chr(35) . ' Do not edit this file - Generated by ', $_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION);
                Main::say('');
                Main::say('require ' . chr(39) . 'Perlito' . chr(47) . 'Ruby' . chr(47) . 'Runtime.rb' . chr(39));
                Main::say('');
                for my $c ( @{(($comp_units) || []) || []} ) {
                    Main::say($c->emit_ruby())
                }
            };
            if (Main::bool(($backend eq 'parrot'))) {
                Main::say(chr(35) . ' Do not edit this file - Generated by ', $_V6_COMPILER_NAME, ' ', $_V6_COMPILER_VERSION);
                for my $c ( @{(($comp_units) || []) || []} ) {
                    Main::say($c->emit_parrot())
                }
            }
        }
    }


}

1;
