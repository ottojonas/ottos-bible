class Node {
    constructor(data) {
        this.data = data;
        this.next = null;
    }
}

// Create a linked list
const head = new Node(1); // Create the head of the list
head.next = new Node(2); // Create the first node of the list pointed by the head
head.next.next = new Node(3); // Create the second node of the list

// Linked List
// head -> Node(1) -> Node(2) -> Node(3) -> null

let temp = head;
while (temp !== null) {
    console.log(temp.data);
    temp = temp.next;
}