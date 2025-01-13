# Data for the binary search tree nodes
data = ["A", "+", "B", "*", "C", "/", "D", "-", "E"]

# Left child indices for each node
left = [None, 0, None, 2, None, 1, None, 6, None]

# Right child indices for each node
right = [None, 3, None, 4, None, 7, None, 8, None]

# Root node index
root = 5

# Function to perform a post-order traversal of the binary search tree
def P(T):
    # If the left child exists, traverse the left subtree
    if left[T] is not None:
        P(left[T])
    # If the right child exists, traverse the right subtree
    if right[T] is not None:
        P(right[T])
    # Print the data of the current node
    print(data[T])

# Start the traversal from the root node
P(root)