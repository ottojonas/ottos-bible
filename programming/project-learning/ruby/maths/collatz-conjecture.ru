print "Enter a number: "
number = gets.to_i # Get the input number from the user and convert it to an integer

while number != 1
  if number.even?
    number /= 2 # If the number is even, divide it by 2
  else
    number = number * 3 + 1 # If the number is odd, multiply it by 3 and add 1
  end
  puts number # Print the current value of the number
end