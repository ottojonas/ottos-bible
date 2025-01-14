#include <iostream>
#include <array>
#include <algorithm>

// The way binary search works is that it starts with two pointers.
// It uses the two pointers left and right (they represent the left and right half) to make a pointer representing the middle
// and because the array is sorted meaning they are correctly laid out (ex. 1, 2, 3, 4...)
// it compares them with the mid if the target is lower it goes to the left half 
// and if it is higher than the mid it goes to the right half, it does this until the mid lands on the target 

int main() {
    std::array<int, 10> arr = {3, 4, 2, 9, 1, 0, 8, 5, 7, 6};

    // sorting a array
    // a array that is being used in binary search must be sorted
    std::sort(arr.begin(), arr.end());

    int target = 3;

    int left = 0; 
    int right = arr.size() - 1;
    while (left <= right) {
	int mid = left + (right - left) / 2;

	if (arr[mid] == target) {
	   std::cout << "Target found at: " <<  mid; // output expected: 2
	   return 0;
	}
	
	if (arr[mid] < target) {
	   left = mid + 1;
	}
	else {
	   right = mid - 1;
        }
    }

    std::cout << "-1";
    return 0;
}
