use strict;
use warnings;

print "Enter a number: ";
my $number = <STDIN>;  # Read the number from user input
chomp($number);        # Remove the newline character from the input

# Loop until the number becomes 1
while ($number != 1) {
    if ($number % 2 == 0) {
        $number = int($number / 2);  # If the number is even, divide it by 2
    } else {
        $number = $number * 3 + 1;  # If the number is odd, multiply it by 3 and add 1
    }
    print "$number\n";  # Print the current value of the number
}