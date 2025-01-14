io.write("Enter a number: ")
local number = tonumber(io.read())

while number ~= 1 do
    if number % 2 == 0 then
        number = number // 2
    else
        number = number * 3 + 1
    end
    print(number)
end