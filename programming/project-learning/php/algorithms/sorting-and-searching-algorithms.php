<?php
// Function to perform linear search
function linearSearch($data, $searchKey) {
    // Iterate through each item in the data
    foreach ($data as $item) {
        // Return true if the search key is found
        if ($item == $searchKey) {
            return true;
        }
    }
    // Return false if the search key is not found
    return false;
}

// Function to perform binary search
function binarySearch($data, $searchKey) {
    $head = 0;
    $tail = count($data) - 1;
    // Continue searching while the head is less than or equal to the tail
    while ($head <= $tail) {
        $midPoint = intdiv($head + $tail, 2);
        // Return true if the search key is found at the midpoint
        if ($data[$midPoint] == $searchKey) {
            return true;
        } elseif ($data[$midPoint] > $searchKey) {
            // Search in the left half
            $tail = $midPoint - 1;
        } else {
            // Search in the right half
            $head = $midPoint + 1;
        }
    }
    // Return false if the search key is not found
    return false;
}

// Function to perform bubble sort
function bubbleSort($data) {
    $nlen = count($data) - 1;
    while (true) {
        $swap = false;
        // Iterate through the data and swap adjacent elements if they are in the wrong order
        for ($i = 0; $i < $nlen; $i++) {
            if ($data[$i] > $data[$i + 1]) {
                list($data[$i], $data[$i + 1]) = [$data[$i + 1], $data[$i]];
                $swap = true;
            }
        }
        // Exit the loop if no swaps were made
        if (!$swap) break;
        $nlen--;
    }
    // Return the sorted data
    return $data;
}

// Function to perform insertion sort
function insertionSort($data) {
    // Iterate through the data starting from the second element
    for ($i = 1; $i < count($data); $i++) {
        $key = $data[$i];
        $j = $i - 1;
        // Shift elements to the right to make space for the key
        while ($j >= 0 && $data[$j] > $key) {
            $data[$j + 1] = $data[$j];
            $j--;
        }
        // Insert the key at the correct position
        $data[$j + 1] = $key;
    }
    // Return the sorted data
    return $data;
}

// Function to perform merge sort
function mergeSort($data) {
    // Base case: return the data if it has one or zero elements
    if (count($data) <= 1) return $data;
    $mid = intdiv(count($data), 2);
    // Recursively sort the left and right halves
    $left = mergeSort(array_slice($data, 0, $mid));
    $right = mergeSort(array_slice($data, $mid));
    // Merge the sorted halves
    return merge($left, $right);
}

// Function to merge two sorted arrays
function merge($left, $right) {
    $result = [];
    // Merge elements from left and right arrays in sorted order
    while (count($left) > 0 && count($right) > 0) {
        if ($left[0] <= $right[0]) {
            $result[] = array_shift($left);
        } else {
            $result[] = array_shift($right);
        }
    }
    // Append any remaining elements from left and right arrays
    return array_merge($result, $left, $right);
}

// Function to perform quick sort
function quickSort($data) {
    // Base case: return the data if it has one or zero elements
    if (count($data) <= 1) return $data;
    $pivot = $data[0];
    // Partition the data into elements less than or equal to the pivot and elements greater than the pivot
    $less = array_filter(array_slice($data, 1), fn($x) => $x <= $pivot);
    $greater = array_filter(array_slice($data, 1), fn($x) => $x > $pivot);
    // Recursively sort the partitions and concatenate the results
    return array_merge(quickSort($less), [$pivot], quickSort($greater));
}

// Function to get the search key from the user
function getSearchKey() {
    echo "Enter search key: ";
    return intval(trim(fgets(STDIN)));
}

// Function to create a random data set
function createData() {
    echo "Enter size of data set: ";
    $numItems = intval(trim(fgets(STDIN)));
    $data = [];
    // Generate random numbers and add them to the data set
    for ($i = 0; $i < $numItems; $i++) {
        $data[] = rand(1, $numItems * 2);
    }
    return $data;
}

// Function to display the data
function viewData($data) {
    echo implode(' ', $data) . "\n";
}

// Main function to run the program
function main() {
    $data = createData();
    $tempData = $data;
    $choice = "";
    while ($choice != "8") {
        // Display menu options
        echo "1. Linear search\n";
        echo "2. Binary search\n";
        echo "3. Bubble sort\n";
        echo "4. Insertion sort\n";
        echo "5. Merge sort\n";
        echo "6. View Data\n";
        echo "7. Restore original data\n";
        echo "8. Quit\n";
        echo "9. Quick Sort\n";
        echo "Make selection: ";
        $choice = trim(fgets(STDIN));
        // Perform the selected operation
        if ($choice == "1") {
            $searchKey = getSearchKey();
            echo linearSearch($data, $searchKey) ? "Found\n" : "Not Found\n";
        } elseif ($choice == "2") {
            $searchKey = getSearchKey();
            echo binarySearch($data, $searchKey) ? "Found\n" : "Not Found\n";
        } elseif ($choice == "3") {
            $start = microtime(true);
            $data = bubbleSort($data);
            $end = microtime(true);
            echo "Total time: " . round(($end - $start) * 1000, 1) . " ms\n";
        } elseif ($choice == "4") {
            $start = microtime(true);
            $data = insertionSort($data);
            $end = microtime(true);
            echo "Total time: " . round(($end - $start) * 1000, 1) . " ms\n";
        } elseif ($choice == "5") {
            $start = microtime(true);
            $data = mergeSort($data);
            $end = microtime(true);
            echo "Total time: " . round(($end - $start) * 1000, 1) . " ms\n";
        } elseif ($choice == "6") {
            viewData($data);
        } elseif ($choice == "7") {
            $data = $tempData;
        } elseif ($choice == "9") {
            $start = microtime(true);
            $data = quickSort($data);
            $end = microtime(true);
            echo "Total time: " . round(($end - $start) * 1000, 1) . " ms\n";
        }
    }
}

// Run the main function
main();
?>