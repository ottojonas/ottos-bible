const readline = require('readline-sync');
const { performance } = require('perf_hooks');

function linearSearch(data, searchKey) {
    for (let i = 0; i < data.length; i++) {
        if (data[i] === searchKey) {
            return true;
        }
    }
    return false;
}

function binarySearch(data, searchKey) {
    let head = 0;
    let tail = data.length - 1;
    while (head <= tail) {
        const midPoint = Math.floor((head + tail) / 2);
        if (data[midPoint] === searchKey) {
            return true;
        } else if (data[midPoint] > searchKey) {
            tail = midPoint - 1;
        } else {
            head = midPoint + 1;
        }
    }
    return false;
}

function bubbleSort(data) {
    let nlen = data.length - 1;
    while (true) {
        let swap = false;
        for (let i = 0; i < nlen; i++) {
            if (data[i] > data[i + 1]) {
                [data[i], data[i + 1]] = [data[i + 1], data[i]];
                swap = true;
            }
        }
        if (!swap) break;
        nlen--;
    }
    return data;
}

function insertionSort(data) {
    for (let i = 1; i < data.length; i++) {
        let key = data[i];
        let j = i - 1;
        while (j >= 0 && data[j] > key) {
            data[j + 1] = data[j];
            j--;
        }
        data[j + 1] = key;
    }
    return data;
}

function mergeSort(data) {
    if (data.length <= 1) return data;
    const mid = Math.floor(data.length / 2);
    const left = mergeSort(data.slice(0, mid));
    const right = mergeSort(data.slice(mid));
    return merge(left, right);
}

function merge(left, right) {
    const result = [];
    while (left.length && right.length) {
        if (left[0] <= right[0]) {
            result.push(left.shift());
        } else {
            result.push(right.shift());
        }
    }
    return result.concat(left, right);
}

function quickSort(data) {
    if (data.length <= 1) return data;
    const pivot = data[0];
    const less = data.slice(1).filter(x => x <= pivot);
    const greater = data.slice(1).filter(x => x > pivot);
    return quickSort(less).concat(pivot, quickSort(greater));
}

function getSearchKey() {
    return parseInt(readline.question("Enter search key: "));
}

function createData() {
    const numItems = parseInt(readline.question("Enter size of data set: "));
    const data = Array.from({ length: numItems }, () => Math.floor(Math.random() * numItems * 2) + 1);
    return data;
}

function viewData(data) {
    console.log(data.join(' '));
}

function main() {
    let data = createData();
    const tempData = [...data];
    let choice = "";
    while (choice !== "8") {
        console.log("1. Linear search");
        console.log("2. Binary search");
        console.log("3. Bubble sort");
        console.log("4. Insertion sort");
        console.log("5. Merge sort");
        console.log("6. View Data");
        console.log("7. Restore original data");
        console.log("8. Quit");
        console.log("9. Quick Sort");
        choice = readline.question("Make selection: ");
        if (choice === "1") {
            const searchKey = getSearchKey();
            console.log(linearSearch(data, searchKey));
        } else if (choice === "2") {
            const searchKey = getSearchKey();
            console.log(binarySearch(data, searchKey));
        } else if (choice === "3") {
            const start = performance.now();
            data = bubbleSort(data);
            const end = performance.now();
            console.log(`Total time: ${(end - start).toFixed(1)} ms`);
        } else if (choice === "4") {
            const start = performance.now();
            data = insertionSort(data);
            const end = performance.now();
            console.log(`Total time: ${(end - start).toFixed(1)} ms`);
        } else if (choice === "5") {
            const start = performance.now();
            data = mergeSort(data);
            const end = performance.now();
            console.log(`Total time: ${(end - start).toFixed(1)} ms`);
        } else if (choice === "6") {
            viewData(data);
        } else if (choice === "7") {
            data = [...tempData];
        } else if (choice === "9") {
            const start = performance.now();
            data = quickSort(data);
            const end = performance.now();
            console.log(`Total time: ${(end - start).toFixed(1)} ms`);
        }
    }
}

main();