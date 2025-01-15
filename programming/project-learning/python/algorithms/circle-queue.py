class CircularQueue:
    def __init__(self, maxSize):
        # Initialize the circular queue with a fixed size
        self.queue = [None] * maxSize
        self.maxSize = maxSize
        self.head = -1  # Points to the front of the queue
        self.tail = -1  # Points to the end of the queue

    def enqueue(self, data):
        # Add an element to the queue
        if (self.tail + 1) % self.maxSize == self.head:
            # Check if the queue is full
            print("Circular Queue is full\n")
        elif self.head == -1:
            # If the queue is empty, initialize head and tail
            self.head = 0
            self.tail = 0
            self.queue[self.tail] = data
        else:
            # Add the element to the end of the queue
            self.tail = (self.tail + 1) % self.maxSize
            self.queue[self.tail] = data

    def dequeue(self):
        # Remove an element from the queue
        if self.head == -1:
            # Check if the queue is empty
            print("Circular Queue is empty\n")
        elif self.head == self.tail:
            # If there is only one element, reset the queue
            temp = self.queue[self.head]
            self.head = -1
            self.tail = -1
            return temp
        else:
            # Remove the element from the front of the queue
            temp = self.queue[self.head]
            self.head = (self.head + 1) % self.maxSize
            return temp

    def isEmpty(self):
        # Check if the queue is empty
        return self.head == -1

    def isFull(self):
        # Check if the queue is full
        return (self.tail + 1) % self.maxSize == self.front

    def size(self):
        # Get the current size of the queue
        if self.tail >= self.head:
            return self.tail - self.head + 1
        else:
            return self.maxSize - (self.head - self.tail - 1)


# Example usage of the CircularQueue
myQueue = CircularQueue(3)
myQueue.enqueue("A")
myQueue.enqueue("B")
myQueue.enqueue("C")
myQueue.enqueue("D")  # This will print "Circular Queue is full"
print(myQueue.dequeue())  # Outputs: A
print(myQueue.dequeue())  # Outputs: B
print(myQueue.dequeue())  # Outputs: C
print(myQueue.dequeue())  # This will print "Circular Queue is empty"