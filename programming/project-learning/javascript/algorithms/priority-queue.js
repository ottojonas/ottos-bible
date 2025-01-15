class PriorityQueue {
    constructor(compare) {
      // Initialize the data structure
      this.heap = []; // Initial empty array
      if (typeof compare !== "function") {
        throw new TypeError("Compare has to be a function");
      }
      this.compare = compare;
    }
  
    getParentIndex(index) {
      // Function to get parent of index
      return Math.floor((index - 1) / 2);
    }
  
    getLeftChildIndex(index) {
      // Function to get left child of index
      return 2 * index + 1;
    }
  
    getRightChildIndex(index) {
      // Function to get right child of index
      return 2 * index + 2;
    }
  
    swap(index1, index2) {
      // Function for swapping nodes
      [this.heap[index1], this.heap[index2]] = [this.heap[index2], this.heap[index1]];
    }
  
    enqueue(value) {
      // Function for adding nodes
      this.heap.push(value); // Add to the end of the heap
      this.bubbleUp(); // Then start going up till it's found its place
    }
  
    bubbleUp() {
      // Function to pull node upward
      let index = this.heap.length - 1;
      while (index > 0) {
        const parentIndex = this.getParentIndex(index);
        if (this.compare(this.heap[index], this.heap[parentIndex])) {
          this.swap(index, parentIndex);
          index = parentIndex;
        } else {
          break;
        }
      }
    }
  
    dequeue() {
      // Function for removing highest priority node
      if (this.heap.length === 0) {
        return null;
      }
      if (this.heap.length === 1) {
        return this.heap.pop();
      }
  
      const minValue = this.heap[0]; // Store a copy of the highest priority node
      this.heap[0] = this.heap.pop(); // Keep the last node in the first O(1)
      this.bubbleDown(0); // Then push it down till its found its place
      return minValue; // Return the copy
    }
  
    bubbleDown(index) {
      // Function to push node downward
      const leftChildIndex = this.getLeftChildIndex(index);
      const rightChildIndex = this.getRightChildIndex(index);
      let smallest = index;
  
      if (leftChildIndex < this.heap.length && this.compare(this.heap[leftChildIndex], this.heap[smallest])) {
        smallest = leftChildIndex;
      }
  
      if (rightChildIndex < this.heap.length && this.compare(this.heap[rightChildIndex], this.heap[smallest])) {
        smallest = rightChildIndex;
      }
  
      if (smallest !== index) {
        this.swap(index, smallest);
        this.bubbleDown(smallest);
      }
    }
  
    peek() {
      // Convenient function to check the smallest element
      return this.heap.length > 0 ? this.heap[0] : null;
    }
  
    isEmpty() {
      // Convenient function to check if queue is empty
      return this.heap.length === 0;
    }
  }
  
  // Example Usage
  if (require.main === module){
    const pq = new PriorityQueue((a, b) => a < b); // Min-Heap
    
    pq.enqueue(5);
    pq.enqueue(3);
    pq.enqueue(8);
    
    console.log(pq.peek()); // Output: 3
    console.log(pq.dequeue()); // Output: 3
    console.log(pq.peek()); // Output: 5
  }
  