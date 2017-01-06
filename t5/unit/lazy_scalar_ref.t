
use feature 'say';
# use strict;

say "1..8";

sub x { $_[0] = 3 }

my $v;
my $a;
$v = $$a;
print "not " if defined $v; say "ok 1 - $v";
$v = $a;
print "not " if defined $v; say "ok 2 - $v";

x($$a);
$v = $$a;
print "not " if $v != 3; say "ok 3 - $v";
$v = $a;
print "not " if !ref($v); say "ok 4 - $v " . ref($v);

sub z { $_[0]++ }

$a = undef;
z($$a);
$v = $$a;
print "not " if $v != 1; say "ok 5 - $v";
$v = $a;
print "not " if !ref($v); say "ok 6 - $v " . ref($v);

sub t { $_[0] . "" }

$a = undef;
t($$a);
$v = $a;
print "not " if !defined $v; say "ok 7 - $v " . ref($v);

sub u { $_[0] }

$a = undef;
u($$a);
$v = $a;
print "not " if !defined $v; say "ok 8 - $v " . ref($v);
