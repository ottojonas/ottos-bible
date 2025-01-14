Node = {}
Node.__index = Node

function Node:new(data)
    local self = setmetatable({}, Node)
    self.data = data
    self.next = nil
    return self
end

-- Create a linked list
local head = Node:new(1) -- Create the head of the list
head.next = Node:new(2) -- Create the first node of the list pointed by the head
head.next.next = Node:new(3) -- Create the second node of the list

-- Linked List
-- head -> Node(1) -> Node(2) -> Node(3) -> nil

local temp = head
while temp do
    io.write(temp.data, " ")
    temp = temp.next
end