#include <iostream>

int main() {
    // Initialize the answer to 0
    int ans = 0;

    // Read the first operand from user input
    int op1;
    std::cout << "Enter op1: ";
    std::cin >> op1;

    // Read the second operand from user input
    int op2;
    std::cout << "Enter op2: ";
    std::cin >> op2;

    // Loop until the first operand becomes 0
    while (op1 > 0) {
        // If the first operand is odd, add the second operand to the answer
        if (op1 % 2 != 0) {
            ans += op2;
            std::cout << ans << std::endl;
        }

        // Halve the first operand (integer division by 2)
        op1 = op1 / 2;

        // Double the second operand
        op2 = op2 * 2;

        // Print the current values of the operands
        std::cout << op1 << ", " << op2 << std::endl;
    }

    // Print the final answer
    std::cout << "The answer is: " << ans << std::endl;

    return 0;
}