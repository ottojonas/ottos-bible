#include <iostream>

int main() {
    // Read a number from user input
    int number;
    std::cout << "Enter a number: ";
    std::cin >> number;

    // Loop until the number becomes 1
    while (number != 1) {
        // If the number is even, divide it by 2
        if (number % 2 == 0) {
            number = number / 2;
        }
        // If the number is odd, multiply it by 3 and add 1
        else {
            number = (number * 3) + 1;
        }
        std::cout << number << std::endl;
    }

    return 0;
}