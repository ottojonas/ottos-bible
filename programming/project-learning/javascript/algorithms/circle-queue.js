class CircularQueue {
    constructor(maxSize) {
        this.queue = new Array(maxSize).fill(null);
        this.maxSize = maxSize;
        this.head = -1;
        this.tail = -1;
    }

    enqueue(data) {
        if ((this.tail + 1) % this.maxSize === this.head) {
            console.log("Circular Queue is full");
        } else if (this.head === -1) {
            this.head = 0;
            this.tail = 0;
            this.queue[this.tail] = data;
        } else {
            this.tail = (this.tail + 1) % this.maxSize;
            this.queue[this.tail] = data;
        }
    }

    dequeue() {
        if (this.head === -1) {
            console.log("Circular Queue is empty");
            return null;
        } else if (this.head === this.tail) {
            const temp = this.queue[this.head];
            this.head = -1;
            this.tail = -1;
            return temp;
        } else {
            const temp = this.queue[this.head];
            this.head = (this.head + 1) % this.maxSize;
            return temp;
        }
    }
}