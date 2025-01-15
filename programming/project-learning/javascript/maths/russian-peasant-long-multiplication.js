// Import the readline module to create an interface for reading input from the console
const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

// Initialize the answer variable to 0
let ans = 0;

// Prompt the user to enter the first operand
readline.question('Enter op1: ', op1 => {
    // Convert the first operand to an integer
    op1 = parseInt(op1);
    
    // Prompt the user to enter the second operand
    readline.question('Enter op2: ', op2 => {
        // Convert the second operand to an integer
        op2 = parseInt(op2);

        // Loop until the first operand becomes 0
        while (op1 > 0) {
            // If the first operand is odd, add the second operand to the answer
            if (op1 % 2 !== 0) {
                ans += op2;
                console.log(ans);
            }

            // Halve the first operand
            op1 = Math.floor(op1 / 2);
            // Double the second operand
            op2 *= 2;

            // Print the current values of the operands
            console.log(op1, op2);
        }

        // Print the final answer
        console.log("The answer is: ", ans);
        // Close the readline interface
        readline.close();
    });
});