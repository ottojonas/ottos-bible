<?php
// Array representing the data stored in the binary search tree nodes
$data = ["A", "+", "B", "*", "C", "/", "D", "-", "E"];

// Arrays representing the left and right children of each node
$left = [null, 0, null, 2, null, 1, null, 6, null];
$right = [null, 3, null, 4, null, 7, null, 8, null];

// Index of the root node in the $data array
$root = 5;

// Function to perform a post-order traversal of the binary search tree
function P($T, $data, $left, $right) {
    // Recursively traverse the left subtree if it exists
    if ($left[$T] !== null) {
        P($left[$T], $data, $left, $right);
    }
    // Recursively traverse the right subtree if it exists
    if ($right[$T] !== null) {
        P($right[$T], $data, $left, $right);
    }
    // Print the data of the current node
    echo $data[$T] . "\n";
}

// Start the post-order traversal from the root node
P($root, $data, $left, $right);
?>