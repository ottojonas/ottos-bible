<?php
// Prompt the user to enter the first operand
echo "Enter op1: ";
// Read the first operand from user input, trim any whitespace, and convert it to an integer
$op1 = intval(trim(fgets(STDIN)));

// Prompt the user to enter the second operand
echo "Enter op2: ";
// Read the second operand from user input, trim any whitespace, and convert it to an integer
$op2 = intval(trim(fgets(STDIN)));

// Initialize the answer to 0
$ans = 0;

// Loop until the first operand becomes 0
while ($op1 > 0) {
    // If the first operand is odd, add the second operand to the answer
    if ($op1 % 2 != 0) {
        $ans += $op2;
        // Print the current value of the answer
        echo "$ans\n";
    }

    // Halve the first operand (integer division by 2)
    $op1 = intdiv($op1, 2);
    // Double the second operand
    $op2 *= 2;

    // Print the current values of the operands
    echo "$op1 $op2\n";
}

// Print the final answer
echo "The answer is: $ans\n";
?>