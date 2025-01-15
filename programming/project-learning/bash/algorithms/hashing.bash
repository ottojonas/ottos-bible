#!/bin/bash

# Prompt the user to enter the size of the data
read -p "Enter data size: " dataSize

# Initialize empty arrays for data and hash table
data=()
hashTable=()

# Loop to generate random data and initialize the hash table
for ((i=0; i<dataSize; i++)); do
    # Add "null" to the hash table for each data entry
    hashTable+=("null")
    # Generate a random length for the name between 3 and 12 characters
    nameLength=$((RANDOM % 10 + 3))
    tempString=""
    # Generate a random string of uppercase letters
    for ((j=0; j<nameLength; j++)); do
        char=$(printf "\x$(printf %x $((RANDOM % 26 + 65)))")
        tempString+=$char
    done
    # Add the generated string to the data array
    data+=("$tempString")
done

# Print the generated data
echo "${data[@]}"