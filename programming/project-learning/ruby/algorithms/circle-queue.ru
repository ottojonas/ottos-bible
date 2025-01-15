class CircularQueue
  def initialize(max_size)
    @queue = Array.new(max_size)
    @max_size = max_size
    @head = -1
    @tail = -1
  end

  def enqueue(data)
    if (@tail + 1) % @max_size == @head
      puts "Circular Queue is full"
    elsif @head == -1
      @head = 0
      @tail = 0
      @queue[@tail] = data
    else
      @tail = (@tail + 1) % @max_size
      @queue[@tail] = data
    end
  end

  def dequeue
    if @head == -1
      puts "Circular Queue is empty"
      nil
    elsif @head == @tail
      temp = @queue[@head]
      @head = -1
      @tail = -1
      temp
    else
      temp = @queue[@head]
      @head = (@head + 1) % @max_size
      temp
    end
  end
end