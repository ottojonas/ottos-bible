<?php
class CircularQueue {
    private $queue;
    private $maxSize;
    private $head;
    private $tail;

    public function __construct($maxSize) {
        $this->queue = array_fill(0, $maxSize, null);
        $this->maxSize = $maxSize;
        $this->head = -1;
        $this->tail = -1;
    }

    public function enqueue($data) {
        if (($this->tail + 1) % $this->maxSize == $this->head) {
            echo "Circular Queue is full\n";
        } elseif ($this->head == -1) {
            $this->head = 0;
            $this->tail = 0;
            $this->queue[$this->tail] = $data;
        } else {
            $this->tail = ($this->tail + 1) % $this->maxSize;
            $this->queue[$this->tail] = $data;
        }
    }

    public function dequeue() {
        if ($this->head == -1) {
            echo "Circular Queue is empty\n";
            return null;
        } elseif ($this->head == $this->tail) {
            $temp = $this->queue[$this->head];
            $this->head = -1;
            $this->tail = -1;
            return $temp;
        } else {
            $temp = $this->queue[$this->head];
            $this->head = ($this->head + 1) % $this->maxSize;
            return $temp;
        }
    }
}
?>