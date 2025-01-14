class Node
    attr_accessor :data, :next
  
    def initialize(data)
      @data = data
      @next = nil
    end
  end
  
  # Create a linked list
  head = Node.new(1) # Create the head of the list
  head.next = Node.new(2) # Create the first node of the list pointed by the head
  head.next.next = Node.new(3) # Create the second node of the list
  
  # Linked List
  # head -> Node(1) -> Node(2) -> Node(3) -> nil
  
  temp = head
  while temp != nil
    print "#{temp.data} "
    temp = temp.next
  end