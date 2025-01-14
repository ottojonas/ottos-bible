#!/bin/bash

read -p "Enter a number: " number

while [ $number -ne 1 ]; do
    if [ $((number % 2)) -eq 0 ]; then
        number=$((number / 2))
    else
        number=$((number * 3 + 1))
    fi
    echo $number
done