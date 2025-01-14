data = ["A", "+", "B", "*", "C", "/", "D", "-", "E"]

left = [nil, 0, nil, 2, nil, 1, nil, 6, nil]
right = [nil, 3, nil, 4, nil, 7, nil, 8, nil]

root = 5

def P(T, data, left, right)
  P(left[T], data, left, right) unless left[T].nil?
  P(right[T], data, left, right) unless right[T].nil?
  puts data[T]
end

P(root, data, left, right)