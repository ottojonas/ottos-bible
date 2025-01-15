# Nmap Commands Cheat Sheet

This cheat sheet contains common Nmap commands categorized for quick reference.

---

## Basic Scans

- **Simple Scan**  
  Perform a basic scan of the target.

  ```bash
  nmap <host>
  ```

- **Verbose Mode**  
  Increase verbosity to view detailed output.

  ```bash
  nmap -v <host>
  ```

- **Increased Verbose Mode**  
  Maximize verbosity for highly detailed scan results.
  ```bash
  nmap -vv <host>
  ```

---

## Port Scans

- **TCP Scan**  
  Perform a SYN (half-open) scan.

  ```bash
  nmap -sS <host>
  ```

- **UDP Scan**  
  Scan UDP ports of the target.

  ```bash
  nmap -sU <host>
  ```

- **All Ports Scan**  
  Scan all available ports on the target.

  ```bash
  nmap -p- <host>
  ```

- **Top 1000 Ports Scan**  
  Scan the 1000 most commonly used ports.
  ```bash
  nmap -p 1-1000 <host>
  ```

---

## Host Discovery

- **Ping Scan**  
  Identify live hosts without performing a full scan.

  ```bash
  nmap -Pn <host>
  ```

- **Host Discovery Without Packets**  
  Skip packet transmission and discover hosts stealthily.

  ```bash
  nmap -sn <network>
  ```

- **Discover Hosts with Open Ports**  
  Detect live hosts with open ports in the network.

  ```bash
  nmap --open <network>
  ```

- **Scan a Range of IP Addresses**  
  Scan multiple IPs within a specified range.
  ```bash
  nmap <start_ip>-<end_ip>
  ```

---

## Advanced Scans

- **Script Scan**  
  Use default scripts to gather additional information.

  ```bash
  nmap -sC <host>
  ```

- **Services and Versions**  
  Detect running services and their versions.

  ```bash
  nmap -sV <host>
  ```

- **Complete Scan**  
  Perform a scan with scripts and version detection.

  ```bash
  nmap -sCV <host>
  ```

- **Operating System Detection**  
  Identify the target's operating system.

  ```bash
  nmap -O <host>
  ```

- **Aggressive Scan**  
  Combine OS detection, version detection, script scanning, and traceroute.
  ```bash
  nmap -A <host>
  ```

---

## Performance and Rate Control

- **Fast Scan**  
  Quickly scan the top 100 ports.

  ```bash
  nmap -T5 -F <host>
  ```

- **Slow Scan**  
  Use low timing to avoid triggering intrusion detection systems.

  ```bash
  nmap -T1 <host>
  ```

- **Set Minimum Packet Rate**  
  Specify a minimum number of packets per second.
  ```bash
  nmap --min-rate 1000 <host>
  ```

---

## Vulnerability Scans

- **Default Vulnerability Scan**  
  Use built-in scripts to check for vulnerabilities.

  ```bash
  nmap --script vuln <host>
  ```

- **Specific Script Scan**  
  Run a particular Nmap script.
  ```bash
  nmap --script <script> <host>
  ```

---

## Reporting and Output

- **Export to XML**  
  Save scan results in XML format.

  ```bash
  nmap -oX output.xml <host>
  ```

- **Web-Friendly XML Export**  
  Save scan results in a web-optimized XML format.

  ```bash
  nmap -oX output_web.xml <host>
  ```

- **Periodic Scan Statistics**  
  Display scan progress every 30 seconds.
  ```bash
  nmap --stats-every 30s <host>
  ```
