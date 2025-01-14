p <- as.integer(readline(prompt = "range: "))

# Initialize a vector of boolean values representing primality, initially all set to "T" (True)
primes <- rep("T", p)

# Iterate through each number in the range starting from 2 to p-1
for (possiblePrime in 2:(p - 1)) {
    # If the number is still marked as prime
    if (primes[possiblePrime] == "T") {
        # Mark all multiples of the number as not prime ("F")
        for (multiple in seq(possiblePrime * 2, p - 1, by = possiblePrime)) {
            primes[multiple] <- "F"
        }
    }
}

# Create a list of prime numbers by filtering indices marked as "T" (True) and greater than 1
primeNumbers <- which(primes == "T" & seq_along(primes) > 1)

# Print the list of prime numbers
print(primeNumbers)