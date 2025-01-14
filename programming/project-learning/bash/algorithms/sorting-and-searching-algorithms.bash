#!/bin/bash

linearSearch() {
    local data=("${!1}")
    local searchKey=$2
    for item in "${data[@]}"; do
        if [[ $item -eq $searchKey ]]; then
            echo "Found"
            return 0
        fi
    done
    echo "Not Found"
    return 1
}

binarySearch() {
    local data=("${!1}")
    local searchKey=$2
    local head=0
    local tail=$((${#data[@]} - 1))
    while [[ $head -le $tail ]]; do
        local midPoint=$(( (head + tail) / 2 ))
        if [[ ${data[midPoint]} -eq $searchKey ]]; then
            echo "Found"
            return 0
        elif [[ ${data[midPoint]} -gt $searchKey ]]; then
            tail=$((midPoint - 1))
        else
            head=$((midPoint + 1))
        fi
    done
    echo "Not Found"
    return 1
}

bubbleSort() {
    local data=("${!1}")
    local nlen=$((${#data[@]} - 1))
    while true; do
        local swap=false
        for ((i = 0; i < nlen; i++)); do
            if [[ ${data[i]} -gt ${data[i + 1]} ]]; then
                local temp=${data[i]}
                data[i]=${data[i + 1]}
                data[i + 1]=$temp
                swap=true
            fi
        done
        if [[ $swap == false ]]; then
            break
        fi
        nlen=$((nlen - 1))
    done
    echo "${data[@]}"
}

insertionSort() {
    local data=("${!1}")
    for ((i = 1; i < ${#data[@]}; i++)); do
        local key=${data[i]}
        local j=$((i - 1))
        while [[ $j -ge 0 && ${data[j]} -gt $key ]]; do
            data[j + 1]=${data[j]}
            j=$((j - 1))
        done
        data[j + 1]=$key
    done
    echo "${data[@]}"
}

mergeSort() {
    local data=("${!1}")
    if [[ ${#data[@]} -le 1 ]]; then
        echo "${data[@]}"
        return
    fi
    local mid=$(( ${#data[@]} / 2 ))
    local left=("${data[@]:0:mid}")
    local right=("${data[@]:mid}")
    left=($(mergeSort left[@]))
    right=($(mergeSort right[@]))
    merge left[@] right[@]
}

merge() {
    local left=("${!1}")
    local right=("${!2}")
    local result=()
    while [[ ${#left[@]} -gt 0 && ${#right[@]} -gt 0 ]]; do
        if [[ ${left[0]} -le ${right[0]} ]]; then
            result+=("${left[0]}")
            left=("${left[@]:1}")
        else
            result+=("${right[0]}")
            right=("${right[@]:1}")
        fi
    done
    result+=("${left[@]}")
    result+=("${right[@]}")
    echo "${result[@]}"
}

quickSort() {
    local data=("${!1}")
    if [[ ${#data[@]} -le 1 ]]; then
        echo "${data[@]}"
        return
    fi
    local pivot=${data[0]}
    local less=()
    local greater=()
    for ((i = 1; i < ${#data[@]}; i++)); do
        if [[ ${data[i]} -le $pivot ]]; then
            less+=("${data[i]}")
        else
            greater+=("${data[i]}")
        fi
    done
    less=($(quickSort less[@]))
    greater=($(quickSort greater[@]))
    echo "${less[@]} $pivot ${greater[@]}"
}

getSearchKey() {
    read -p "Enter search key: " searchKey
    echo $searchKey
}

createData() {
    read -p "Enter size of data set: " numItems
    local data=()
    for ((i = 0; i < numItems; i++)); do
        data+=($((RANDOM % (numItems * 2) + 1)))
    done
    echo "${data[@]}"
}

viewData() {
    local data=("${!1}")
    echo "${data[@]}"
}

main() {
    local data=($(createData))
    local tempData=("${data[@]}")
    local choice=""
    while [[ $choice != "8" ]]; do
        echo "1. Linear search"
        echo "2. Binary search"
        echo "3. Bubble sort"
        echo "4. Insertion sort"
        echo "5. Merge sort"
        echo "6. View Data"
        echo "7. Restore original data"
        echo "8. Quit"
        echo "9. Quick Sort"
        read -p "Make selection: " choice
        if [[ $choice == "1" ]]; then
            local searchKey=$(getSearchKey)
            linearSearch data[@] $searchKey
        elif [[ $choice == "2" ]]; then
            local searchKey=$(getSearchKey)
            binarySearch data[@] $searchKey
        elif [[ $choice == "3" ]]; then
            local start=$(date +%s%N)
            data=($(bubbleSort data[@]))
            local end=$(date +%s%N)
            local duration=$(( (end - start) / 1000000 ))
            echo "Total time: $duration ms"
        elif [[ $choice == "4" ]]; then
            local start=$(date +%s%N)
            data=($(insertionSort data[@]))
            local end=$(date +%s%N)
            local duration=$(( (end - start) / 1000000 ))
            echo "Total time: $duration ms"
        elif [[ $choice == "5" ]]; then
            local start=$(date +%s%N)
            data=($(mergeSort data[@]))
            local end=$(date +%s%N)
            local duration=$(( (end - start) / 1000000 ))
            echo "Total time: $duration ms"
        elif [[ $choice == "6" ]]; then
            viewData data[@]
        elif [[ $choice == "7" ]]; then
            data=("${tempData[@]}")
        elif [[ $choice == "9" ]]; then
            local start=$(date +%s%N)
            data=($(quickSort data[@]))
            local end=$(date +%s%N)
            local duration=$(( (end - start) / 1000000 ))
            echo "Total time: $duration ms"
        fi
    done
}

main