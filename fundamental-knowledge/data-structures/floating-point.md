---
modified: 2025-01-14T21:57:38.432Z
title: "Floating Point "
---

# Floating Point

- Floating points provide accuracy of a greater range of values with a given number of bits

#### Components of Floating Points

- Sign bit
- Mantissa
- Exponent

#### General Information

- If the Exponent is positive then the decimal place moves to the left and if the exponent is negative then the decimal place moves to the right
- Always involves a 'Sign Bit'
- Always uses [Two's Compliment](/fundamental-knowledge/maths/twos-compliment.md/#twos-compliment)

#### Converting to Floating Point

1. **Determine the Sign Bit**:
   - If the number is positive, the sign bit is `0`.
   - If the number is negative, the sign bit is `1`.

2. **Convert the Number to Binary**:
   - Convert the absolute value of the number to its binary form.

3. **Normalize the Binary Number**:
   - Adjust the binary number so that it is in the form of `1.xxxxx * 2^n`.
   - Count the number of positions the decimal point has moved to determine the exponent `n`.

4. **Calculate the Exponent**:
   - Add the bias to the exponent `n`. The bias is typically `127` for single-precision floating point numbers.
   - Convert the biased exponent to binary.

5. **Determine the Mantissa**:
   - The mantissa is the fractional part of the normalized binary number (excluding the leading `1`).

6. **Combine the Components**:
   - Combine the sign bit, the exponent, and the mantissa to form the final floating point representation.

Example:
- Convert `-5.75` to floating point:
  1. Sign bit: `1` (since the number is negative)
  2. Binary: `5.75` in binary is `101.11`
  3. Normalize: `1.0111 * 2^2`
  4. Exponent: `2 + 127 = 129` → `10000001` in binary
  5. Mantissa: `01110000000000000000000`
  6. Final representation: `1 10000001 01110000000000000000000`