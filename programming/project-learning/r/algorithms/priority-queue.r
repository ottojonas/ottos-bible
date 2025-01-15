# Define a reference class named PriorityQueue
PriorityQueue <- setRefClass(
  "PriorityQueue",
  fields = list(
    heap = "list",          # List to store the heap elements
    compare = "function"    # Function to compare the priority of elements
  ),
  methods = list(
    # Initialize the priority queue with a comparison function
    initialize = function(compare) {
      if (!is.function(compare)) {  # Check if the provided compare is a function
        stop("Compare has to be a function")  # Stop execution if compare is not a function
      }
      heap <<- list()  # Initialize the heap as an empty list
      compare <<- compare  # Set the comparison function
    },
    # Get the index of the parent element
    getParentIndex = function(index) {
      return((index - 1) %/% 2)  # Calculate and return the parent index
    },
    # Get the index of the left child element
    getLeftChildIndex = function(index) {
      return(2 * index + 1)  # Calculate and return the left child index
    },
    # Get the index of the right child element
    getRightChildIndex = function(index) {
      return(2 * index + 2)  # Calculate and return the right child index
    },
    # Swap the elements at the given indices
    swap = function(index1, index2) {
      temp <- heap[[index1]]  # Temporarily store the element at index1
      heap[[index1]] <<- heap[[index2]]  # Assign the element at index2 to index1
      heap[[index2]] <<- temp  # Assign the temporarily stored element to index2
    }
  )
)