data = ["A", "+", "B", "*", "C", "/", "D", "-", "E"] # Array representing the data stored in the nodes of the tree

left = [nil, 0, nil, 2, nil, 1, nil, 6, nil] # Array representing the left child indices for each node
right = [nil, 3, nil, 4, nil, 7, nil, 8, nil] # Array representing the right child indices for each node

root = 5 # Index of the root node

def P(T, data, left, right)
  P(left[T], data, left, right) unless left[T].nil? # Recursively traverse the left subtree
  P(right[T], data, left, right) unless right[T].nil? # Recursively traverse the right subtree
  puts data[T] # Print the data of the current node
end

P(root, data, left, right) # Start the traversal from the root node