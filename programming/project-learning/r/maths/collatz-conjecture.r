number <- as.integer(readline(prompt = "Enter a number: "))  # Prompt the user to enter a number and convert it to an integer

while (number != 1) {  # Continue the loop until the number becomes 1
    if (number %% 2 == 0) {  # Check if the number is even
        number <- number %/% 2  # If even, divide the number by 2
    } else {  # If the number is odd
        number <- number * 3 + 1  # Multiply the number by 3 and add 1
    }
    print(number)  # Print the current value of the number
}