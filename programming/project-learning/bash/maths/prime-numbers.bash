#!/bin/bash

read -p "range: " p

# Initialize an array of boolean values representing primality, initially all set to "T" (True)
primes=()
for ((i=0; i<p; i++)); do
    primes[i]="T"
done

# Iterate through each number in the range starting from 2 to p-1
for ((possiblePrime=2; possiblePrime<p; possiblePrime++)); do
    # If the number is still marked as prime
    if [[ ${primes[possiblePrime]} == "T" ]]; then
        # Mark all multiples of the number as not prime ("F")
        for ((multiple=possiblePrime*2; multiple<p; multiple+=possiblePrime)); do
            primes[multiple]="F"
        done
    fi
done

# Create a list of prime numbers by filtering indices marked as "T" (True) and greater than 1
primeNumbers=()
for ((index=2; index<p; index++)); do
    if [[ ${primes[index]} == "T" ]]; then
        primeNumbers+=($index)
    fi
done

# Print the list of prime numbers
echo "${primeNumbers[@]}"