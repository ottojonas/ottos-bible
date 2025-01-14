print "Enter a number: "
number = gets.to_i

while number != 1
    if number.even?
        number /= 2
    else
        number = number * 3 + 1
    end
    puts number
end