-- Define a table to represent the PriorityQueue class
PriorityQueue = {}
PriorityQueue.__index = PriorityQueue

-- Constructor for PriorityQueue
function PriorityQueue:new(compare)
    local obj = {heap = {}, compare = compare} -- Initialize the heap and comparison function
    if type(compare) ~= "function" then
        error("Compare has to be a function") -- Ensure the compare parameter is a function
    end
    setmetatable(obj, self) -- Set the metatable of the object to PriorityQueue
    return obj
end

-- Method to get the index of the parent node
function PriorityQueue:getParentIndex(index)
    return math.floor((index - 1) / 2) -- Calculate and return the parent index
end

-- Method to get the index of the left child node
function PriorityQueue:getLeftChildIndex(index)
    return 2 * index + 1 -- Calculate and return the left child index
end

-- Method to get the index of the right child node
function PriorityQueue:getRightChildIndex(index)
    return 2 * index + 2 -- Calculate and return the right child index
end

-- Method to swap two elements in the heap
function PriorityQueue:swap(index1, index2)
    self.heap[index1], self.heap[index2] = self.heap[index2], self.heap[index1] -- Swap the elements at index1 and index2
end