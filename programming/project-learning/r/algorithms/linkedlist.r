Node <- function(data) {
    list(data = data, next = NULL)
}

# Create a linked list
head <- Node(1) # Create the head of the list
head$next <- Node(2) # Create the first node of the list pointed by the head
head$next$next <- Node(3) # Create the second node of the list

# Linked List
# head -> Node(1) -> Node(2) -> Node(3) -> NULL

temp <- head
while (!is.null(temp)) {
    cat(temp$data, " ")
    temp <- temp$next
}