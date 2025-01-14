use strict;
use warnings;

print "Enter op1: ";
my $op1 = <STDIN>;
chomp($op1);

print "Enter op2: ";
my $op2 = <STDIN>;
chomp($op2);

my $ans = 0;

while ($op1 > 0) {
    if ($op1 % 2 != 0) {
        $ans += $op2;
        print "$ans\n";
    }

    $op1 = int($op1 / 2);
    $op2 *= 2;

    print "$op1 $op2\n";
}

print "The answer is: $ans\n";