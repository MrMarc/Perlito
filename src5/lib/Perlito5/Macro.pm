use v5;

package Perlito5::AST::Apply;

my %op = (
    'infix:<+=>'  => 'infix:<+>',
    'infix:<-=>'  => 'infix:<->',
    'infix:<*=>'  => 'infix:<*>',
    'infix:</=>'  => 'infix:</>',
    'infix:<||=>' => 'infix:<||>',
    'infix:<&&=>' => 'infix:<&&>',
    'infix:<|=>'  => 'infix:<|>',
    'infix:<&=>'  => 'infix:<&>',
    'infix:<//=>' => 'infix:<//>',
    'infix:<.=>'  => 'list:<.>',
);

sub op_assign {
    my $self = $_[0];

    my $code = $self->{code};
    return 0 if ref($code);

    if (exists( $op{$code} )) {
        return Perlito5::AST::Apply->new(
            code      => 'infix:<=>',
            arguments => [
                $self->{arguments}->[0],
                Perlito5::AST::Apply->new(
                    code      => $op{$code},
                    arguments => $self->{arguments},
                ),
            ]
        );
    }

    return 0;
}


package Perlito5::AST::Do;
sub simplify {
    my $self = $_[0];

    my $block;
    if ($self->{block}->isa('Perlito5::AST::Lit::Block')) {
        $block = $self->{block}->stmts;
    }
    else {
        $block = [ $self->{block} ]
    }
    if (scalar(@$block) == 1) {
        # optimize some code generated by the regex compiler
        my $stmt = $block->[0];
        if ($stmt->isa('Perlito5::AST::Apply') && $stmt->code() eq 'circumfix:<( )>') {
            my $args = $stmt->arguments;
            return Perlito5::AST::Do->new( block => $args->[0] )->simplify
                if @$args == 1;
            # do {()}
            return Perlito5::AST::Do->new( block => $block );
        }
        if ($stmt->isa('Perlito5::AST::Do')) {
            return $stmt->simplify;
        }
    }
    return Perlito5::AST::Do->new( block => $block );
}

=begin

=head1 NAME

Perlito5::Macro - Ast macros for Perlito

=head1 SYNOPSIS

    $ast = $ast.op_assign()

=head1 DESCRIPTION

This module implements some Ast transformations for the Perlito compiler.

=head1 AUTHORS

Flavio Soibelmann Glock <fglock@gmail.com>.
The Pugs Team E<lt>perl6-compiler@perl.orgE<gt>.

=head1 SEE ALSO

The Perl 6 homepage at L<http://dev.perl.org/perl6>.

The Pugs homepage at L<http://pugscode.org/>.

=head1 COPYRIGHT

Copyright 2011, 2012 by Flavio Soibelmann Glock.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=end

