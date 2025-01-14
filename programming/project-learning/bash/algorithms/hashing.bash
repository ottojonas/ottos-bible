#!/bin/bash

read -p "Enter data size: " dataSize

data=()
hashTable=()

for ((i=0; i<dataSize; i++)); do
    hashTable+=("null")
    nameLength=$((RANDOM % 10 + 3))
    tempString=""
    for ((j=0; j<nameLength; j++)); do
        char=$(printf "\x$(printf %x $((RANDOM % 26 + 65)))")
        tempString+=$char
    done
    data+=("$tempString")
done

echo "${data[@]}"