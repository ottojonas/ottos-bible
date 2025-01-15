#!/bin/bash

# Initialize the data array with elements representing nodes of the binary search tree
data=("A" "+" "B" "*" "C" "/" "D" "-" "E")

# Initialize the left child array, where each index corresponds to a node in the data array
left=(null 0 null 2 null 1 null 6 null)
# Initialize the right child array, where each index corresponds to a node in the data array
right=(null 3 null 4 null 7 null 8 null)

# Set the root of the binary search tree
root=5

# Define a recursive function P to traverse the binary search tree
P() {
    local T=$1
    # Traverse the left subtree if it exists
    if [ "${left[T]}" != "null" ]; then
        P "${left[T]}"
    fi
    # Traverse the right subtree if it exists
    if [ "${right[T]}" != "null" ]; then
        P "${right[T]}"
    fi
    # Print the data of the current node
    echo "${data[T]}"
}

# Start the traversal from the root
P $root