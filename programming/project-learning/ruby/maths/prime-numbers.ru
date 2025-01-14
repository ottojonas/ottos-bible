print "range: "
p = gets.to_i

# Initialize an array of boolean values representing primality, initially all set to "T" (True)
primes = Array.new(p, "T")

# Iterate through each number in the range starting from 2 to p-1
(2...p).each do |possiblePrime|
    # If the number is still marked as prime
    if primes[possiblePrime] == "T"
        # Mark all multiples of the number as not prime ("F")
        (possiblePrime * 2...p).step(possiblePrime) do |multiple|
            primes[multiple] = "F"
        end
    end
end

# Create a list of prime numbers by filtering indices marked as "T" (True) and greater than 1
primeNumbers = primes.each_index.select { |index| primes[index] == "T" && index > 1 }

# Print the list of prime numbers
puts primeNumbers.join(" ")