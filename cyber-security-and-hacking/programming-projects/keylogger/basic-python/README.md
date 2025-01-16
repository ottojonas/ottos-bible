Collecting workspace information

# Keylogger Project

This project is a simple keylogger that captures keyboard input and sends it to a server. The server stores the captured data in a text file and can display it via a web interface.

## Project Structure

```
basic-python/
    main.py
    server/
        keyboard_capture.txt
        main.py
        server.js
```

-

main.py

: The main script that captures keyboard input and sends it to the server.

-

keyboard_capture.txt

: The file where the server stores the captured keyboard data.

-

main.py

: A script to run commands from a file (not directly related to the keylogger functionality).

-

server.js

: The server script that handles incoming keyboard data and serves it via a web interface.

## Prerequisites

- Python 3.x
- Node.js
- `pip` (Python package installer)

## Setup

1. **Clone the repository:**

   ```sh
   git clone https://github.com/ottojonas/ottos-bible/cyber-security-and-hacking/programming-projects/keylogger/basic-python.git
   cd basic-python
   ```

2. **Install Python dependencies:**

   ```sh
   pip install requests icecream pynput
   ```

3. **Install Node.js dependencies:**

   ```sh
   cd server
   npm install express body-parser
   cd ..
   ```

## Running the Project

1. **Start the server:**

   ```sh
   cd server
   node server.js
   ```

   The server will start listening on port 8080.

2. **Run the keylogger:**

   ```sh
   cd ..
   python main.py
   ```

   The keylogger will start capturing keyboard input and sending it to the server every 10 seconds.

## Viewing Captured Data

1. Open a web browser and navigate to `http://0.0.0.0:8080`.
2. You will see the captured keyboard data displayed on the page.

## Notes

- The keylogger captures all keyboard input and sends it to the server. Use it responsibly and only on systems where you have permission to do so.
- The server stores the captured data in keyboard_capture.txt.
