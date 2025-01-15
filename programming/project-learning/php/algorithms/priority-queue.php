<?php
class PriorityQueue {
    private $heap;
    private $compare;

    public function __construct(callable $compare) {
        $this->heap = [];
        if (!is_callable($compare)) {
            throw new InvalidArgumentException("Compare has to be a function");
        }
        $this->compare = $compare;
    }

    public function getParentIndex($index) {
        return intdiv($index - 1, 2);
    }

    public function getLeftChildIndex($index) {
        return 2 * $index + 1;
    }

    public function getRightChildIndex($index) {
        return 2 * $index + 2;
    }

    public function swap($index1, $index2) {
        list($this->heap[$index1], $this->heap[$index2]) = [$this->heap[$index2], $this->heap[$index1]];
    }
}
?>