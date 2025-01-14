data <- c("A", "+", "B", "*", "C", "/", "D", "-", "E")

left <- c(NA, 0, NA, 2, NA, 1, NA, 6, NA)
right <- c(NA, 3, NA, 4, NA, 7, NA, 8, NA)

root <- 5

P <- function(T) {
    if (!is.na(left[T])) {
        P(left[T])
    }
    if (!is.na(right[T])) {
        P(right[T])
    }
    cat(data[T], "\n")
}

P(root)