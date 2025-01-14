<?php
echo "range: ";
$p = intval(trim(fgets(STDIN)));

// Initialize an array of boolean values representing primality, initially all set to "T" (True)
$primes = array_fill(0, $p, "T");

// Iterate through each number in the range starting from 2 to p-1
for ($possiblePrime = 2; $possiblePrime < $p; $possiblePrime++) {
    // If the number is still marked as prime
    if ($primes[$possiblePrime] === "T") {
        // Mark all multiples of the number as not prime ("F")
        for ($multiple = $possiblePrime * 2; $multiple < $p; $multiple += $possiblePrime) {
            $primes[$multiple] = "F";
        }
    }
}

// Create a list of prime numbers by filtering indices marked as "T" (True) and greater than 1
$primeNumbers = array_filter(
    array_keys($primes),
    fn($index) => $primes[$index] === "T" && $index > 1
);

// Print the list of prime numbers
echo implode(" ", $primeNumbers) . "\n";
?>