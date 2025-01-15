// Import the readline module to create an interface for reading input from the console
const readline = require("readline").createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Prompt the user to enter a number
readline.question("Enter a number: ", (number) => {
  // Convert the input to an integer
  number = parseInt(number);

  // Loop until the number becomes 1
  while (number !== 1) {
    // If the number is even, divide it by 2
    if (number % 2 === 0) {
      number = Math.floor(number / 2);
    } else {
      // If the number is odd, multiply it by 3 and add 1
      number = number * 3 + 1;
    }
    // Print the current value of the number
    console.log(number);
  }
  // Close the readline interface
  readline.close();
});
