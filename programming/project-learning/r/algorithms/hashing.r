set.seed(Sys.time())

cat("Enter data size: ")
dataSize <- as.integer(readLines("stdin", n = 1))

data <- character(dataSize)
hashTable <- vector("list", dataSize)

for (i in 1:dataSize) {
    nameLength <- sample(3:12, 1)
    tempString <- paste0(sample(LETTERS, nameLength, replace = TRUE), collapse = "")
    data[i] <- tempString
}

print(data)