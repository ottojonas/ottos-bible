ans <- 0

op1 <- as.integer(readline(prompt = "Enter op1: "))
op2 <- as.integer(readline(prompt = "Enter op2: "))

while (op1 > 0) {
    if (op1 %% 2 != 0) {
        ans <- ans + op2
        print(ans)
    }

    op1 <- op1 %/% 2
    op2 <- op2 * 2

    print(c(op1, op2))
}

cat("The answer is: ", ans, "\n")