# Read a number from user input
number = (int(input("Enter a number: ")))

# Loop until the number becomes 1
while number != 1:
    # If the number is even, divide it by 2
    if number % 2 == 0:
        number = number // 2
        print(number)
    # If the number is odd, multiply it by 3 and add 1
    else:
        number = (number * 3) + 1
        print(number)