# Basic Python Password Cracker

This is a basic password cracker written in Python. It uses a wordlist to perform a brute-force attack to check if a given password is a common or leaked password.

## Prerequisites

- Python 3.x
- Icecream library (for debugging)

## Installation

1. Install Python 3.x from [python.org](https://www.python.org/).
2. Install the required library using pip:
   ```sh
   pip install icecream
   ```

## Usage

Run the script with the following command:

```sh
python main.py
```

You will be prompted to input a password. The script will then check if the password is in the wordlist.

### Example

```sh
python main.py
input password here: password123
```

## Code Explanation

### Imports

-

hashlib

: Provides hashing algorithms.

- `urllib.request`: Used to fetch the wordlist from a URL.
- `icecream`: A library for debugging.

### Functions

####

read_word_list(url)

Fetches the wordlist from the specified URL and returns it.

####

hash(word_list_password)

Hashes a password using the SHA-1 algorithm and returns the hexadecimal digest.

####

bruteforce(guess_password_list, actual_password_hash)

Iterates through the password list to check if the inputted password matches any item in the wordlist. If a match is found, it prints the matched password and exits the program.

### Main Script

1. Defines the URL of the wordlist file.
2. Prompts the user to input a password.
3. Hashes the inputted password.
4. Reads the wordlist from the URL and splits it into individual passwords.
5. Calls the bruteforce function to check if the password is in the wordlist. 6. Prints a message if the password could not be found in the wordlist.

## Wordlist

The wordlist used in this script is fetched from the following URL:
[Top12Thousand-probable-v2.txt](https://raw.githubusercontent.com/berzerk0/Probable-Wordlists/master/Real-Passwords/Top12Thousand-probable-v2.txt)
