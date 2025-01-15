#include <vector>
#include <functional>
#include <stdexcept>

// PriorityQueue class definition
class PriorityQueue {
public:
    // Constructor to initialize the priority queue with a comparison function
    PriorityQueue(std::function<bool(int, int)> compare) : compare(compare) {
        // Check if the comparison function is valid
        if (!compare) {
            throw std::invalid_argument("Compare has to be a function");
        }
    }

    // Function to get the index of the parent of a given node
    int getParentIndex(int index) {
        return (index - 1) / 2;
    }

    // Function to get the index of the left child of a given node
    int getLeftChildIndex(int index) {
        return 2 * index + 1;
    }

    // Function to get the index of the right child of a given node
    int getRightChildIndex(int index) {
        return 2 * index + 2;
    }

    // Function to swap two elements in the heap
    void swap(int index1, int index2) {
        std::swap(heap[index1], heap[index2]);
    }

private:
    std::vector<int> heap; // Vector to store heap elements
    std::function<bool(int, int)> compare; // Comparison function to maintain heap order
};