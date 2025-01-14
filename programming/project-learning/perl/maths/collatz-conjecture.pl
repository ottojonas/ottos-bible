use strict;
use warnings;

print "Enter a number: ";
my $number = <STDIN>;
chomp($number);

while ($number != 1) {
    if ($number % 2 == 0) {
        $number = int($number / 2);
    } else {
        $number = $number * 3 + 1;
    }
    print "$number\n";
}