// Define an array of data representing nodes in the binary search tree
const data = ["A", "+", "B", "*", "C", "/", "D", "-", "E"];

// Define arrays representing the left and right children of each node
const left = [null, 0, null, 2, null, 1, null, 6, null];
const right = [null, 3, null, 4, null, 7, null, 8, null];

// Define the root node index
const root = 5;

// Define a function P to perform a post-order traversal of the binary search tree
function P(T) {
    // Recursively traverse the left subtree if it exists
    if (left[T] !== null) {
        P(left[T]);
    }
    // Recursively traverse the right subtree if it exists
    if (right[T] !== null) {
        P(right[T]);
    }
    // Print the data of the current node
    console.log(data[T]);
}

// Start the post-order traversal from the root node
P(root);