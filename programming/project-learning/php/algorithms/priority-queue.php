<?php
class PriorityQueue {
    private $heap;    // Array to store heap elements
    private $compare; // Comparison function to determine priority

    // Constructor to initialize the priority queue with a comparison function
    public function __construct(callable $compare) {
        $this->heap = []; // Initialize an empty heap array
        if (!is_callable($compare)) {
            throw new InvalidArgumentException("Compare has to be a function"); // Ensure the comparison function is callable
        }
        $this->compare = $compare; // Set the comparison function
    }

    // Method to get the index of the parent node
    public function getParentIndex($index) {
        return intdiv($index - 1, 2); // Calculate the parent index using integer division
    }

    // Method to get the index of the left child node
    public function getLeftChildIndex($index) {
        return 2 * $index + 1; // Calculate the left child index
    }

    // Method to get the index of the right child node
    public function getRightChildIndex($index) {
        return 2 * $index + 2; // Calculate the right child index
    }

    // Method to swap two elements in the heap
    public function swap($index1, $index2) {
        list($this->heap[$index1], $this->heap[$index2]) = [$this->heap[$index2], $this->heap[$index1]]; // Swap the elements
    }
}
?>