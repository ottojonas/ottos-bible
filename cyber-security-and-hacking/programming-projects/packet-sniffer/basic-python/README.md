# Packet Sniffer

This is a basic packet sniffer written in Python using the Scapy library. It captures TCP packets on a specified network interface and logs the connection details to a file.

## Prerequisites

- Python 3.x
- Scapy library
- Icecream library (for debugging)

## Installation

1. Install Python 3.x from [python.org](https://www.python.org/).
2. Install the required libraries using pip:
   ```sh
   pip install scapy icecream
   ```

## Usage

Run the script with the following command:

```sh
python main.py <interface> [verbose]
```

- `<interface>`: The network interface to sniff on (e.g., `eth0`, `wlan0`).
- `[verbose]`: Optional. If specified, enables verbose output.

### Example

To sniff packets on the `eth0` interface with verbose output:

```sh
python main.py eth0 verbose
```

## Code Explanation

### Imports

-

sys

: Provides access to some variables used or maintained by the interpreter.

-

icecream

: A library for debugging.

-

scapy.all

: Imports all Scapy functions for packet capturing.

-

scapy.layers.inet

: Imports IP and TCP layers from Scapy.

### Functions

####

handle_packet(packet, log)

Handles each captured packet. If the packet has a TCP layer, it extracts the source and destination IP addresses and ports, and writes the connection details to the log file.

####

main(interface, verbose=False)

Starts packet sniffing on the specified network interface. It opens a log file and uses the

sniff

function from Scapy to capture packets. If verbose mode is enabled, it provides detailed output.

### Entry Point

The script checks if the correct number of arguments is provided. If not, it prints a usage message and exits. If the arguments are valid, it calls the

main

function with the specified interface and verbose mode.

## Handling Interrupts

The script handles keyboard interrupts (Ctrl+C) to gracefully exit the program.

## Log Files

The captured packet details are logged in a file named `sniffer_<interface>_log.txt` in the `log_files` directory.
