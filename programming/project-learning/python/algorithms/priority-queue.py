import types
class PriorityQueue:
  def __init__(self, compare):
    '''Function to initialize the data strcture'''
    self.heap = [] # Initial empty array
    if not isinstance(compare, types.FunctionType):
      raise TypeError("Compare has to be a function")
    self.compare = compare

  def get_parent_index(self, index):
    '''Function to get parent of index'''
    return (index - 1) // 2

  def get_left_child_index(self, index):
    '''Function to get left child of index'''
    return 2 * index + 1

  def get_right_child_index(self, index):
    '''Function to get right child of index'''
    return 2 * index + 2

  def swap(self, index1, index2):
    '''Function for swapping nodes'''
    self.heap[index1], self.heap[index2] = self.heap[index2], self.heap[index1]

  def enqueue(self, value):
    '''Function for adding nodes'''
    self.heap.append(value) # Add to the end of the heap
    self.bubble_up() # Then start going up till it's found its place

  def bubble_up(self):
    '''Function to pull node upward'''
    index = len(self.heap) - 1
    while index > 0:
      parent_index = self.get_parent_index(index)
      if self.compare(self.heap[index], self.heap[parent_index]):
        self.swap(index, parent_index)
        index = parent_index
      else:
        break

  def dequeue(self):
    '''Function for removing highest priority node'''
    if len(self.heap) == 0:
      return None
    if len(self.heap) == 1:
      return self.heap.pop()

    min_value = self.heap[0] # Store a copy of the highest priority node
    self.heap[0] = self.heap.pop() # Keep the last node in the first O(1)
    self.bubble_down(0) # Then push it down till its found its place
    return min_value # Return the copy

  def bubble_down(self, index):
    '''Function to push node downward'''
    left_child_index = self.get_left_child_index(index)
    right_child_index = self.get_right_child_index(index)
    smallest = index

    if left_child_index < len(self.heap) and self.compare(self.heap[left_child_index], self.heap[smallest]):
      smallest = left_child_index

    if right_child_index < len(self.heap) and self.compare(self.heap[right_child_index], self.heap[smallest]):
      smallest = right_child_index

    if smallest != index:
      self.swap(index, smallest)
      self.bubble_down(smallest)

  def peek(self):
    '''Convenient function to check the smallest element'''
    return self.heap[0] if self.heap else None

  def is_empty(self):
    '''Convenient function to check if queue is empty'''
    return len(self.heap) == 0
  
  def __len__(self):
    return len(self.heap)


# Example Usage
if(__name__ == "__main__"):
  pq = PriorityQueue(lambda a, b: a < b)  # Min-Heap

  pq.enqueue(5)
  pq.enqueue(3)
  pq.enqueue(8)

  print(pq.peek())  # Output: 3
  print(pq.dequeue())  # Output: 3
  print(pq.peek())  # Output: 5
