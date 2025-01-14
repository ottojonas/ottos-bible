const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question('Enter a number: ', number => {
    number = parseInt(number);
    while (number !== 1) {
        if (number % 2 === 0) {
            number = Math.floor(number / 2);
        } else {
            number = number * 3 + 1;
        }
        console.log(number);
    }
    readline.close();
});