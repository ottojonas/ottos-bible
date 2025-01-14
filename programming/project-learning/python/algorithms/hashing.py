import random  # Import the random module to generate random numbers

# Prompt the user to enter the size of the data
dataSize = int(input("Enter data size: "))

# Initialize empty lists for data and hashTable
data = []
hashTable = []

# Loop to generate random strings and populate the data and hashTable lists
for i in range(dataSize):
    hashTable.append(None)  # Append None to the hashTable list to initialize it
    nameLength = random.randint(3, 12)  # Generate a random length for the string between 3 and 12
    tempString = ""  # Initialize an empty string
    for j in range(nameLength):
        char = random.randint(65, 90)  # Generate a random ASCII value for uppercase letters (A-Z)
        tempString += chr(char)  # Convert the ASCII value to a character and append to the string
    data.append(tempString)  # Append the generated string to the data list