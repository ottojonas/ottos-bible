PriorityQueue = {}
PriorityQueue.__index = PriorityQueue

function PriorityQueue:new(compare)
    local obj = {heap = {}, compare = compare}
    if type(compare) ~= "function" then
        error("Compare has to be a function")
    end
    setmetatable(obj, self)
    return obj
end

function PriorityQueue:getParentIndex(index)
    return math.floor((index - 1) / 2)
end

function PriorityQueue:getLeftChildIndex(index)
    return 2 * index + 1
end

function PriorityQueue:getRightChildIndex(index)
    return 2 * index + 2
end

function PriorityQueue:swap(index1, index2)
    self.heap[index1], self.heap[index2] = self.heap[index2], self.heap[index1]
end