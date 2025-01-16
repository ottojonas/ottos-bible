import sys

from icecream import ic  # Importing the icecream library for debugging
from scapy.all import sniff  # Importing the sniff function from scapy for packet capturing
from scapy.layers.inet import IP, TCP  # Importing IP and TCP layers from scapy

# Function to handle each captured packet
def handle_packet(packet, log): 
    if packet.haslayer(TCP):  # Check if the packet has a TCP layer
        src_ip = packet[IP].src  # Get the source IP address
        dst_ip = packet[IP].dst  # Get the destination IP address
        
        src_port = packet[TCP].sport  # Get the source port
        dst_port = packet[TCP].dport  # Get the destination port
        
        # Write the connection details to the log file
        log.write(f'TCP Connection: {src_ip}:{src_port} => {dst_ip}:{dst_port}\n')

# Main function to start packet sniffing
def main(interface, verbose=False): 
    logfile_name = f"log_files/sniffer_{interface}_log.txt"  # Define the log file name
    with open(logfile_name, "w") as logfile:  # Open the log file in write mode
        try:
            if verbose:  # If verbose mode is enabled
                sniff(
                    iface=interface,  # Network interface to sniff on
                    prn=lambda pkt: handle_packet(pkt, logfile),  # Function to call for each packet
                    store=0,  # Do not store packets in memory
                    verbose=verbose,  # Enable verbose output
                )
            else:  # If verbose mode is not enabled
                sniff(
                    iface=interface,  # Network interface to sniff on
                    prn=lambda pkt: handle_packet(pkt, logfile),  # Function to call for each packet
                    store=0  # Do not store packets in memory
                )
        except KeyboardInterrupt:  # Handle keyboard interrupt (Ctrl+C)
            sys.exit(0)  # Exit the program

# Entry point of the script
if __name__ == "__main__": 
    if len(sys.argv) < 2 or len(sys.argv) > 3:  # Check if the number of arguments is valid
        ic("Usage: python main.py <interface> [verbose]")  # Print usage message
        sys.exit(1)  # Exit the program with an error code
    verbose = False
    if len(sys.argv) == 3 and sys.argv[2].lower() == "verbose":  # Check if verbose mode is specified
        verbose = True 
        
    main(sys.argv[1], verbose)  # Call the main function with the specified interface and verbose mode