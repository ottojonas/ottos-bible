#include <iostream>
#include <vector>

class CircularQueue {
private:
    std::vector<int> queue;
    int maxSize;
    int head;
    int tail;

public:
    CircularQueue(int size) : maxSize(size), head(-1), tail(-1) {
        queue.resize(size);
    }

    void enqueue(int data) {
        if ((tail + 1) % maxSize == head) {
            std::cout << "Circular Queue is full\n";
        } else if (head == -1) {
            head = 0;
            tail = 0;
            queue[tail] = data;
        } else {
            tail = (tail + 1) % maxSize;
            queue[tail] = data;
        }
    }

    int dequeue() {
        if (head == -1) {
            std::cout << "Circular Queue is empty\n";
            return -1;
        } else if (head == tail) {
            int temp = queue[head];
            head = -1;
            tail = -1;
            return temp;
        } else {
            int temp = queue[head];
            head = (head + 1) % maxSize;
            return temp;
        }
    }
};