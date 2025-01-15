#!/bin/bash

declare -a queue
maxSize=5
head=-1
tail=-1

enqueue() {
    local data=$1
    if [ $(( (tail + 1) % maxSize )) -eq $head ]; then
        echo "Circular Queue is full"
    elif [ $head -eq -1 ]; then
        head=0
        tail=0
        queue[$tail]=$data
    else
        tail=$(( (tail + 1) % maxSize ))
        queue[$tail]=$data
    fi
}

dequeue() {
    if [ $head -eq -1 ]; then
        echo "Circular Queue is empty"
    elif [ $head -eq $tail ]; then
        local temp=${queue[$head]}
        head=-1
        tail=-1
        echo $temp
    else
        local temp=${queue[$head]}
        head=$(( (head + 1) % maxSize ))
        echo $temp
    fi
}