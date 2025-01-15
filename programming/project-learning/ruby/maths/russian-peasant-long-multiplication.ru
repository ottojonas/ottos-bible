print "Enter op1: "
op1 = gets.to_i # Get the first operand from the user and convert it to an integer

print "Enter op2: "
op2 = gets.to_i # Get the second operand from the user and convert it to an integer

ans = 0 # Initialize the answer to 0

while op1 > 0
  if op1.odd?
    ans += op2 # If op1 is odd, add op2 to the answer
    puts ans # Print the current value of the answer
  end

  op1 /= 2 # Divide op1 by 2
  op2 *= 2 # Multiply op2 by 2

  puts "#{op1} #{op2}" # Print the current values of op1 and op2
end

puts "The answer is: #{ans}" # Print the final answer