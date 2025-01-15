class PriorityQueue
  def initialize(compare)
    @heap = [] # Initialize an empty array to store the heap elements
    raise ArgumentError, "Compare has to be a function" unless compare.is_a?(Proc) # Ensure the compare argument is a Proc
    @compare = compare # Store the comparison function
  end

  def get_parent_index(index)
    (index - 1) / 2 # Calculate the parent index of a given index
  end

  def get_left_child_index(index)
    2 * index + 1 # Calculate the left child index of a given index
  end

  def get_right_child_index(index)
    2 * index + 2 # Calculate the right child index of a given index
  end

  def swap(index1, index2)
    @heap[index1], @heap[index2] = @heap[index2], @heap[index1] # Swap the elements at the given indices
  end
end