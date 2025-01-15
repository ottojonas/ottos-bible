# Define a reference class named CircularQueue
CircularQueue <- setRefClass(
    "CircularQueue",
    fields = list(
        queue = "list",       # List to store queue elements
        maxSize = "numeric",  # Maximum size of the queue
        head = "numeric",     # Index of the front element
        tail = "numeric"      # Index of the rear element
    ),
    methods = list(
        # Initialize the queue with a given maximum size
        initialize = function(maxSize) {
            queue <<- vector("list", maxSize)  # Create a list with the specified size
            maxSize <<- maxSize                # Set the maximum size of the queue
            head <<- -1                        # Initialize head to -1 indicating the queue is empty
            tail <<- -1                        # Initialize tail to -1 indicating the queue is empty
        },
        # Method to add an element to the queue
        enqueue = function(data) {
            if ((tail + 1) %% maxSize == head) {  # Check if the queue is full
                cat("Circular Queue is full\n")
            } else if (head == -1) {              # Check if the queue is empty
                head <<- 0                        # Set head to 0
                tail <<- 0                        # Set tail to 0
                queue[[tail + 1]] <<- data        # Add the data to the queue
            } else {
                tail <<- (tail + 1) %% maxSize    # Move tail to the next position
                queue[[tail + 1]] <<- data        # Add the data to the queue
            }
        },
        # Method to remove an element from the queue
        dequeue = function() {
            if (head == -1) {                     # Check if the queue is empty
                cat("Circular Queue is empty\n")
                return(NULL)
            } else if (head == tail) {            # Check if there is only one element in the queue
                temp <- queue[[head + 1]]         # Store the data to return
                head <<- -1                       # Reset head to -1 indicating the queue is empty
                tail <<- -1                       # Reset tail to -1 indicating the queue is empty
                return(temp)                      # Return the data
            } else {
                temp <- queue[[head + 1]]         # Store the data to return
                head <<- (head + 1) %% maxSize    # Move head to the next position
                return(temp)                      # Return the data
            }
        }
    )
)