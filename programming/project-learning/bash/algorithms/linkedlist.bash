#!/bin/bash

# Define a Node structure using associative arrays
declare -A head
head[data]=1

declare -A node2
node2[data]=2

declare -A node3
node3[data]=3

# Link the nodes to form a linked list
head[next]=node2
node2[next]=node3
node3[next]=null

# Linked List representation:
# head -> Node(1) -> Node(2) -> Node(3) -> null

# Initialize temp to head and traverse the linked list
temp=head
while [ "${!temp[next]}" != "null" ]; do
    # Print the data of the current node
    echo -n "${!temp[data]} "
    # Move to the next node
    temp=${!temp[next]}
done
# Print the data of the last node
echo -n "${!temp[data]} "