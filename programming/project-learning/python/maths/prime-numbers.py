# Read the upper limit for the range from user input
p = int(input("range: "))

# Initialize a list of boolean values representing primality, initially all set to "T" (True)
primes = ["T"] * p

# Iterate through each number in the range starting from 2 to p-1
for possiblePrime in range(2, p):
    # If the number is still marked as prime
    if primes[possiblePrime] == "T":
        # Mark all multiples of the number as not prime ("F")
        for multiple in range(possiblePrime * 2, p, possiblePrime):
            primes[multiple] = "F"

# Create a list of prime numbers by filtering indices marked as "T" (True) and greater than 1
primeNumbers = [
    index for index, value in enumerate(primes) if value == "T" and index > 1
]

# Print the list of prime numbers
print(primeNumbers)