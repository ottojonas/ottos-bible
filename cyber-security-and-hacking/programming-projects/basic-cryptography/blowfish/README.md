# Blowfish Encryption and Decryption Project

## Overview

This project demonstrates the implementation of the Blowfish encryption and decryption algorithm in Java. Blowfish is a symmetric-key block cipher designed to provide a fast and secure method for encrypting and decrypting data. It is known for its speed and effectiveness and is widely used in various applications, including securing payments in e-commerce platforms and protecting passwords in password management tools.

## Project Structure

The project consists of the following files:

-

MainEncrypt.java

: Contains the implementation of the Blowfish encryption algorithm.

-

MainDecrypt.java

: Contains the implementation of the Blowfish decryption algorithm.

-

notes.md

: Provides a brief description of the Blowfish algorithm.

## Blowfish Algorithm

Blowfish is a symmetric-key block cipher that splits messages into blocks of 64 bits and encrypts them individually. It uses a variable-length key, ranging from 32 bits to 448 bits, making it highly flexible. The algorithm consists of two main parts: key expansion and data encryption.

### Key Expansion

The key expansion process converts a key of at most 448 bits into several subkeys totaling 4168 bytes. The subkeys are stored in the P-array and four S-boxes. The P-array consists of 18 32-bit subkeys, while each S-box contains 256 entries.

### Data Encryption

The data encryption process involves 16 rounds of operations, including key-dependent permutation and substitution. Each round consists of the following steps:

1. Divide the 64-bit block into two 32-bit halves.
2. Apply the F-function to one half and XOR the result with the other half.
3. Swap the halves.
4. Repeat the process for 16 rounds.
5. After the final round, swap the halves one last time and combine them to produce the ciphertext.

## Usage

### Encryption

To encrypt a plaintext message using the Blowfish algorithm, run the

MainEncrypt

class in the

encryption

directory. The

MainEncrypt

class initializes the key, generates the subkeys, and performs the encryption process. The encrypted ciphertext is printed to the console.

```sh
javac encryption/MainEncrypt.java
java encryption.MainEncrypt
```

### Decryption

To decrypt a ciphertext message using the Blowfish algorithm, run the `MainDecrypt` class in the

decryption

directory. The `MainDecrypt` class initializes the key, generates the subkeys, and performs the decryption process. The decrypted plaintext is printed to the console.

```sh
javac decryption/MainDecrypt.java
java decryption.MainDecrypt
```

## Conclusion

This project provides a basic implementation of the Blowfish encryption and decryption algorithm in Java. It demonstrates the key expansion and data encryption processes, showcasing the algorithm's speed and effectiveness. Blowfish remains a popular choice for securing sensitive data in various applications due to its flexibility and public domain availability.
