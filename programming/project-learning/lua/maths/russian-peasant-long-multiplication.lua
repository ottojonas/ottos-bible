io.write("Enter op1: ")
local op1 = tonumber(io.read())

io.write("Enter op2: ")
local op2 = tonumber(io.read())

local ans = 0

while op1 > 0 do
    if op1 % 2 ~= 0 then
        ans = ans + op2
        print(ans)
    end

    op1 = math.floor(op1 / 2)
    op2 = op2 * 2

    print(op1, op2)
end

print("The answer is: ", ans)