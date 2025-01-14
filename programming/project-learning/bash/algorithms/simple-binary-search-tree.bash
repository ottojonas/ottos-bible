#!/bin/bash

data=("A" "+" "B" "*" "C" "/" "D" "-" "E")

left=(null 0 null 2 null 1 null 6 null)
right=(null 3 null 4 null 7 null 8 null)

root=5

P() {
    local T=$1
    if [ "${left[T]}" != "null" ]; then
        P "${left[T]}"
    fi
    if [ "${right[T]}" != "null" ]; then
        P "${right[T]}"
    fi
    echo "${data[T]}"
}

P $root