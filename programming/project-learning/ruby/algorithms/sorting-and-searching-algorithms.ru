require 'securerandom' # Require the SecureRandom library for generating random numbers

# Linear search algorithm
def linear_search(data, search_key)
  data.each do |item|
    return true if item == search_key # Return true if the search key is found
  end
  false # Return false if the search key is not found
end

# Binary search algorithm
def binary_search(data, search_key)
  head = 0
  tail = data.length - 1
  while head <= tail
    mid_point = (head + tail) / 2
    if data[mid_point] == search_key
      return true # Return true if the search key is found
    elsif data[mid_point] > search_key
      tail = mid_point - 1 # Adjust the tail pointer
    else
      head = mid_point + 1 # Adjust the head pointer
    end
  end
  false # Return false if the search key is not found
end

# Bubble sort algorithm
def bubble_sort(data)
  nlen = data.length - 1
  loop do
    swap = false
    (0...nlen).each do |i|
      if data[i] > data[i + 1]
        data[i], data[i + 1] = data[i + 1], data[i] # Swap the elements
        swap = true
      end
    end
    break unless swap # Exit the loop if no swaps were made
    nlen -= 1
  end
  data
end

# Insertion sort algorithm
def insertion_sort(data)
  (1...data.length).each do |i|
    key = data[i]
    j = i - 1
    while j >= 0 && data[j] > key
      data[j + 1] = data[j] # Shift elements to the right
      j -= 1
    end
    data[j + 1] = key # Insert the key at the correct position
  end
  data
end

# Merge sort algorithm
def merge_sort(data)
  return data if data.length <= 1
  mid = data.length / 2
  left = merge_sort(data[0...mid]) # Recursively sort the left half
  right = merge_sort(data[mid..-1]) # Recursively sort the right half
  merge(left, right) # Merge the sorted halves
end

# Merge function for merge sort
def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift # Add the smaller element to the result
    else
      result << right.shift # Add the smaller element to the result
    end
  end
  result + left + right # Concatenate the remaining elements
end

# Quick sort algorithm
def quick_sort(data)
  return data if data.length <= 1
  pivot = data[0]
  less = data[1..-1].select { |x| x <= pivot } # Elements less than or equal to the pivot
  greater = data[1..-1].select { |x| x > pivot } # Elements greater than the pivot
  quick_sort(less) + [pivot] + quick_sort(greater) # Recursively sort and concatenate
end

# Get the search key from user input
def get_search_key
  puts "Enter search key: "
  gets.to_i
end

# Create a data set with random numbers
def create_data
  puts "Enter size of data set: "
  num_items = gets.to_i
  Array.new(num_items) { SecureRandom.random_number(num_items * 2) + 1 }
end

# View the data set
def view_data(data)
  puts data.join(' ')
end

# Main function to run the program
def main
  data = create_data # Create the data set
  temp_data = data.dup # Duplicate the data set for restoration
  choice = ""
  until choice == "8"
    puts "1. Linear search"
    puts "2. Binary search"
    puts "3. Bubble sort"
    puts "4. Insertion sort"
    puts "5. Merge sort"
    puts "6. View Data"
    puts "7. Restore original data"
    puts "8. Quit"
    puts "9. Quick Sort"
    choice = gets.chomp
    case choice
    when "1"
      search_key = get_search_key
      puts linear_search(data, search_key) # Perform linear search
    when "2"
      search_key = get_search_key
      puts binary_search(data, search_key) # Perform binary search
    when "3"
      start = Time.now
      data = bubble_sort(data) # Perform bubble sort
      puts "Total time: #{((Time.now - start) * 1000).round(1)} ms"
    when "4"
      start = Time.now
      data = insertion_sort(data) # Perform insertion sort
      puts "Total time: #{((Time.now - start) * 1000).round(1)} ms"
    when "5"
      start = Time.now
      data = merge_sort(data) # Perform merge sort
      puts "Total time: #{((Time.now - start) * 1000).round(1)} ms"
    when "6"
      view_data(data) # View the data set
    when "7"
      data = temp_data.dup # Restore the original data set
    when "9"
      start = Time.now
      data = quick_sort(data) # Perform quick sort
      puts "Total time: #{((Time.now - start) * 1000).round(1)} ms"
    end
  end
end

main # Run the main function