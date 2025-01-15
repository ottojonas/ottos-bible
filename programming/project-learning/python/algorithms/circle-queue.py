class CircularQueue:
    def __init__(self, maxSize):
        self.queue = [None] * maxSize
        self.maxSize = maxSize
        self.head = -1
        self.tail = -1

    def enqueue(self, data):
        if (self.tail + 1) % self.maxSize == self.head:
            print("Circular Queue is full\n")
        elif self.head == -1:
            self.head = 0
            self.tail = 0
            self.queue[self.tail] = data
        else:
            self.tail = (self.tail + 1) % self.maxSize
            self.queue[self.tail] = data

    def dequeue(self):
        if self.head == -1:
            print("Circular Queue is empty\n")
        elif self.head == self.tail:
            temp = self.queue[self.head]
            self.head = -1
            self.tail = -1
            return temp
        else:
            temp = self.queue[self.head]
            self.head = (self.head + 1) % self.maxSize
            return temp

    def isEmpty(self):
        return self.head == -1

    def isFull(self):
        return (self.tail + 1) % self.maxSize == self.front

    def size(self):
        if self.tail >= self.head:
            return self.tail - self.head + 1
        else:
            return self.maxSize - (self.head - self.tail - 1)


myQueue = CircularQueue(3)
myQueue.enqueue("A")
myQueue.enqueue("B")
myQueue.enqueue("C")
myQueue.enqueue("D")
print(myQueue.dequeue())
print(myQueue.dequeue())
print(myQueue.dequeue())
print(myQueue.dequeue())
