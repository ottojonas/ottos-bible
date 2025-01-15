CircularQueue = {}
CircularQueue.__index = CircularQueue

function CircularQueue:new(maxSize)
    local obj = {
        queue = {},
        maxSize = maxSize,
        head = -1,
        tail = -1
    }
    setmetatable(obj, CircularQueue)
    return obj
end

function CircularQueue:enqueue(data)
    if (self.tail + 1) % self.maxSize == self.head then
        print("Circular Queue is full")
    elseif self.head == -1 then
        self.head = 0
        self.tail = 0
        self.queue[self.tail] = data
    else
        self.tail = (self.tail + 1) % self.maxSize
        self.queue[self.tail] = data
    end
end

function CircularQueue:dequeue()
    if self.head == -1 then
        print("Circular Queue is empty")
        return nil
    elseif self.head == self.tail then
        local temp = self.queue[self.head]
        self.head = -1
        self.tail = -1
        return temp
    else
        local temp = self.queue[self.head]
        self.head = (self.head + 1) % self.maxSize
        return temp
    end
end