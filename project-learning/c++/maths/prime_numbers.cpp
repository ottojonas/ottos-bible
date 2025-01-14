#include <iostream>
#include <vector>

int main() {
    // Read the upper limit for the range from user input
    int p;
    std::cout << "range: ";
    std::cin >> p;

    // Initialize a vector of boolean values representing primality, initially all set to true
    std::vector<bool> primes(p, true);

    // Iterate through each number in the range starting from 2 to p-1
    for (int possiblePrime = 2; possiblePrime < p; ++possiblePrime) {
        // If the number is still marked as prime
        if (primes[possiblePrime]) {
            // Mark all multiples of the number as not prime (false)
            for (int multiple = possiblePrime * 2; multiple < p; multiple += possiblePrime) {
                primes[multiple] = false;
            }
        }
    }

    // Create a vector of prime numbers by filtering indices marked as true and greater than 1
    std::vector<int> primeNumbers;
    for (int index = 2; index < p; ++index) {
        if (primes[index]) {
            primeNumbers.push_back(index);
        }
    }

    // Print the list of prime numbers
    for (int prime : primeNumbers) {
        std::cout << prime << " ";
    }
    std::cout << std::endl;

    return 0;
}