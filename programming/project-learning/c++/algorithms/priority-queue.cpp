#include <vector>
#include <functional>
#include <stdexcept>

class PriorityQueue {
public:
    PriorityQueue(std::function<bool(int, int)> compare) : compare(compare) {
        if (!compare) {
            throw std::invalid_argument("Compare has to be a function");
        }
    }

    int getParentIndex(int index) {
        return (index - 1) / 2;
    }

    int getLeftChildIndex(int index) {
        return 2 * index + 1;
    }

    int getRightChildIndex(int index) {
        return 2 * index + 2;
    }

    void swap(int index1, int index2) {
        std::swap(heap[index1], heap[index2]);
    }

private:
    std::vector<int> heap;
    std::function<bool(int, int)> compare;
};