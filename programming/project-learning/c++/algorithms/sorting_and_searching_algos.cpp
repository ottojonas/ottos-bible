#include <iostream>
#include <vector>
#include <algorithm>
#include <ctime>
#include <cstdlib>

// Linear search algorithm
bool linearSearch(const std::vector<int>& data, int searchKey) {
    for (int item : data) {
        if (item == searchKey) {
            return true;
        }
    }
    return false;
}

// Binary search algorithm
bool binarySearch(const std::vector<int>& data, int searchKey) {
    int head = 0;
    int tail = data.size() - 1;
    while (head <= tail) {
        int midPoint = head + (tail - head) / 2;
        if (data[midPoint] == searchKey) {
            return true;
        } else if (data[midPoint] > searchKey) {
            tail = midPoint - 1;
        } else {
            head = midPoint + 1;
        }
    }
    return false;
}

// Bubble sort algorithm
std::vector<int> bubbleSort(std::vector<int>& data) {
    int nlen = data.size() - 1;
    while (true) {
        bool swap = false;
        for (int i = 0; i < nlen; ++i) {
            if (data[i] > data[i + 1]) {
                std::swap(data[i], data[i + 1]);
                swap = true;
            }
        }
        if (!swap) {
            break;
        }
        nlen -= 1;
    }
    return data;
}

// Insertion sort algorithm
std::vector<int> insertionSort(std::vector<int>& data) {
    for (size_t i = 1; i < data.size(); ++i) {
        int key = data[i];
        int j = i - 1;
        while (j >= 0 && data[j] > key) {
            data[j + 1] = data[j];
            j -= 1;
        }
        data[j + 1] = key;
    }
    return data;
}

// Merge function for merge sort
std::vector<int> merge(const std::vector<int>& left, const std::vector<int>& right) {
    std::vector<int> merged;
    size_t leftIndex = 0, rightIndex = 0;
    while (leftIndex < left.size() && rightIndex < right.size()) {
        if (left[leftIndex] <= right[rightIndex]) {
            merged.push_back(left[leftIndex]);
            leftIndex += 1;
        } else {
            merged.push_back(right[rightIndex]);
            rightIndex += 1;
        }
    }
    merged.insert(merged.end(), left.begin() + leftIndex, left.end());
    merged.insert(merged.end(), right.begin() + rightIndex, right.end());
    return merged;
}

// Merge sort algorithm
std::vector<int> mergeSort(std::vector<int>& data) {
    if (data.size() <= 1) {
        return data;
    }
    size_t mid = data.size() / 2;
    std::vector<int> leftHalf(data.begin(), data.begin() + mid);
    std::vector<int> rightHalf(data.begin() + mid, data.end());
    return merge(mergeSort(leftHalf), mergeSort(rightHalf));
}

// Quick sort algorithm
std::vector<int> quickSort(std::vector<int>& data) {
    if (data.size() <= 1) {
        return data;
    }
    int pivot = data[0];
    std::vector<int> less, greater;
    for (size_t i = 1; i < data.size(); ++i) {
        if (data[i] <= pivot) {
            less.push_back(data[i]);
        } else {
            greater.push_back(data[i]);
        }
    }
    less = quickSort(less);
    greater = quickSort(greater);
    less.push_back(pivot);
    less.insert(less.end(), greater.begin(), greater.end());
    return less;
}

// Function to get the search key from the user
int getSearchKey() {
    int searchKey;
    std::cout << "Enter search key: ";
    std::cin >> searchKey;
    return searchKey;
}

// Function to create a random data set
std::vector<int> createData() {
    int numItems;
    std::cout << "Enter size of data set: ";
    std::cin >> numItems;
    std::vector<int> data(numItems);
    srand(time(0));
    for (int& item : data) {
        item = rand() % (numItems * 2) + 1;
    }
    return data;
}

// Function to view the data
void viewData(const std::vector<int>& data) {
    for (int item : data) {
        std::cout << item << " ";
    }
    std::cout << std::endl;
}

// Main function to run the program
int main() {
    std::vector<int> data = createData();
    std::vector<int> tempData = data;
    std::string choice;
    while (choice != "8") {
        std::cout << "1. Linear search\n";
        std::cout << "2. Binary search\n";
        std::cout << "3. Bubble sort\n";
        std::cout << "4. Insertion sort\n";
        std::cout << "5. Merge sort\n";
        std::cout << "6. View Data\n";
        std::cout << "7. Restore original data\n";
        std::cout << "8. Quit\n";
        std::cout << "9. Quick Sort\n";
        std::cout << "Make selection: ";
        std::cin >> choice;
        if (choice == "1") {
            int searchKey = getSearchKey();
            std::cout << (linearSearch(data, searchKey) ? "Found" : "Not Found") << std::endl;
        } else if (choice == "2") {
            int searchKey = getSearchKey();
            std::sort(data.begin(), data.end());
            std::cout << (binarySearch(data, searchKey) ? "Found" : "Not Found") << std::endl;
        } else if (choice == "3") {
            clock_t start = clock();
            data = bubbleSort(data);
            clock_t end = clock();
            std::cout << "Total time: " << (1000.0 * (end - start) / CLOCKS_PER_SEC) << " ms" << std::endl;
        } else if (choice == "4") {
            clock_t start = clock();
            data = insertionSort(data);
            clock_t end = clock();
            std::cout << "Total time: " << (1000.0 * (end - start) / CLOCKS_PER_SEC) << " ms" << std::endl;
        } else if (choice == "5") {
            clock_t start = clock();
            data = mergeSort(data);
            clock_t end = clock();
            std::cout << "Total time: " << (1000.0 * (end - start) / CLOCKS_PER_SEC) << " ms" << std::endl;
        } else if (choice == "6") {
            viewData(data);
        } else if (choice == "7") {
            data = tempData;
        } else if (choice == "9") {
            clock_t start = clock();
            data = quickSort(data);
            clock_t end = clock();
            std::cout << "Total time: " << (1000.0 * (end - start) / CLOCKS_PER_SEC) << " ms" << std::endl;
        }
    }
    return 0;
}