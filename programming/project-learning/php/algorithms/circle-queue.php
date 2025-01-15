<?php
class CircularQueue {
    private $queue;    // Array to store queue elements
    private $maxSize;  // Maximum size of the queue
    private $head;     // Index of the front element
    private $tail;     // Index of the rear element

    // Constructor to initialize the queue with a given size
    public function __construct($maxSize) {
        $this->queue = array_fill(0, $maxSize, null); // Initialize the queue array with null values
        $this->maxSize = $maxSize;                   // Set the maximum size of the queue
        $this->head = -1;                            // Initialize head to -1 indicating the queue is empty
        $this->tail = -1;                            // Initialize tail to -1 indicating the queue is empty
    }

    // Method to add an element to the queue
    public function enqueue($data) {
        // Check if the queue is full
        if (($this->tail + 1) % $this->maxSize == $this->head) {
            echo "Circular Queue is full\n";
        // Check if the queue is empty
        } elseif ($this->head == -1) {
            $this->head = 0;                         // Set head to 0
            $this->tail = 0;                         // Set tail to 0
            $this->queue[$this->tail] = $data;       // Add the data to the queue
        } else {
            $this->tail = ($this->tail + 1) % $this->maxSize; // Move tail to the next position
            $this->queue[$this->tail] = $data;       // Add the data to the queue
        }
    }

    // Method to remove an element from the queue
    public function dequeue() {
        // Check if the queue is empty
        if ($this->head == -1) {
            echo "Circular Queue is empty\n";
            return null;
        // Check if there is only one element in the queue
        } elseif ($this->head == $this->tail) {
            $temp = $this->queue[$this->head];       // Store the data to return
            $this->head = -1;                        // Reset head to -1 indicating the queue is empty
            $this->tail = -1;                        // Reset tail to -1 indicating the queue is empty
            return $temp;                            // Return the data
        } else {
            $temp = $this->queue[$this->head];       // Store the data to return
            $this->head = ($this->head + 1) % $this->maxSize; // Move head to the next position
            return $temp;                            // Return the data
        }
    }
}
?>