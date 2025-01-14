const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

let ans = 0;

readline.question('Enter op1: ', op1 => {
    op1 = parseInt(op1);
    readline.question('Enter op2: ', op2 => {
        op2 = parseInt(op2);

        while (op1 > 0) {
            if (op1 % 2 !== 0) {
                ans += op2;
                console.log(ans);
            }

            op1 = Math.floor(op1 / 2);
            op2 *= 2;

            console.log(op1, op2);
        }

        console.log("The answer is: ", ans);
        readline.close();
    });
});