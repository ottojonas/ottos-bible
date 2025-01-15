#include <iostream>
#include <vector>

// CircularQueue class definition
class CircularQueue {
private:
    std::vector<int> queue; // Vector to store queue elements
    int maxSize; // Maximum size of the queue
    int head; // Index of the front element
    int tail; // Index of the rear element

public:
    // Constructor to initialize the queue with a given size
    CircularQueue(int size) : maxSize(size), head(-1), tail(-1) {
        queue.resize(size); // Resize the vector to the specified size
    }

    // Function to add an element to the queue
    void enqueue(int data) {
        // Check if the queue is full
        if ((tail + 1) % maxSize == head) {
            std::cout << "Circular Queue is full\n";
        } 
        // Check if the queue is empty
        else if (head == -1) {
            head = 0; // Set head to the first position
            tail = 0; // Set tail to the first position
            queue[tail] = data; // Add the data to the queue
        } 
        // Add the data to the queue when it is not full or empty
        else {
            tail = (tail + 1) % maxSize; // Move tail to the next position
            queue[tail] = data; // Add the data to the queue
        }
    }

    // Function to remove an element from the queue
    int dequeue() {
        // Check if the queue is empty
        if (head == -1) {
            std::cout << "Circular Queue is empty\n";
            return -1; // Return -1 to indicate the queue is empty
        } 
        // Check if there is only one element in the queue
        else if (head == tail) {
            int temp = queue[head]; // Store the data to return
            head = -1; // Reset head to indicate the queue is empty
            tail = -1; // Reset tail to indicate the queue is empty
            return temp; // Return the data
        } 
        // Remove the data from the queue when it is not empty
        else {
            int temp = queue[head]; // Store the data to return
            head = (head + 1) % maxSize; // Move head to the next position
            return temp; // Return the data
        }
    }
};