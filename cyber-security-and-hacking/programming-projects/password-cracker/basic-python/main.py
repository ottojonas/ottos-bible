import hashlib
from urllib.request import urlopen
from icecream import ic  # Importing the icecream library for debugging


# Function to read word list stored in URL and store as word_list_file
def read_word_list(url):
    try:
        word_list_file = urlopen(url).read()  # Fetch the word list from the URL
    except Exception as error:
        ic(
            f"error while fetching wordlist, error: {error}"
        )  # Print error message if fetching fails
        exit()  # Exit the program
    return word_list_file  # Return the fetched word list


# Function to hash a password using SHA-1
def hash(word_list_password):
    result = hashlib.sha1(word_list_password.encode())  # Hash the password
    return result.hexdigest()  # Return the hexadecimal digest of the hash


# Function to iterate through the password list to find if the inputted password matches an item in word_list_file
def bruteforce(guess_password_list, actual_password_hash):
    for guess_password in guess_password_list:
        if (
            hash(guess_password) == actual_password_hash
        ):  # Check if the hashed guess matches the actual password hash
            ic(
                f"your password is: {guess_password} - it is a leaked or common password - please change it"
            )  # Print the matched password
            exit()  # Exit the program


# URL of the word list file
url = "https://raw.githubusercontent.com/berzerk0/Probable-Wordlists/master/Real-Passwords/Top12Thousand-probable-v2.txt"

# User input password
actual_password = input("input password here: ")

# Hash the inputted password
actual_password_hash = hash(actual_password)

# Read word list and store in guess_password_list to be read by bruteforce method
word_list = read_word_list(url).decode("UTF-8")  # Decode the fetched word list
guess_password_list = word_list.split(
    "\n"
)  # Split the word list into individual passwords

# Call the bruteforce function to check if the password is in the word list
bruteforce(guess_password_list, actual_password_hash)

# Print message if the password could not be found in the word list
print("password could not be found in wordlist")
