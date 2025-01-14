#include <cstdio>
#include <iostream>

// linked lists are like a linear list but they other than a value, also contain a pointer to the next node
// linked lists are made out of so called Node's which are the places where the data and pointer is stored
// other than a Node they also have a head which points to the first node of the linked list


// a structure of a node
struct Node {
    int data;
    Node* next;
};

int main() {
    // here we make a Linked list
    Node* head = new Node{1, nullptr}; // here we make the head of the list which has no pointer becuase its the first node
    head->next = new Node{2, nullptr}; // here we make the first node of the list which is pointed by the head
    head->next->next = new Node{3, nullptr};

    // Linked List
    // head -> Node{1} -> Node{2} -> Node[3] -> nullptr

    Node* temp = head;
    while (temp != nullptr) {
	std::cout << temp->data << " ";
        temp = temp->next;
    }

    return 0;
}