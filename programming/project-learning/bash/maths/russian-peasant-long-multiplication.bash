#!/bin/bash

# Initialize the answer to 0
ans=0

# Read the first operand from user input
read -p "Enter op1: " op1

# Read the second operand from user input
read -p "Enter op2: " op2

# Loop until the first operand becomes 0
while [ $op1 -gt 0 ]; do
    # If the first operand is odd, add the second operand to the answer
    if [ $((op1 % 2)) -ne 0 ]; then
        ans=$((ans + op2))
        echo $ans
    fi
    
    # Halve the first operand (integer division by 2)
    op1=$((op1 / 2))
    
    # Double the second operand
    op2=$((op2 * 2))
    
    # Print the current values of the operands
    echo $op1 $op2
done

# Print the final answer
echo "The answer is: $ans"