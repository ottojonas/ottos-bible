ans <- 0  # Initialize the answer to 0

op1 <- as.integer(readline(prompt = "Enter op1: "))  # Prompt the user to enter the first operand and convert it to an integer
op2 <- as.integer(readline(prompt = "Enter op2: "))  # Prompt the user to enter the second operand and convert it to an integer

while (op1 > 0) {  # Continue the loop while the first operand is greater than 0
    if (op1 %% 2 != 0) {  # Check if the first operand is odd
        ans <- ans + op2  # If odd, add the second operand to the answer
        print(ans)  # Print the current value of the answer
    }

    op1 <- op1 %/% 2  # Divide the first operand by 2 (integer division)
    op2 <- op2 * 2  # Multiply the second operand by 2

    print(c(op1, op2))  # Print the current values of the operands
}

cat("The answer is: ", ans, "\n")  # Print the final answer