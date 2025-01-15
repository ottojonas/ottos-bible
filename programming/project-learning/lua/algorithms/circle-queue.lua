-- Define a table to represent the CircularQueue class
CircularQueue = {}
CircularQueue.__index = CircularQueue

-- Constructor for CircularQueue
function CircularQueue:new(maxSize)
    -- Create a new object with initial properties
    local obj = {
        queue = {},       -- Table to store queue elements
        maxSize = maxSize, -- Maximum size of the queue
        head = -1,        -- Index of the front element
        tail = -1         -- Index of the rear element
    }
    -- Set the metatable of the object to CircularQueue
    setmetatable(obj, CircularQueue)
    return obj
end

-- Method to add an element to the queue
function CircularQueue:enqueue(data)
    -- Check if the queue is full
    if (self.tail + 1) % self.maxSize == self.head then
        print("Circular Queue is full")
    -- Check if the queue is empty
    elseif self.head == -1 then
        self.head = 0
        self.tail = 0
        self.queue[self.tail] = data
    else
        -- Add the element to the queue and update the tail index
        self.tail = (self.tail + 1) % self.maxSize
        self.queue[self.tail] = data
    end
end

-- Method to remove an element from the queue
function CircularQueue:dequeue()
    -- Check if the queue is empty
    if self.head == -1 then
        print("Circular Queue is empty")
        return nil
    -- Check if there is only one element in the queue
    elseif self.head == self.tail then
        local temp = self.queue[self.head]
        self.head = -1
        self.tail = -1
        return temp
    else
        -- Remove the element from the queue and update the head index
        local temp = self.queue[self.head]
        self.head = (self.head + 1) % self.maxSize
        return temp
    end
end