<?php
// Prompt the user to enter the size of the data
echo "Enter data size: ";
$dataSize = intval(trim(fgets(STDIN))); // Read the input, trim any whitespace, and convert it to an integer

$data = []; // Initialize an empty array to store the data
$hashTable = array_fill(0, $dataSize, null); // Initialize a hash table with null values of the given size

// Loop to generate random strings and add them to the data array
for ($i = 0; $i < $dataSize; $i++) {
    $nameLength = rand(3, 12); // Generate a random length for the string between 3 and 12
    $tempString = ''; // Initialize an empty string to build the random name
    for ($j = 0; $j < $nameLength; $j++) {
        $char = chr(rand(65, 90)); // Generate a random uppercase letter (ASCII 65-90)
        $tempString .= $char; // Append the character to the temporary string
    }
    $data[] = $tempString; // Add the generated string to the data array
}

// Print the generated data array
print_r($data);
?>