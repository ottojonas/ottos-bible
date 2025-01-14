print "Enter op1: "
op1 = gets.to_i

print "Enter op2: "
op2 = gets.to_i

ans = 0

while op1 > 0
    if op1.odd?
        ans += op2
        puts ans
    end

    op1 /= 2
    op2 *= 2

    puts "#{op1} #{op2}"
end

puts "The answer is: #{ans}"