---
modified: 2025-01-15T23:16:06.012Z
title: Number Bases
---

# Number Bases

## Denary (Decimal)
- **Base 10**
  - Digits: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
  - The most commonly used number system in everyday life.
  - Each digit's place value is a power of 10.
  - Example: `345` in denary is `3*10^2 + 4*10^1 + 5*10^0`.

## Binary
- **Base 2**
  - Digits: 0, 1
  - Used in digital electronics and computer systems.
  - Each digit's place value is a power of 2.
  - Example: `1011` in binary is `1*2^3 + 0*2^2 + 1*2^1 + 1*2^0 = 11` in denary.

## Hexadecimal
- **Base 16**
  - Digits: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F
  - Commonly used in computing as a more human-friendly representation of binary-coded values.
  - Each digit's place value is a power of 16.
  - Example: `1A3` in hexadecimal is `1*16^2 + A*16^1 + 3*16^0 = 1*256 + 10*16 + 3 = 419` in denary.

## Octal
- **Base 8**
  - Digits: 0, 1, 2, 3, 4, 5, 6, 7
  - Used in some computing applications.
  - Each digit's place value is a power of 8.
  - Example: `157` in octal is `1*8^2 + 5*8^1 + 7*8^0 = 1*64 + 5*8 + 7 = 111` in denary.

## Float Numbers
- **Decimal numbers**
- Also known as **'Real Numbers'**
- Represent numbers that have a fractional part.
- Typically written in the form of `mantissa * base^exponent`.
- Example: `5.75` in decimal can be represented as `1.011 * 2^2` in binary floating-point.

## Conversions Between Bases
- **Binary to Decimal**: Sum the products of each binary digit and its corresponding power of 2.
  - Example: `1010` in binary is `1*2^3 + 0*2^2 + 1*2^1 + 0*2^0 = 10` in decimal.
- **Decimal to Binary**: Divide the decimal number by 2 and record the remainders.
  - Example: `10` in decimal is `1010` in binary.
- **Hexadecimal to Decimal**: Sum the products of each hexadecimal digit and its corresponding power of 16.
  - Example: `1F` in hexadecimal is `1*16^1 + F*16^0 = 1*16 + 15 = 31` in decimal.
- **Decimal to Hexadecimal**: Divide the decimal number by 16 and record the remainders.
  - Example: `31` in decimal is `1F` in hexadecimal.

## Applications
- **Binary**: Used in computer systems, digital circuits, and data encoding.
- **Hexadecimal**: Used in programming, memory addressing, and color codes in web design.
- **Octal**: Used in Unix file permissions and some legacy computing systems.
- **Decimal**: Used in everyday arithmetic and financial calculations.

## Summary
Understanding different number bases is crucial for various fields, including computer science, electronics, and mathematics. Each base has its unique applications and advantages, making it essential to know how to convert between them and understand their representations.