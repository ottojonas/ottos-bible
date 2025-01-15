// Define a class for Circular Queue
class CircularQueue {
    // Constructor to initialize the queue with a given maximum size
    constructor(maxSize) {
        // Initialize the queue array with null values
        this.queue = new Array(maxSize).fill(null);
        // Set the maximum size of the queue
        this.maxSize = maxSize;
        // Initialize head and tail pointers to -1 indicating the queue is empty
        this.head = -1;
        this.tail = -1;
    }

    // Method to add an element to the queue
    enqueue(data) {
        // Check if the queue is full
        if ((this.tail + 1) % this.maxSize === this.head) {
            console.log("Circular Queue is full");
        // Check if the queue is empty
        } else if (this.head === -1) {
            // Set head and tail to 0 and add the data to the queue
            this.head = 0;
            this.tail = 0;
            this.queue[this.tail] = data;
        } else {
            // Move the tail pointer to the next position and add the data to the queue
            this.tail = (this.tail + 1) % this.maxSize;
            this.queue[this.tail] = data;
        }
    }

    // Method to remove an element from the queue
    dequeue() {
        // Check if the queue is empty
        if (this.head === -1) {
            console.log("Circular Queue is empty");
            return null;
        // Check if there is only one element in the queue
        } else if (this.head === this.tail) {
            // Store the data to return, then reset head and tail to -1
            const temp = this.queue[this.head];
            this.head = -1;
            this.tail = -1;
            return temp;
        } else {
            // Store the data to return, then move the head pointer to the next position
            const temp = this.queue[this.head];
            this.head = (this.head + 1) % this.maxSize;
            return temp;
        }
    }
}