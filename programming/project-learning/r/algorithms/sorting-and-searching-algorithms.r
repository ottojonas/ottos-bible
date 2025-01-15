# Linear search algorithm
linearSearch <- function(data, searchKey) {
  for (item in data) {  # Iterate through each item in the data
    if (item == searchKey) {  # Check if the current item matches the search key
      return(TRUE)  # Return TRUE if a match is found
    }
  }
  return(FALSE)  # Return FALSE if no match is found
}

# Binary search algorithm
binarySearch <- function(data, searchKey) {
  head <- 1  # Initialize the head index
  tail <- length(data)  # Initialize the tail index
  while (head <= tail) {  # Continue searching while head is less than or equal to tail
    midPoint <- floor((head + tail) / 2)  # Calculate the midpoint index
    if (data[midPoint] == searchKey) {  # Check if the midpoint element matches the search key
      return(TRUE)  # Return TRUE if a match is found
    } else if (data[midPoint] > searchKey) {  # If the midpoint element is greater than the search key
      tail <- midPoint - 1  # Move the tail index to the left
    } else {  # If the midpoint element is less than the search key
      head <- midPoint + 1  # Move the head index to the right
    }
  }
  return(FALSE)  # Return FALSE if no match is found
}

# Bubble sort algorithm
bubbleSort <- function(data) {
  nlen <- length(data) - 1  # Get the length of the data minus one
  repeat {
    swap <- FALSE  # Initialize swap flag to FALSE
    for (i in 1:nlen) {  # Iterate through the data
      if (data[i] > data[i + 1]) {  # If the current element is greater than the next element
        temp <- data[i]  # Swap the elements
        data[i] <- data[i + 1]
        data[i + 1] <- temp
        swap <- TRUE  # Set swap flag to TRUE
      }
    }
    if (!swap) break  # Exit the loop if no swaps were made
    nlen <- nlen - 1  # Decrease the length for the next iteration
  }
  return(data)  # Return the sorted data
}

# Insertion sort algorithm
insertionSort <- function(data) {
  for (i in 2:length(data)) {  # Iterate through the data starting from the second element
    key <- data[i]  # Store the current element as the key
    j <- i - 1  # Initialize the previous index
    while (j >= 1 && data[j] > key) {  # Shift elements greater than the key to the right
      data[j + 1] <- data[j]
      j <- j - 1
    }
    data[j + 1] <- key  # Insert the key at the correct position
  }
  return(data)  # Return the sorted data
}

# Merge sort algorithm
mergeSort <- function(data) {
  if (length(data) <= 1) return(data)  # Base case: return the data if its length is 1 or less
  mid <- floor(length(data) / 2)  # Calculate the midpoint
  left <- mergeSort(data[1:mid])  # Recursively sort the left half
  right <- mergeSort(data[(mid + 1):length(data)])  # Recursively sort the right half
  return(merge(left, right))  # Merge the sorted halves
}

# Merge function for merge sort
merge <- function(left, right) {
  merged <- c()  # Initialize an empty vector for the merged result
  while (length(left) > 0 && length(right) > 0) {  # Continue merging while both halves have elements
    if (left[1] <= right[1]) {  # If the first element of the left half is less than or equal to the first element of the right half
      merged <- c(merged, left[1])  # Add the first element of the left half to the merged result
      left <- left[-1]  # Remove the first element from the left half
    } else {  # If the first element of the right half is less than the first element of the left half
      merged <- c(merged, right[1])  # Add the first element of the right half to the merged result
      right <- right[-1]  # Remove the first element from the right half
    }
  }
  return(c(merged, left, right))  # Return the merged result along with any remaining elements
}

# Quick sort algorithm
quickSort <- function(data) {
  if (length(data) <= 1) return(data)  # Base case: return the data if its length is 1 or less
  pivot <- data[1]  # Choose the first element as the pivot
  less <- data[data[-1] <= pivot]  # Elements less than or equal to the pivot
  greater <- data[data[-1] > pivot]  # Elements greater than the pivot
  return(c(quickSort(less), pivot, quickSort(greater)))  # Recursively sort the partitions and combine them with the pivot
}

# Function to get the search key from the user
getSearchKey <- function() {
  cat("Enter search key: ")  # Prompt the user to enter the search key
  return(as.integer(readLines("stdin", n = 1)))  # Read and return the search key as an integer
}

# Function to create a random data set
createData <- function() {
  cat("Enter size of data set: ")  # Prompt the user to enter the size of the data set
  numItems <- as.integer(readLines("stdin", n = 1))  # Read and convert the input to an integer
  return(sample(1:(numItems * 2), numItems))  # Generate and return a random data set of the specified size
}

# Function to view the data
viewData <- function(data) {
  cat(data, "\n")  # Print the data
}

# Main function to run the program
main <- function() {
  data <- createData()  # Create a random data set
  tempData <- data  # Store a copy of the original data
  choice <- ""  # Initialize the user's choice
  while (choice != "8") {  # Continue until the user chooses to quit
    cat("1. Linear search\n")
    cat("2. Binary search\n")
    cat("3. Bubble sort\n")
    cat("4. Insertion sort\n")
    cat("5. Merge sort\n")
    cat("6. View Data\n")
    cat("7. Restore original data\n")
    cat("8. Quit\n")
    cat("9. Quick Sort\n")
    cat("Make selection: ")
    choice <- readLines("stdin", n = 1)  # Read the user's choice
    if (choice == "1") {
      searchKey <- getSearchKey()  # Get the search key from the user
      cat(linearSearch(data, searchKey), "\n")  # Perform linear search and print the result
    } else if (choice == "2") {
      searchKey <- getSearchKey()  # Get the search key from the user
      cat(binarySearch(data, searchKey), "\n")  # Perform binary search and print the result
    } else if (choice == "3") {
      start <- Sys.time()  # Record the start time
      data <- bubbleSort(data)  # Perform bubble sort
      end <- Sys.time()  # Record the end time
      cat(sprintf("Total time: %.1f ms\n", as.numeric(difftime(end, start, units = "secs")) * 1000))  # Print the elapsed time
    } else if (choice == "4") {
      start <- Sys.time()  # Record the start time
      data <- insertionSort(data)  # Perform insertion sort
      end <- Sys.time()  # Record the end time
      cat(sprintf("Total time: %.1f ms\n", as.numeric(difftime(end, start, units = "secs")) * 1000))  # Print the elapsed time
    } else if (choice == "5") {
      start <- Sys.time()  # Record the start time
      data <- mergeSort(data)  # Perform merge sort
      end <- Sys.time()  # Record the end time
      cat(sprintf("Total time: %.1f ms\n", as.numeric(difftime(end, start, units = "secs")) * 1000))  # Print the elapsed time
    } else if (choice == "6") {
      viewData(data)  # View the current data
    } else if (choice == "7") {
      data <- tempData  # Restore the original data
    } else if (choice == "9") {
      start <- Sys.time()  # Record the start time
      data <- quickSort(data)  # Perform quick sort
      end <- Sys.time()  # Record the end time
      cat(sprintf("Total time: %.1f ms\n", as.numeric(difftime(end, start, units = "secs")) * 1000))  # Print the elapsed time
    }
  }
}

# Run the main function
main()  # Start the program