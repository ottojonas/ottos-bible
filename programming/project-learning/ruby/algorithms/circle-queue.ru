class CircularQueue
  # Initialize the CircularQueue with a maximum size
  def initialize(max_size)
    @queue = Array.new(max_size) # Create an array with the given maximum size
    @max_size = max_size # Store the maximum size
    @head = -1 # Initialize head pointer to -1 (indicating the queue is empty)
    @tail = -1 # Initialize tail pointer to -1 (indicating the queue is empty)
  end

  # Method to add an element to the queue
  def enqueue(data)
    if (@tail + 1) % @max_size == @head
      # If the queue is full, print a message
      puts "Circular Queue is full"
    elsif @head == -1
      # If the queue is empty, initialize head and tail to 0 and add the data
      @head = 0
      @tail = 0
      @queue[@tail] = data
    else
      # Otherwise, move the tail pointer and add the data
      @tail = (@tail + 1) % @max_size
      @queue[@tail] = data
    end
  end

  # Method to remove an element from the queue
  def dequeue
    if @head == -1
      # If the queue is empty, print a message and return nil
      puts "Circular Queue is empty"
      nil
    elsif @head == @tail
      # If there is only one element, remove it and reset head and tail to -1
      temp = @queue[@head]
      @head = -1
      @tail = -1
      temp
    else
      # Otherwise, remove the element and move the head pointer
      temp = @queue[@head]
      @head = (@head + 1) % @max_size
      temp
    end
  end
end