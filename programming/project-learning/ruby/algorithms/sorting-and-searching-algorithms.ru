require 'securerandom'

def linear_search(data, search_key)
  data.each do |item|
    return true if item == search_key
  end
  false
end

def binary_search(data, search_key)
  head = 0
  tail = data.length - 1
  while head <= tail
    mid_point = (head + tail) / 2
    if data[mid_point] == search_key
      return true
    elsif data[mid_point] > search_key
      tail = mid_point - 1
    else
      head = mid_point + 1
    end
  end
  false
end

def bubble_sort(data)
  nlen = data.length - 1
  loop do
    swap = false
    (0...nlen).each do |i|
      if data[i] > data[i + 1]
        data[i], data[i + 1] = data[i + 1], data[i]
        swap = true
      end
    end
    break unless swap
    nlen -= 1
  end
  data
end

def insertion_sort(data)
  (1...data.length).each do |i|
    key = data[i]
    j = i - 1
    while j >= 0 && data[j] > key
      data[j + 1] = data[j]
      j -= 1
    end
    data[j + 1] = key
  end
  data
end

def merge_sort(data)
  return data if data.length <= 1
  mid = data.length / 2
  left = merge_sort(data[0...mid])
  right = merge_sort(data[mid..-1])
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end

def quick_sort(data)
  return data if data.length <= 1
  pivot = data[0]
  less = data[1..-1].select { |x| x <= pivot }
  greater = data[1..-1].select { |x| x > pivot }
  quick_sort(less) + [pivot] + quick_sort(greater)
end

def get_search_key
  puts "Enter search key: "
  gets.to_i
end

def create_data
  puts "Enter size of data set: "
  num_items = gets.to_i
  Array.new(num_items) { SecureRandom.random_number(num_items * 2) + 1 }
end

def view_data(data)
  puts data.join(' ')
end

def main
  data = create_data
  temp_data = data.dup
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
      puts linear_search(data, search_key)
    when "2"
      search_key = get_search_key
      puts binary_search(data, search_key)
    when "3"
      start = Time.now
      data = bubble_sort(data)
      puts "Total time: #{((Time.now - start) * 1000).round(1)} ms"
    when "4"
      start = Time.now
      data = insertion_sort(data)
      puts "Total time: #{((Time.now - start) * 1000).round(1)} ms"
    when "5"
      start = Time.now
      data = merge_sort(data)
      puts "Total time: #{((Time.now - start) * 1000).round(1)} ms"
    when "6"
      view_data(data)
    when "7"
      data = temp_data.dup
    when "9"
      start = Time.now
      data = quick_sort(data)
      puts "Total time: #{((Time.now - start) * 1000).round(1)} ms"
    end
  end
end

main