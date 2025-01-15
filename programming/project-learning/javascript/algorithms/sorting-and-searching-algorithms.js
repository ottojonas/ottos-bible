const readline = require("readline-sync"); // Import readline-sync for user input
const { performance } = require("perf_hooks"); // Import performance for measuring execution time

// Linear search algorithm
function linearSearch(data, searchKey) {
  for (let i = 0; i < data.length; i++) {
    if (data[i] === searchKey) {
      return true; // Return true if searchKey is found
    }
  }
  return false; // Return false if searchKey is not found
}

// Binary search algorithm
function binarySearch(data, searchKey) {
  let head = 0;
  let tail = data.length - 1;
  while (head <= tail) {
    const midPoint = Math.floor((head + tail) / 2);
    if (data[midPoint] === searchKey) {
      return true; // Return true if searchKey is found
    } else if (data[midPoint] > searchKey) {
      tail = midPoint - 1; // Search in the left half
    } else {
      head = midPoint + 1; // Search in the right half
    }
  }
  return false; // Return false if searchKey is not found
}

// Bubble sort algorithm
function bubbleSort(data) {
  let nlen = data.length - 1;
  while (true) {
    let swap = false;
    for (let i = 0; i < nlen; i++) {
      if (data[i] > data[i + 1]) {
        [data[i], data[i + 1]] = [data[i + 1], data[i]]; // Swap elements
        swap = true;
      }
    }
    if (!swap) break; // Exit loop if no swaps were made
    nlen--;
  }
  return data; // Return sorted data
}

// Insertion sort algorithm
function insertionSort(data) {
  for (let i = 1; i < data.length; i++) {
    let key = data[i];
    let j = i - 1;
    while (j >= 0 && data[j] > key) {
      data[j + 1] = data[j]; // Shift elements to the right
      j--;
    }
    data[j + 1] = key; // Insert the key at the correct position
  }
  return data; // Return sorted data
}

// Merge sort algorithm
function mergeSort(data) {
  if (data.length <= 1) return data; // Base case: return if data length is 1 or less
  const mid = Math.floor(data.length / 2);
  const left = mergeSort(data.slice(0, mid)); // Recursively sort the left half
  const right = mergeSort(data.slice(mid)); // Recursively sort the right half
  return merge(left, right); // Merge the sorted halves
}

// Merge function for merge sort
function merge(left, right) {
  const result = [];
  while (left.length && right.length) {
    if (left[0] <= right[0]) {
      result.push(left.shift()); // Add element from left half
    } else {
      result.push(right.shift()); // Add element from right half
    }
  }
  return result.concat(left, right); // Concatenate remaining elements
}

// Quick sort algorithm
function quickSort(data) {
  if (data.length <= 1) return data; // Base case: return if data length is 1 or less
  const pivot = data[0];
  const less = data.slice(1).filter((x) => x <= pivot); // Elements less than or equal to pivot
  const greater = data.slice(1).filter((x) => x > pivot); // Elements greater than pivot
  return quickSort(less).concat(pivot, quickSort(greater)); // Recursively sort and concatenate
}

// Function to get the search key from the user
function getSearchKey() {
  return parseInt(readline.question("Enter search key: ")); // Read and return the search key
}

// Function to create a random data set
function createData() {
  const numItems = parseInt(readline.question("Enter size of data set: ")); // Read the size of the data set
  const data = Array.from(
    { length: numItems },
    () => Math.floor(Math.random() * numItems * 2) + 1
  ); // Generate random numbers
  return data; // Return the generated data
}

// Function to view the data
function viewData(data) {
  console.log(data.join(" ")); // Print the data
}

// Main function to run the program
function main() {
  let data = createData(); // Create a random data set
  const tempData = [...data]; // Store a copy of the original data
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
    choice = readline.question("Make selection: "); // Read the user's choice
    if (choice === "1") {
      const searchKey = getSearchKey();
      console.log(linearSearch(data, searchKey)); // Perform linear search
    } else if (choice === "2") {
      const searchKey = getSearchKey();
      console.log(binarySearch(data, searchKey)); // Perform binary search
    } else if (choice === "3") {
      const start = performance.now();
      data = bubbleSort(data); // Perform bubble sort
      const end = performance.now();
      console.log(`Total time: ${(end - start).toFixed(1)} ms`); // Print execution time
    } else if (choice === "4") {
      const start = performance.now();
      data = insertionSort(data); // Perform insertion sort
      const end = performance.now();
      console.log(`Total time: ${(end - start).toFixed(1)} ms`); // Print execution time
    } else if (choice === "5") {
      const start = performance.now();
      data = mergeSort(data); // Perform merge sort
      const end = performance.now();
      console.log(`Total time: ${(end - start).toFixed(1)} ms`); // Print execution time
    } else if (choice === "6") {
      viewData(data); // View the current data
    } else if (choice === "7") {
      data = [...tempData]; // Restore the original data
    } else if (choice === "9") {
      const start = performance.now();
      data = quickSort(data); // Perform quick sort
      const end = performance.now();
      console.log(`Total time: ${(end - start).toFixed(1)} ms`); // Print execution time
    }
  }
}

main(); // Run the main function
