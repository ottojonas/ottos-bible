puts "Enter data size: "
dataSize = gets.to_i

data = []
hashTable = Array.new(dataSize)

dataSize.times do
  nameLength = rand(3..12)
  tempString = ""
  nameLength.times do
    char = (65 + rand(26)).chr
    tempString += char
  end
  data << tempString
end

puts data