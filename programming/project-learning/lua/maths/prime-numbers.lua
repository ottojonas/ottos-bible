io.write("range: ")
local p = tonumber(io.read())

-- Initialize an array of boolean values representing primality, initially all set to "T" (True)
local primes = {}
for i = 1, p do
    primes[i] = "T"
end

-- Iterate through each number in the range starting from 2 to p-1
for possiblePrime = 2, p - 1 do
    -- If the number is still marked as prime
    if primes[possiblePrime] == "T" then
        -- Mark all multiples of the number as not prime ("F")
        for multiple = possiblePrime * 2, p - 1, possiblePrime do
            primes[multiple] = "F"
        end
    end
end

-- Create a list of prime numbers by filtering indices marked as "T" (True) and greater than 1
local primeNumbers = {}
for index = 2, p - 1 do
    if primes[index] == "T" then
        table.insert(primeNumbers, index)
    end
end

-- Print the list of prime numbers
for _, prime in ipairs(primeNumbers) do
    io.write(prime, " ")
end
print()