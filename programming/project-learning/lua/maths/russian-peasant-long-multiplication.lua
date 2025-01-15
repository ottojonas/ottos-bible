-- Prompt the user to enter the first operand
io.write("Enter op1: ")
local op1 = tonumber(io.read())

-- Prompt the user to enter the second operand
io.write("Enter op2: ")
local op2 = tonumber(io.read())

-- Initialize the answer to 0
local ans = 0

-- Loop until the first operand becomes 0
while op1 > 0 do
    -- If the first operand is odd, add the second operand to the answer
    if op1 % 2 ~= 0 then
        ans = ans + op2
        print(ans)
    end

    -- Halve the first operand (discarding the remainder)
    op1 = math.floor(op1 / 2)
    -- Double the second operand
    op2 = op2 * 2

    -- Print the current values of the operands
    print(op1, op2)
end

-- Print the final answer
print("The answer is: ", ans)
