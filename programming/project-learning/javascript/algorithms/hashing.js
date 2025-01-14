const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question('Enter data size: ', dataSize => {
    dataSize = parseInt(dataSize);
    const data = [];
    const hashTable = new Array(dataSize).fill(null);

    for (let i = 0; i < dataSize; i++) {
        const nameLength = Math.floor(Math.random() * 10) + 3;
        let tempString = '';
        for (let j = 0; j < nameLength; j++) {
            const char = String.fromCharCode(Math.floor(Math.random() * 26) + 65);
            tempString += char;
        }
        data.push(tempString);
    }

    console.log(data);
    readline.close();
});