data <- c("A", "+", "B", "*", "C", "/", "D", "-", "E")  # Vector containing the data for the nodes

left <- c(NA, 0, NA, 2, NA, 1, NA, 6, NA)  # Vector containing the indices of the left children
right <- c(NA, 3, NA, 4, NA, 7, NA, 8, NA)  # Vector containing the indices of the right children

root <- 5  # Index of the root node

# Function to perform a post-order traversal of the binary search tree
P <- function(T) {
    if (!is.na(left[T])) {  # If there is a left child
        P(left[T])  # Recursively traverse the left subtree
    }
    if (!is.na(right[T])) {  # If there is a right child
        P(right[T])  # Recursively traverse the right subtree
    }
    cat(data[T], "\n")  # Print the data of the current node
}

P(root)  # Start the post-order traversal from the root