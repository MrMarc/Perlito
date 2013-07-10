use feature 'say';
use strict;

say "1..25";

{
    package Exists; 
    sub exists { 123 }      # bultin name
}

{
    package Exists2; 
    sub exists2 { 123 }      # not a bultin name
}

package This;
sub this { 123 }

my $code;
my $expect;
my $package = __PACKAGE__;
my $object  = bless {}, 'This';
my $count   = 1;

sub show {
    my $v = eval $code || 'fail';
    print "# $v \n";
    if ( $v eq 'fail' ) {
        my $err = $@;
        chomp $err;
        print "# << $code >>\n";
        print "# $err\n";
        print "# $expect\n";
        if (!$expect || substr($err, 0, length($expect)) ne $expect) {
            print "not ";
        }
        say "ok $count";
    }
    else {
        if ($expect) {
            print "not ";
        }
        say "ok $count";
    }
    $count++;
}


#----- package outside this scope

$code = 'exists2 Exists2; 1';
$expect = '';
show();

$code = 'exists2 Exists2 123; 1';
$expect = '';
show();

$code = 'exists2 Exists2::; 1';
$expect = '';
show();

$code = 'my $x = exists2 Exists2(123); 1';
$expect = '';
show();


#----- package does not exist

$code = 'exists2 NotExist; 1';
$expect = 'Can\'t locate object method "exists2" via package "NotExist" (perhaps you forgot to load "NotExist"?)';
show();

$code = 'exists2 NotExist 123; 1';
$expect = 'Can\'t locate object method "exists2" via package "NotExist" (perhaps you forgot to load "NotExist"?)';
show();

$code = 'exists2 NotExist::; 1';
$expect = 'Can\'t locate object method "exists2" via package "NotExist" (perhaps you forgot to load "NotExist"?)';
show();

$code = 'my $x = exists2 NotExist(123); 1';
$expect = 'Can\'t locate object method "exists2" via package "NotExist" (perhaps you forgot to load "NotExist"?)';
show();



#----- package outside this scope, method is a builtin name

$code = 'exists Exists; 1';
$expect = 'exists argument is not a HASH or ARRAY element or a subroutine';
show();

# # Number found where operator expected
# $code = 'exists Exists 123; 1';
# $expect = 'exists argument is not a HASH or ARRAY element or a subroutine';
# show();

$code = 'exists Exists::; 1';
$expect = 'exists argument is not a HASH or ARRAY element or a subroutine';
show();

$code = 'my $x = exists Exists(123); 1';
$expect = 'exists argument is not a subroutine name';
show();


#----- package inside this scope


$code = 'this This; 1';
$expect = '';
show();

$code = 'this This 123; 1';
$expect = '';
show();

$code = 'this This::; 1';
$expect = '';
show();

$code = 'my $x = this This(123); 1';
$expect = '';
show();


#----- package in a variable

$code = 'this $package; 1';
$expect = '';
show();

$code = 'this $package 123; 1';
$expect = 'syntax error';
show();

$code = 'my $x = this $package (123); 1';
$expect = 'syntax error';
show();


#----- object in a variable

$code = 'this $object; 1';
$expect = '';
show();

$code = 'this $object 123; 1';
$expect = 'syntax error';
show();

$code = 'my $x = this $object (123); 1';
$expect = 'syntax error';
show();


#----- object in a block

$code = 'this {$object}; 1';
$expect = '';
show();

$code = 'this {$object} 123; 1';
$expect = 'syntax error';
show();

$code = 'my $x = this {$object} (123); 1';
$expect = 'syntax error';
show();


#----- object in parentheses

# Number found where operator expected
$code = 'this ($object); 1';
$expect = '';
show();

# # Number found where operator expected
# $code = 'this ($object 123); 1';
# $expect = 'syntax error';
# show();

# # Number found where operator expected
# $code = 'my $x = this ($object 123); 1';
# $expect = 'syntax error';
# show();



__END__

