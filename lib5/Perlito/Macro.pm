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
    package Lit::Array;
        sub new { shift; bless { @_ }, "Lit::Array" }
        sub array1 { $_[0]->{array1} };
        sub expand_interpolation {
            my $self = $_[0];
            ((my  $needs_interpolation = undef) = 0);
            (my  $List_items = []);
            for my $item ( @{$self->{array1} || []} ) {
                if (Main::bool(Main::and(Main::isa($item, 'Apply'), sub { (Main::or(($item->code() eq 'circumfix:' . chr(60) . chr(40) . ' ' . chr(41) . chr(62)), sub { ($item->code() eq 'list:' . chr(60) . ',' . chr(62)) })) }))) {
                    for my $arg ( @{(($item->arguments()) || []) || []} ) {
                        push( @{$List_items}, $arg )
                    }
                }
                else {
                    push( @{$List_items}, $item )
                }
            };
            for my $item ( @{$List_items || []} ) {
                if (Main::bool(Main::or(Main::and(Main::isa($item, 'Var'), sub { ($item->sigil() eq chr(64)) }), sub { Main::and(Main::isa($item, 'Apply'), sub { (Main::or(($item->code() eq 'prefix:' . chr(60) . chr(64) . chr(62)), sub { ($item->code() eq 'infix:' . chr(60) . '..' . chr(62)) })) }) }))) {
                    ($needs_interpolation = 1)
                }
            };
            if (Main::bool(Main::and($needs_interpolation, sub { (scalar( @{$List_items} ) == 1) }))) {
                return scalar ($List_items->[0])
            };
            (my  $List_s = []);
            for my $item ( @{$List_items || []} ) {
                if (Main::bool(Main::or(Main::and(Main::isa($item, 'Var'), sub { ($item->sigil() eq chr(64)) }), sub { Main::and(Main::isa($item, 'Apply'), sub { (Main::or(($item->code() eq 'prefix:' . chr(60) . chr(64) . chr(62)), sub { ($item->code() eq 'infix:' . chr(60) . '..' . chr(62)) })) }) }))) {
                    push( @{$List_s}, Apply->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Var->new(('name' => 'v'), ('namespace' => ''), ('sigil' => chr(64)), ('twigil' => '')) );
    push( @{$List_a}, $item );
    $List_a
}), ('code' => 'infix:' . chr(60) . chr(61) . chr(62)), ('namespace' => '')) );
                    push( @{$List_s}, For->new(('body' => Lit::Block->new(('sig' => Var->new(('name' => 'x'), ('namespace' => ''), ('sigil' => chr(36)), ('twigil' => ''))), ('stmts' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Call->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Index->new(('index_exp' => Var->new(('name' => 'x'), ('namespace' => ''), ('sigil' => chr(36)), ('twigil' => ''))), ('obj' => Var->new(('name' => 'v'), ('namespace' => ''), ('sigil' => chr(64)), ('twigil' => '')))) );
    $List_a
}), ('hyper' => ''), ('invocant' => Var->new(('name' => 'a'), ('namespace' => ''), ('sigil' => chr(64)), ('twigil' => ''))), ('method' => 'push')) );
    $List_a
}))), ('cond' => Apply->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Val::Int->new(('int' => 0)) );
    push( @{$List_a}, Apply->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Apply->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Call->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    $List_a
}), ('hyper' => ''), ('invocant' => Var->new(('name' => 'v'), ('namespace' => ''), ('sigil' => chr(64)), ('twigil' => ''))), ('method' => 'elems')) );
    push( @{$List_a}, Val::Int->new(('int' => 1)) );
    $List_a
}), ('code' => 'infix:' . chr(60) . '-' . chr(62)), ('namespace' => '')) );
    $List_a
}), ('code' => 'circumfix:' . chr(60) . chr(40) . ' ' . chr(41) . chr(62)), ('namespace' => '')) );
    $List_a
}), ('code' => 'infix:' . chr(60) . '..' . chr(62)), ('namespace' => ''))), ('topic' => undef)) )
                }
                else {
                    push( @{$List_s}, Call->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, $item );
    $List_a
}), ('hyper' => ''), ('invocant' => Var->new(('name' => 'a'), ('namespace' => ''), ('sigil' => chr(64)), ('twigil' => ''))), ('method' => 'push')) )
                }
            };
            return scalar (Do->new(('block' => Lit::Block->new(('sig' => undef), ('stmts' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Decl->new(('decl' => 'my'), ('type' => ''), ('var' => Var->new(('name' => 'a'), ('namespace' => ''), ('sigil' => chr(64)), ('twigil' => '')))) );
    push( @{$List_a}, Decl->new(('decl' => 'my'), ('type' => ''), ('var' => Var->new(('name' => 'v'), ('namespace' => ''), ('sigil' => chr(64)), ('twigil' => '')))) );
    ($List_v = $List_s);
    for my $x ( @{[0 .. ((scalar( @{$List_v} ) - 1))] || []} ) {
        push( @{$List_a}, $List_v->[$x] )
    };
    push( @{$List_a}, Var->new(('name' => 'a'), ('namespace' => ''), ('sigil' => chr(64)), ('twigil' => '')) );
    $List_a
})))))
        }
    }

;
    {
    package Lit::Hash;
        sub new { shift; bless { @_ }, "Lit::Hash" }
        sub hash1 { $_[0]->{hash1} };
        sub expand_interpolation {
            my $self = $_[0];
            (my  $List_items = []);
            for my $item ( @{$self->{hash1} || []} ) {
                if (Main::bool(Main::and(Main::isa($item, 'Apply'), sub { (Main::or(($item->code() eq 'circumfix:' . chr(60) . chr(40) . ' ' . chr(41) . chr(62)), sub { ($item->code() eq 'list:' . chr(60) . ',' . chr(62)) })) }))) {
                    for my $arg ( @{(($item->arguments()) || []) || []} ) {
                        push( @{$List_items}, $arg )
                    }
                }
                else {
                    push( @{$List_items}, $item )
                }
            };
            (my  $List_s = []);
            for my $item ( @{$List_items || []} ) {
                if (Main::bool(Main::and(Main::isa($item, 'Apply'), sub { ($item->code() eq 'infix:' . chr(60) . chr(61) . chr(62) . chr(62)) }))) {
                    push( @{$List_s}, Apply->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Lookup->new(('index_exp' => $item->arguments()->[0]), ('obj' => Var->new(('name' => 'a'), ('namespace' => ''), ('sigil' => chr(37)), ('twigil' => '')))) );
    push( @{$List_a}, $item->arguments()->[1] );
    $List_a
}), ('code' => 'infix:' . chr(60) . chr(61) . chr(62)), ('namespace' => '')) )
                }
                else {
                    if (Main::bool(Main::or(Main::and(Main::isa($item, 'Var'), sub { ($item->sigil() eq chr(37)) }), sub { Main::and(Main::isa($item, 'Apply'), sub { ($item->code() eq 'prefix:' . chr(60) . chr(37) . chr(62)) }) }))) {
                        push( @{$List_s}, For->new(('body' => Lit::Block->new(('sig' => Var->new(('name' => 'p'), ('namespace' => ''), ('sigil' => chr(36)), ('twigil' => ''))), ('stmts' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Apply->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Lookup->new(('index_exp' => Call->new(('arguments' => undef), ('hyper' => ''), ('invocant' => Var->new(('name' => 'p'), ('namespace' => ''), ('sigil' => chr(36)), ('twigil' => ''))), ('method' => 'key'))), ('obj' => Var->new(('name' => 'a'), ('namespace' => ''), ('sigil' => chr(37)), ('twigil' => '')))) );
    push( @{$List_a}, Call->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    $List_a
}), ('hyper' => ''), ('invocant' => Var->new(('name' => 'p'), ('namespace' => ''), ('sigil' => chr(36)), ('twigil' => ''))), ('method' => 'value')) );
    $List_a
}), ('code' => 'infix:' . chr(60) . chr(61) . chr(62)), ('namespace' => '')) );
    $List_a
}))), ('cond' => Apply->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Apply->new(('arguments' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Call->new(('arguments' => undef), ('hyper' => ''), ('invocant' => $item), ('method' => 'pairs')) );
    $List_a
}), ('code' => 'circumfix:' . chr(60) . chr(40) . ' ' . chr(41) . chr(62)), ('namespace' => '')) );
    $List_a
}), ('code' => 'prefix:' . chr(60) . chr(64) . chr(62)), ('namespace' => ''))), ('topic' => undef)) )
                    }
                    else {
                        die('Error in hash composer: ', Main::perl($item, ))
                    }
                }
            };
            return scalar (Do->new(('block' => Lit::Block->new(('sig' => undef), ('stmts' => do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, Decl->new(('decl' => 'my'), ('type' => ''), ('var' => Var->new(('name' => 'a'), ('namespace' => ''), ('sigil' => chr(37)), ('twigil' => '')))) );
    ($List_v = $List_s);
    for my $x ( @{[0 .. ((scalar( @{$List_v} ) - 1))] || []} ) {
        push( @{$List_a}, $List_v->[$x] )
    };
    push( @{$List_a}, Var->new(('name' => 'a'), ('namespace' => ''), ('sigil' => chr(37)), ('twigil' => '')) );
    $List_a
})))))
        }
    }

;
    {
    package Do;
        sub new { shift; bless { @_ }, "Do" }
        sub simplify {
            my $self = $_[0];
            (my  $block = undef);
            if (Main::bool(Main::isa($self->{block}, 'Lit::Block'))) {
                ($block = $self->{block}->stmts())
            }
            else {
                ($block = do {
    (my  $List_a = []);
    (my  $List_v = []);
    push( @{$List_a}, $self->{block} );
    $List_a
})
            };
            if (Main::bool((scalar( @{$block} ) == 1))) {
                ((my  $stmt = undef) = $block->[0]);
                if (Main::bool(Main::and(Main::isa($stmt, 'Apply'), sub { ($stmt->code() eq 'circumfix:' . chr(60) . chr(40) . ' ' . chr(41) . chr(62)) }))) {
                    ((my  $args = undef) = $stmt->arguments());
                    return scalar (Do->new(('block' => $args->[0]))->simplify())
                };
                if (Main::bool(Main::isa($stmt, 'Do'))) {
                    return scalar ($stmt->simplify())
                }
            };
            return scalar (Do->new(('block' => $block)))
        }
    }


}

1;
