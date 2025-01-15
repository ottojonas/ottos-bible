// Import the readline module to read input from the command line
const readline = require("readline").createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Prompt the user to enter the size of the data
readline.question("Enter data size: ", (dataSize) => {
  // Convert the input to an integer
  dataSize = parseInt(dataSize);
  // Initialize an empty array to store the data
  const data = [];
  // Initialize a hash table with null values of the given size
  const hashTable = new Array(dataSize).fill(null);

  // Generate random strings and add them to the data array
  for (let i = 0; i < dataSize; i++) {
    // Generate a random length for the string between 3 and 12
    const nameLength = Math.floor(Math.random() * 10) + 3;
    let tempString = "";
    // Generate a random string of uppercase letters
    for (let j = 0; j < nameLength; j++) {
      const char = String.fromCharCode(Math.floor(Math.random() * 26) + 65);
      tempString += char;
    }
    // Add the generated string to the data array
    data.push(tempString);
  }

  // Print the generated data array
  console.log(data);
  // Close the readline interface
  readline.close();
});
