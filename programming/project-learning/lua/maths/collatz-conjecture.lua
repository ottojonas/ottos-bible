-- Prompt the user to enter a number
io.write("Enter a number: ")

-- Read the user input and convert it to a number
local number = tonumber(io.read())

-- Loop until the number becomes 1
while number ~= 1 do
    -- If the number is even, divide it by 2
    if number % 2 == 0 then
        number = number // 2
    else
        -- If the number is odd, multiply it by 3 and add 1
        number = number * 3 + 1
    end
    -- Print the current value of the number
    print(number)
end
