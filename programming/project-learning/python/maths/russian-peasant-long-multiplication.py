# Initialize the answer to 0
ans = 0 

# Read the first operand from user input
op1 = int(input("Enter op1: "))

# Read the second operand from user input
op2 = int(input("Enter op2: "))

# Loop until the first operand becomes 0
while op1 > 0:
    # If the first operand is odd, add the second operand to the answer
    if op1 % 2 != 0:
        ans += op2
        print(ans)
    
    # Halve the first operand (integer division by 2)
    op1 = op1 // 2
    
    # Double the second operand
    op2 = op2 * 2
    
    # Print the current values of the operands
    print(op1, op2)

# Print the final answer
print("The answer is: ", ans)