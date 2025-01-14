<?php
class Node {
    public $data;
    public $next;

    public function __construct($data) {
        $this->data = $data;
        $this->next = null;
    }
}

// Create a linked list
$head = new Node(1); // Create the head of the list
$head->next = new Node(2); // Create the first node of the list pointed by the head
$head->next->next = new Node(3); // Create the second node of the list

// Linked List
// head -> Node(1) -> Node(2) -> Node(3) -> null

$temp = $head;
while ($temp !== null) {
    echo $temp->data . " ";
    $temp = $temp->next;
}
?>