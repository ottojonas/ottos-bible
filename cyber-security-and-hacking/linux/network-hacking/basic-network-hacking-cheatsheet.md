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

## Sniffing

## Network Scanning

## Shells
