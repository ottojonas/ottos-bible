#!/bin/bash

# Prompt the user to enter a number and read the input into the variable 'number'
read -p "Enter a number: " number

# Loop until the number becomes 1
while [ $number -ne 1 ]; do
    # If the number is even, divide it by 2
    if [ $((number % 2)) -eq 0 ]; then
        number=$((number / 2))
    # If the number is odd, multiply it by 3 and add 1
    else
        number=$((number * 3 + 1))
    fi
    # Print the current value of the number
    echo $number
done