<?php
// Prompt the user to enter a number
echo "Enter a number: ";
// Read the user input, trim any whitespace, convert it to an integer, and store it in the variable $number
$number = intval(trim(fgets(STDIN)));

// Loop until the number becomes 1
while ($number != 1) {
    // If the number is even, divide it by 2
    if ($number % 2 == 0) {
        $number = intdiv($number, 2);
    } else {
        // If the number is odd, multiply it by 3 and add 1
        $number = $number * 3 + 1;
    }
    // Print the current value of the number
    echo "$number\n";
}
?>