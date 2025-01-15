set.seed(Sys.time())  # Set the seed for random number generation based on the current time

cat("Enter data size: ")  # Prompt the user to enter the size of the data
dataSize <- as.integer(readLines("stdin", n = 1))  # Read the input from the user and convert it to an integer

data <- character(dataSize)  # Initialize a character vector to store the data
hashTable <- vector("list", dataSize)  # Initialize a list to store the hash table

for (i in 1:dataSize) {  # Loop through the range from 1 to dataSize
    nameLength <- sample(3:12, 1)  # Randomly select a name length between 3 and 12
    tempString <- paste0(sample(LETTERS, nameLength, replace = TRUE), collapse = "")  # Generate a random string of the selected length
    data[i] <- tempString  # Store the generated string in the data vector
}

print(data)  # Print the generated data