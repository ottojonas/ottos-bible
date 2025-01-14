# Two's Compliment

Two's complement is a mathematical operation on binary numbers, and it is the most common method of representing signed integers in binary form. It allows for simple arithmetic operations and easy detection of overflow.

### How Two's Complement Works

1. **Positive Numbers**:

   - Positive numbers are represented as usual in binary.

2. **Negative Numbers**:
   - To represent a negative number, follow these steps:
     1. Write the absolute value of the number in binary.
     2. Invert all the bits (change `0` to `1` and `1` to `0`).
     3. Add `1` to the least significant bit (LSB).

### Example

- Representing `5` in 8-bit binary:

  - `00000101`

- Representing `-5` in 8-bit binary:
  1. Write `5` in binary: `00000101`
  2. Invert the bits: `11111010`
  3. Add `1` to the LSB: `11111011`

### Advantages of Two's Complement

- **Single Representation for Zero**: Unlike other methods, two's complement has only one representation for zero.
- **Simple Arithmetic**: Addition, subtraction, and multiplication are straightforward and do not require special rules for positive and negative numbers.
- **Overflow Detection**: Overflow can be easily detected by examining the carry into and out of the most significant bit.

### Usage

Two's complement is widely used in computer systems and programming languages to handle signed integers efficiently.
