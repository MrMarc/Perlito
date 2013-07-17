
package Perlito5::Grammar::Print;

use strict;

Perlito5::Precedence::add_term( 'print'  => sub { Perlito5::Grammar::Print->term_print($_[0], $_[1]) } );
Perlito5::Precedence::add_term( 'printf' => sub { Perlito5::Grammar::Print->term_print($_[0], $_[1]) } );
Perlito5::Precedence::add_term( 'say'    => sub { Perlito5::Grammar::Print->term_print($_[0], $_[1]) } );
Perlito5::Precedence::add_term( 'exec'   => sub { Perlito5::Grammar::Print->term_print($_[0], $_[1]) } );
Perlito5::Precedence::add_term( 'system' => sub { Perlito5::Grammar::Print->term_print($_[0], $_[1]) } );

token print_decl { 'print' | 'printf' | 'say' | 'exec' | 'system' };

token the_object {
    [
        <before '$'> <Perlito5::Grammar::Sigil.term_sigil>
            <.Perlito5::Grammar::Space.opt_ws>
            <!before ','>
            {
                $MATCH->{capture} = Perlito5::Match::flat($MATCH->{'Perlito5::Grammar::Sigil.term_sigil'})->[1];
            }

        # TODO
        #
        #     [
        #         <two_terms_in_a_row>
        #             { ok ...
        #             }
        #     |
        #         <.Perlito5::Grammar::Space.ws>
        #         '+'
        #         <!Perlito5::Grammar::Space.ws>
        #             { ok ...
        #             }
        #     |
        #         <.Perlito5::Grammar::Space.opt_ws>
        #         <.Perlito5::Precedence::infix>
        #             { return;   # abort because it looks like an infix
        #             }
        #     |
        #         <Perlito5::Expression.list_parse>
        #             {   # abort because there is no list 
        #             ...
        #             }
        #     |
        #             { ok ... 
        #             }
        #     ]
    |
        '{' <Perlito5::Expression.curly_parse> '}'
            <.Perlito5::Grammar::Space.opt_ws>
            <!before ','>
            {
                $MATCH->{capture} = Perlito5::Match::flat($MATCH->{'Perlito5::Expression.curly_parse'});
            }
    |
        <typeglob>
            <.Perlito5::Grammar::Space.opt_ws>
            <!before ','>
            {
                $MATCH->{capture} = Perlito5::Match::flat($MATCH->{'typeglob'});
            }
    ]
};

sub typeglob {
    my $self = $_[0];
    my $str = $_[1];
    my $pos = $_[2];

    my $p = $pos;
    my $m_namespace = Perlito5::Grammar->optional_namespace_before_ident( $str, $p );
    my $namespace = Perlito5::Match::flat($m_namespace);
    $p = $m_namespace->{to};
    my $m_name      = Perlito5::Grammar->ident( $str, $p );

    if (!$m_name) {
        if ($namespace) {
            # namespace without name - X::
            $m_namespace->{capture} = Perlito5::AST::Var->new(
                                          sigil => '::',
                                          name  => '',
                                          namespace => $namespace,
                                      );
            return $m_namespace;
        }
        return;
    }

    my $name = Perlito5::Match::flat($m_name);
    $p = $m_name->{to};

    if ( substr( $str, $p, 2) eq '::' ) {
        # ::X::y::
        $m_name->{to} = $p + 2;
        $m_name->{capture} = Perlito5::AST::Var->new(
                                 sigil => '::',
                                 name  => '',
                                 namespace => $namespace . '::' . $name,
                             );
        return $m_name;
    }

    my $effective_name = ( $namespace || $Perlito5::PKG_NAME ) . '::' . $name;
    my $sig;
    if ( exists $Perlito5::PROTO->{$effective_name} ) {
        # subroutine was predeclared
        return;
    }
    if ( (!$namespace || $namespace eq 'CORE')
          && exists $Perlito5::CORE_PROTO->{"CORE::$name"} 
       )
    {
        # subroutine comes from CORE
        return;
    }

    $m_name->{capture} = Perlito5::AST::Var->new(
                             sigil => '::',
                             name  => '',
                             namespace => $namespace . '::' . $name,
                         );
    return $m_name;
}

sub print_ast {
    my ($decl, $the_object, $expr) = @_;
    Perlito5::AST::Apply->new( 
        'namespace' => 'Perlito5',
        'code'      => $decl,
        'arguments' => [
            $the_object,
            $expr,
        ],
    )
}

token term_print {
    <print_decl> 
    <.Perlito5::Grammar::Space.opt_ws>
    [
        '('
            <.Perlito5::Grammar::Space.opt_ws>
            <the_object>
            <Perlito5::Expression.paren_parse>
        ')'

        { 
            my $list = Perlito5::Match::flat($MATCH->{'Perlito5::Expression.paren_parse'});
            return if !ref($list);
            $MATCH->{capture} = [
                'term',
                print_ast(
                    Perlito5::Match::flat($MATCH->{'print_decl'}),
                    Perlito5::Match::flat($MATCH->{'the_object'}),
                    $list,
                ),
            ]
        }
    |
        <the_object>
        <Perlito5::Expression.list_parse>

        { 
            my $list = Perlito5::Match::flat($MATCH->{'Perlito5::Expression.list_parse'});
            return if !ref($list);
            $MATCH->{capture} = [
                'term',
                print_ast(
                    Perlito5::Match::flat($MATCH->{'print_decl'}),
                    Perlito5::Match::flat($MATCH->{'the_object'}),
                    $list,
                ),
            ]
        }
    ]
};

1;

=begin

=head1 NAME

Perlito5::Grammar::Print - Parser and AST generator for Perlito

=head1 SYNOPSIS

    term_print($str)

=head1 DESCRIPTION

This module parses source code for Perl 5 statements and generates Perlito5 AST.

=head1 AUTHORS

Flavio Soibelmann Glock <fglock@gmail.com>.
The Pugs Team E<lt>perl6-compiler@perl.orgE<gt>.

=head1 COPYRIGHT

Copyright 2013 by Flavio Soibelmann Glock and others.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=end

