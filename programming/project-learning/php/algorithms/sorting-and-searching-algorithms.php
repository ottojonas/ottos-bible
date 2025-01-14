<?php
function linearSearch($data, $searchKey) {
    foreach ($data as $item) {
        if ($item == $searchKey) {
            return true;
        }
    }
    return false;
}

function binarySearch($data, $searchKey) {
    $head = 0;
    $tail = count($data) - 1;
    while ($head <= $tail) {
        $midPoint = intdiv($head + $tail, 2);
        if ($data[$midPoint] == $searchKey) {
            return true;
        } elseif ($data[$midPoint] > $searchKey) {
            $tail = $midPoint - 1;
        } else {
            $head = $midPoint + 1;
        }
    }
    return false;
}

function bubbleSort($data) {
    $nlen = count($data) - 1;
    while (true) {
        $swap = false;
        for ($i = 0; $i < $nlen; $i++) {
            if ($data[$i] > $data[$i + 1]) {
                list($data[$i], $data[$i + 1]) = [$data[$i + 1], $data[$i]];
                $swap = true;
            }
        }
        if (!$swap) break;
        $nlen--;
    }
    return $data;
}

function insertionSort($data) {
    for ($i = 1; $i < count($data); $i++) {
        $key = $data[$i];
        $j = $i - 1;
        while ($j >= 0 && $data[$j] > $key) {
            $data[$j + 1] = $data[$j];
            $j--;
        }
        $data[$j + 1] = $key;
    }
    return $data;
}

function mergeSort($data) {
    if (count($data) <= 1) return $data;
    $mid = intdiv(count($data), 2);
    $left = mergeSort(array_slice($data, 0, $mid));
    $right = mergeSort(array_slice($data, $mid));
    return merge($left, $right);
}

function merge($left, $right) {
    $result = [];
    while (count($left) > 0 && count($right) > 0) {
        if ($left[0] <= $right[0]) {
            $result[] = array_shift($left);
        } else {
            $result[] = array_shift($right);
        }
    }
    return array_merge($result, $left, $right);
}

function quickSort($data) {
    if (count($data) <= 1) return $data;
    $pivot = $data[0];
    $less = array_filter(array_slice($data, 1), fn($x) => $x <= $pivot);
    $greater = array_filter(array_slice($data, 1), fn($x) => $x > $pivot);
    return array_merge(quickSort($less), [$pivot], quickSort($greater));
}

function getSearchKey() {
    echo "Enter search key: ";
    return intval(trim(fgets(STDIN)));
}

function createData() {
    echo "Enter size of data set: ";
    $numItems = intval(trim(fgets(STDIN)));
    $data = [];
    for ($i = 0; $i < $numItems; $i++) {
        $data[] = rand(1, $numItems * 2);
    }
    return $data;
}

function viewData($data) {
    echo implode(' ', $data) . "\n";
}

function main() {
    $data = createData();
    $tempData = $data;
    $choice = "";
    while ($choice != "8") {
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

main();
?>