math.randomseed(os.time())

print("Enter data size: ")
local dataSize = tonumber(io.read())

local data = {}
local hashTable = {}

for i = 1, dataSize do
    table.insert(hashTable, nil)
    local nameLength = math.random(3, 12)
    local tempString = ""
    for j = 1, nameLength do
        local char = string.char(math.random(65, 90))
        tempString = tempString .. char
    end
    table.insert(data, tempString)
end

for i, v in ipairs(data) do
    print(v)
end