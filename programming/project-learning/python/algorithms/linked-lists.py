class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

# Create a linked list
head = Node(1)  # Create the head of the list
head.next = Node(2)  # Create the first node of the list pointed by the head
head.next.next = Node(3)  # Create the second node of the list

# Linked List
# head -> Node(1) -> Node(2) -> Node(3) -> None

temp = head
while temp is not None:
    print(temp.data, end=" ")
    temp = temp.next