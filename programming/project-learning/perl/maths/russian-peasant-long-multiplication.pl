use strict;
use warnings;

# Prompt the user to enter the first operand
print "Enter op1: ";
my $op1 = <STDIN>; # Read the first operand from standard input
chomp($op1); # Remove the newline character from the input

# Prompt the user to enter the second operand
print "Enter op2: ";
my $op2 = <STDIN>; # Read the second operand from standard input
chomp($op2); # Remove the newline character from the input

# Initialize the answer to 0
my $ans = 0;

# Loop until the first operand becomes 0
while ($op1 > 0) {
    # If the first operand is odd, add the second operand to the answer
    if ($op1 % 2 != 0) {
        $ans += $op2;
        print "$ans\n"; # Print the current value of the answer
    }

    # Halve the first operand (integer division by 2)
    $op1 = int($op1 / 2);
    # Double the second operand
    $op2 *= 2;

    # Print the current values of the operands
    print "$op1 $op2\n";
}

# Print the final answer
print "The answer is: $ans\n";