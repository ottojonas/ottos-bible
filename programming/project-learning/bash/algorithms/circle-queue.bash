#!/bin/bash

# Declare an array to represent the circular queue
declare -a queue
# Set the maximum size of the queue
maxSize=5
# Initialize the head and tail pointers to -1, indicating an empty queue
head=-1
tail=-1

# Function to add an element to the queue
enqueue() {
    local data=$1
    # Check if the queue is full
    if [ $(( (tail + 1) % maxSize )) -eq $head ]; then
        echo "Circular Queue is full"
    # Check if the queue is empty
    elif [ $head -eq -1 ]; then
        head=0
        tail=0
        queue[$tail]=$data
    # Add the element to the queue and update the tail pointer
    else
        tail=$(( (tail + 1) % maxSize ))
        queue[$tail]=$data
    fi
}

# Function to remove an element from the queue
dequeue() {
    # Check if the queue is empty
    if [ $head -eq -1 ]; then
        echo "Circular Queue is empty"
    # Check if the queue has only one element
    elif [ $head -eq $tail ]; then
        local temp=${queue[$head]}
        head=-1
        tail=-1
        echo $temp
    # Remove the element from the queue and update the head pointer
    else
        local temp=${queue[$head]}
        head=$(( (head + 1) % maxSize ))
        echo $temp
    fi
}