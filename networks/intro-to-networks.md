# Intro to Networks
## Table of Contents

1. [What is a Network?](#what-is-a-network)
2. [Types of Networks](#types-of-networks)
3. [Network Topologies](#network-topologies)
4. [Network Components](#network-components)
5. [Network Protocols](#network-protocols)
6. [The OSI Model](#the-osi-model)
7. [TCP/IP Model](#tcpip-model)
8. [IP Addressing](#ip-addressing)
9. [Subnetting](#subnetting)
10. [Routing and Switching](#routing-and-switching)
11. [Network Security](#network-security)

---

## What is a Network?

A **network** is a collection of interconnected devices that communicate with each other to share resources and exchange data. Networks can be wired or wireless and range from small local networks to large global systems like the Internet.

---

## Types of Networks

Networks are categorized based on their scale, ownership, and purpose. The main types include:

### 1. Local Area Network (LAN)

- Covers a small geographical area (e.g., home, office, campus).
- Uses Ethernet cables and Wi-Fi.
- Example: Home network, corporate office network.

### 2. Wide Area Network (WAN)

- Covers large geographical areas (e.g., cities, countries, global networks).
- Uses leased telecommunication lines.
- Example: The Internet.

### 3. Metropolitan Area Network (MAN)

- Covers a city or large campus.
- Example: City-wide Wi-Fi, cable TV networks.

### 4. Personal Area Network (PAN)

- Small-scale network for personal devices.
- Example: Bluetooth-connected devices, smartphone hotspot.

### 5. Virtual Private Network (VPN)

- Extends a private network securely over a public network.
- Encrypts communication for security.

---

## Network Topologies

Network topology refers to the arrangement of devices in a network. Common topologies include:

### 1. Bus Topology

- All devices connected to a single central cable.
- Failure of the cable disrupts the entire network.

### 2. Star Topology

- All devices connect to a central hub or switch.
- If the central hub fails, the network goes down.

### 3. Ring Topology

- Devices connected in a circular fashion.
- Data travels in one or both directions.

### 4. Mesh Topology

- Every device connects to every other device.
- Provides redundancy and high fault tolerance.

### 5. Hybrid Topology

- Combination of two or more topologies.
- Common in enterprise networks.

---

## Network Components

Networks consist of various hardware and software components, including:

### 1. **Hardware Components**

- **Router**: Connects different networks, directs traffic.
- **Switch**: Connects devices within a LAN.
- **Hub**: Basic device that connects multiple devices but does not manage traffic.
- **Modem**: Converts digital signals to analog for transmission over telephone lines.
- **Access Point**: Provides wireless connectivity.

### 2. **Software Components**

- **Network Operating System (NOS)**: Manages network resources (e.g., Windows Server, Linux, Cisco IOS).
- **Protocols**: Define communication rules (e.g., TCP/IP, HTTP, FTP).

---

## Network Protocols

Protocols define rules for data exchange. Some key protocols include:

- **TCP/IP (Transmission Control Protocol/Internet Protocol)** – Core Internet protocols.
- **HTTP/HTTPS (HyperText Transfer Protocol Secure)** – Web browsing.
- **FTP (File Transfer Protocol)** – File sharing.
- **SMTP/IMAP/POP3** – Email transmission.
- **DNS (Domain Name System)** – Resolves domain names to IP addresses.
- **DHCP (Dynamic Host Configuration Protocol)** – Assigns IP addresses dynamically.

---

## The OSI Model

The **Open Systems Interconnection (OSI) model** is a conceptual framework with seven layers:

1. **Physical Layer** – Electrical and hardware transmission.
2. **Data Link Layer** – MAC addresses, switches.
3. **Network Layer** – IP addressing, routing.
4. **Transport Layer** – TCP/UDP, reliable transmission.
5. **Session Layer** – Manages sessions.
6. **Presentation Layer** – Data format translation.
7. **Application Layer** – User-facing applications (e.g., web browsers, email clients).

---

## TCP/IP Model

The **TCP/IP model** simplifies networking into four layers:

1. **Network Interface Layer** – Physical network communication.
2. **Internet Layer** – IP addressing, routing.
3. **Transport Layer** – TCP/UDP communication.
4. **Application Layer** – End-user applications.

---

## IP Addressing

Each device in a network has an **IP address**:

- **IPv4**: 32-bit addresses (e.g., 192.168.1.1).
- **IPv6**: 128-bit addresses (e.g., 2001:db8::ff00:42:8329).
- **Public IPs**: Assigned by ISPs, accessible over the Internet.
- **Private IPs**: Used within LANs, not routable on the Internet.

---

## Subnetting

Subnetting divides a network into smaller sub-networks:

- **Subnet Mask**: Defines network and host portions (e.g., 255.255.255.0).
- **CIDR Notation**: Denoted with a suffix (e.g., 192.168.1.0/24).
- **Benefits**: Efficient IP allocation, improved security, better network performance.

---

## Routing and Switching

- **Routing**: Directing packets between different networks using routers.
- **Switching**: Directing packets within a network using switches.
- **Static vs. Dynamic Routing**:
    - Static: Manually configured routes.
    - Dynamic: Uses routing protocols (e.g., OSPF, BGP, RIP).

---

## Network Security

Security is crucial to protect network resources:

- **Firewalls**: Filter incoming and outgoing traffic.
- **Encryption**: Protects data from unauthorized access (e.g., SSL/TLS, VPNs).
- **Authentication**: Ensures users are legitimate (e.g., passwords, multi-factor authentication).
- **Intrusion Detection & Prevention (IDS/IPS)**: Monitors for malicious activity.
- **Zero Trust Security Model**: Assumes no implicit trust, verifies every request.

---
