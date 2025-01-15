puts "Enter data size: "
dataSize = gets.to_i # Get the size of the data from user input and convert it to an integer

data = [] # Initialize an empty array to store the data
hashTable = Array.new(dataSize) # Create a hash table with the given data size

dataSize.times do
  nameLength = rand(3..12) # Generate a random length for the name between 3 and 12
  tempString = "" # Initialize an empty string to build the name
  nameLength.times do
    char = (65 + rand(26)).chr # Generate a random uppercase letter
    tempString += char # Append the character to the temporary string
  end
  data << tempString # Add the generated name to the data array
end

puts data # Print the generated data