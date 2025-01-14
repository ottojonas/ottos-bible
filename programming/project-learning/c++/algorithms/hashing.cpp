#include <iostream>
#include <vector>
#include <string>
#include <cstdlib>
#include <ctime>

// Function to generate a random string of uppercase letters
std::string generateRandomString(int length) {
    std::string tempString;
    for (int j = 0; j < length; ++j) {
        char ch = 'A' + rand() % 26; // Generate a random ASCII value for uppercase letters (A-Z)
        tempString += ch; // Append the character to the string
    }
    return tempString;
}

int main() {
    srand(time(0)); // Seed the random number generator

    // Prompt the user to enter the size of the data
    int dataSize;
    std::cout << "Enter data size: ";
    std::cin >> dataSize;

    // Initialize vectors for data and hashTable
    std::vector<std::string> data;
    std::vector<std::string> hashTable(dataSize, ""); // Initialize hashTable with empty strings

    // Loop to generate random strings and populate the data and hashTable vectors
    for (int i = 0; i < dataSize; ++i) {
        int nameLength = rand() % 10 + 3; // Generate a random length for the string between 3 and 12
        std::string tempString = generateRandomString(nameLength); // Generate the random string
        data.push_back(tempString); // Append the generated string to the data vector
    }

    // Print the generated data
    for (const std::string& str : data) {
        std::cout << str << std::endl;
    }

    return 0;
}