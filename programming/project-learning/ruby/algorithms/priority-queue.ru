class PriorityQueue
  def initialize(compare)
    @heap = []
    raise ArgumentError, "Compare has to be a function" unless compare.is_a?(Proc)
    @compare = compare
  end

  def get_parent_index(index)
    (index - 1) / 2
  end

  def get_left_child_index(index)
    2 * index + 1
  end

  def get_right_child_index(index)
    2 * index + 2
  end

  def swap(index1, index2)
    @heap[index1], @heap[index2] = @heap[index2], @heap[index1]
  end
end