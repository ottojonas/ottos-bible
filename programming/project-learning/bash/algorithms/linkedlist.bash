#!/bin/bash

# Define a Node structure
declare -A head
head[data]=1

declare -A node2
node2[data]=2

declare -A node3
node3[data]=3

head[next]=node2
node2[next]=node3
node3[next]=null

# Linked List
# head -> Node(1) -> Node(2) -> Node(3) -> null

temp=head
while [ "${!temp[next]}" != "null" ]; do
    echo -n "${!temp[data]} "
    temp=${!temp[next]}
done
echo -n "${!temp[data]} "