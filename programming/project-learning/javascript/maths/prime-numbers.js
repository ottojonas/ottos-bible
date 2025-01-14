const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question('range: ', p => {
    p = parseInt(p);

    // Initialize an array of boolean values representing primality, initially all set to "T" (True)
    const primes = Array(p).fill("T");

    // Iterate through each number in the range starting from 2 to p-1
    for (let possiblePrime = 2; possiblePrime < p; possiblePrime++) {
        // If the number is still marked as prime
        if (primes[possiblePrime] === "T") {
            // Mark all multiples of the number as not prime ("F")
            for (let multiple = possiblePrime * 2; multiple < p; multiple += possiblePrime) {
                primes[multiple] = "F";
            }
        }
    }

    // Create a list of prime numbers by filtering indices marked as "T" (True) and greater than 1
    const primeNumbers = primes
        .map((value, index) => (value === "T" && index > 1 ? index : null))
        .filter(value => value !== null);

    // Print the list of prime numbers
    console.log(primeNumbers);

    readline.close();
});