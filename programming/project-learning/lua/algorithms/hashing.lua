-- Seed the random number generator with the current time
math.randomseed(os.time())

-- Prompt the user to enter the size of the data
print("Enter data size: ")
local dataSize = tonumber(io.read()) -- Read the user input and convert it to a number

local data = {} -- Table to store generated data
local hashTable = {} -- Table to represent the hash table

-- Loop to generate random data
for i = 1, dataSize do
    table.insert(hashTable, nil) -- Initialize the hash table with nil values
    local nameLength = math.random(3, 12) -- Generate a random length for the string (between 3 and 12)
    local tempString = "" -- Temporary string to build the random name
    for j = 1, nameLength do
        local char = string.char(math.random(65, 90)) -- Generate a random uppercase letter (ASCII 65-90)
        tempString = tempString .. char -- Append the character to the temporary string
    end
    table.insert(data, tempString) -- Insert the generated string into the data table
end

-- Loop to print the generated data
for i, v in ipairs(data) do
    print(v) -- Print each string in the data table
end