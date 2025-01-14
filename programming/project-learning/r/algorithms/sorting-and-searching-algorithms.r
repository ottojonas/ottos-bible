# Linear search algorithm
linearSearch <- function(data, searchKey) {
  for (item in data) {
    if (item == searchKey) {
      return(TRUE)
    }
  }
  return(FALSE)
}

# Binary search algorithm
binarySearch <- function(data, searchKey) {
  head <- 1
  tail <- length(data)
  while (head <= tail) {
    midPoint <- floor((head + tail) / 2)
    if (data[midPoint] == searchKey) {
      return(TRUE)
    } else if (data[midPoint] > searchKey) {
      tail <- midPoint - 1
    } else {
      head <- midPoint + 1
    }
  }
  return(FALSE)
}

# Bubble sort algorithm
bubbleSort <- function(data) {
  nlen <- length(data) - 1
  repeat {
    swap <- FALSE
    for (i in 1:nlen) {
      if (data[i] > data[i + 1]) {
        temp <- data[i]
        data[i] <- data[i + 1]
        data[i + 1] <- temp
        swap <- TRUE
      }
    }
    if (!swap) break
    nlen <- nlen - 1
  }
  return(data)
}

# Insertion sort algorithm
insertionSort <- function(data) {
  for (i in 2:length(data)) {
    key <- data[i]
    j <- i - 1
    while (j >= 1 && data[j] > key) {
      data[j + 1] <- data[j]
      j <- j - 1
    }
    data[j + 1] <- key
  }
  return(data)
}

# Merge sort algorithm
mergeSort <- function(data) {
  if (length(data) <= 1) return(data)
  mid <- floor(length(data) / 2)
  left <- mergeSort(data[1:mid])
  right <- mergeSort(data[(mid + 1):length(data)])
  return(merge(left, right))
}

# Merge function for merge sort
merge <- function(left, right) {
  merged <- c()
  while (length(left) > 0 && length(right) > 0) {
    if (left[1] <= right[1]) {
      merged <- c(merged, left[1])
      left <- left[-1]
    } else {
      merged <- c(merged, right[1])
      right <- right[-1]
    }
  }
  return(c(merged, left, right))
}

# Quick sort algorithm
quickSort <- function(data) {
  if (length(data) <= 1) return(data)
  pivot <- data[1]
  less <- data[data[-1] <= pivot]
  greater <- data[data[-1] > pivot]
  return(c(quickSort(less), pivot, quickSort(greater)))
}

# Function to get the search key from the user
getSearchKey <- function() {
  cat("Enter search key: ")
  return(as.integer(readLines("stdin", n = 1)))
}

# Function to create a random data set
createData <- function() {
  cat("Enter size of data set: ")
  numItems <- as.integer(readLines("stdin", n = 1))
  return(sample(1:(numItems * 2), numItems))
}

# Function to view the data
viewData <- function(data) {
  cat(data, "\n")
}

# Main function to run the program
main <- function() {
  data <- createData()
  tempData <- data
  choice <- ""
  while (choice != "8") {
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
    choice <- readLines("stdin", n = 1)
    if (choice == "1") {
      searchKey <- getSearchKey()
      cat(linearSearch(data, searchKey), "\n")
    } else if (choice == "2") {
      searchKey <- getSearchKey()
      cat(binarySearch(data, searchKey), "\n")
    } else if (choice == "3") {
      start <- Sys.time()
      data <- bubbleSort(data)
      end <- Sys.time()
      cat(sprintf("Total time: %.1f ms\n", as.numeric(difftime(end, start, units = "secs")) * 1000))
    } else if (choice == "4") {
      start <- Sys.time()
      data <- insertionSort(data)
      end <- Sys.time()
      cat(sprintf("Total time: %.1f ms\n", as.numeric(difftime(end, start, units = "secs")) * 1000))
    } else if (choice == "5") {
      start <- Sys.time()
      data <- mergeSort(data)
      end <- Sys.time()
      cat(sprintf("Total time: %.1f ms\n", as.numeric(difftime(end, start, units = "secs")) * 1000))
    } else if (choice == "6") {
      viewData(data)
    } else if (choice == "7") {
      data <- tempData
    } else if (choice == "9") {
      start <- Sys.time()
      data <- quickSort(data)
      end <- Sys.time()
      cat(sprintf("Total time: %.1f ms\n", as.numeric(difftime(end, start, units = "secs")) * 1000))
    }
  }
}

# Run the main function
main()