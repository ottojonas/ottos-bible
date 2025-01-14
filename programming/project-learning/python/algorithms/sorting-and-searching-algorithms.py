import random
from timeit import default_timer as timer

# Linear search algorithm
def linearSearch(data, searchKey):
    found = False
    length = len(data)
    count = 0
    # Iterate through the list to find the searchKey
    while count < length and not found:
        if data[count] == searchKey:
            return True
        else:
            count += 1
    pass

# Binary search algorithm
def binarySearch(data, searchKey):
    found = False
    head = 0
    tail = len(data) - 1
    # Perform binary search to find the searchKey
    while not found and head < tail:
        midPoint = (head + tail) // 2
        if data[midPoint] == searchKey:
            return True
        elif data[midPoint] > searchKey:
            tail = midPoint - 1
        else:
            head = midPoint - 1
        return found
    pass

# Bubble sort algorithm
def bubbleSort(data):
    nlen = len(data) - 1
    while True:
        swap = False
        # Iterate through the list and swap adjacent elements if they are in the wrong order
        for i in range(nlen):
            if data[i] > data[i + 1]:
                data[i], data[i + 1] = data[i + 1], data[i]
                swap = True
        if not swap:
            break
        nlen -= 1
    return data

# Insertion sort algorithm
def insertionSort(data):
    for i in range(len(data)):
        key = data[i]
        j = i - 1
        # Insert the current element into its correct position in the sorted part of the list
        while j >= 0 and key < data[j]:
            data[j + 1] = data[j]
            j = j - 1
            data[j + 1] = key
    return data

# Merge sort algorithm
def mergeSort(data):
    if len(data) <= 1:
        return data
    mid = len(data) // 2
    leftHalf = mergeSort(data[:mid])
    rightHalf = mergeSort(data[mid:])
    return merge(leftHalf, rightHalf)

# Merge function for merge sort
def merge(left, right):
    merged = []
    leftIndex = 0
    rightIndex = 0
    # Merge two sorted lists into one sorted list
    while leftIndex < len(left) and rightIndex < len(right):
        if left[leftIndex] <= right[rightIndex]:
            merged.append(left[leftIndex])
            leftIndex += 1
        else:
            merged.append(right[rightIndex])
            rightIndex += 1
    merged += left[leftIndex:]
    merged += right[rightIndex:]
    return merged

# Quick sort algorithm
def quickSort(data):
    if len(data) <= 1:
        return data
    else:
        pivot = data[0]
        less = [x for x in data[1:] if x <= pivot]
        greater = [x for x in data[1:] if x > pivot]
        return quickSort(less) + [pivot] + quickSort(greater)

# Function to get the search key from the user
def getSearchKey():
    return int(input("Enter search key: "))

# Function to create a random data set
def createData():
    numItems = int(input("Enter size of data set: "))
    data = random.sample(range(1, numItems * 2), numItems)
    return data

# Function to view the data
def viewData(data):
    for i in range(len(data)):
        print(data[i])

# Main function to run the program
def main():
    data = createData()
    tempData = data.copy()
    choice = ""
    while choice != "8":
        print("1. Linear search")
        print("2. Binary search")
        print("3. Bubble sort")
        print("4. Insertion sort")
        print("5. Merge sort")
        print("6. View Data")
        print("7. Restore original data")
        print("8. Quit")
        print("9. Quick Sort")
        choice = input("Make selection: ")
        if choice == "1":
            searchKey = getSearchKey()
            print(linearSearch(data, searchKey))

        elif choice == "2":
            searchKey = getSearchKey()
            print(binarySearch(data, searchKey))

        elif choice == "3":
            start = timer()
            data = bubbleSort(data)
            end = timer()
            print("Total time: %.1f ms" % (1000 * (end - start)))

        elif choice == "4":
            start = timer()
            data = insertionSort(data)
            end = timer()
            print("Total time: %.1f ms" % (1000 * (end - start)))

        elif choice == "5":
            start = timer()
            data = mergeSort(data)
            end = timer()
            print("Total timer: %.1f ms" % (1000 * (end - start)))

        elif choice == "6":
            viewData(data)

        elif choice == "7":
            data = tempData

        elif choice == "9":
            start = timer()
            data = quickSort(data)
            end = timer()
            print("Total time: %.1f ms" % (1000 * (end - start)))

# Run the main function
main()