## Nmap Commands

#### Simple Scan

```bash
nmap <host>
```

#### Verbose Mode

```bash
nmap -v <host>
```

#### Increased Verbose Mode

```bash
nmap -vv <host>
```

#### TCP Scan

```bash
nmap -sS <host>
```

#### UDP Scan

```bash
nmap -sU <host>
```

#### Scan Without Sending Packets

```bash
nmap -sh <network>
```

#### Host Discovery

```bash
nmap sp <network>
```

#### Host with Open Ports

```bash
nmap-open <network>
```

#### Ping Scan

```bash
nmap -Pn <host>
```

#### Range of IP Addresses

```bash
nmap <start_ip>-<end_ip>
```

#### All Ports

```bash
nmap -p <host>
```

#### 1000 Most Common Ports

```bash
nmap -p 1-1000 <host>
```

#### Script Scan

```bash
nmap -sC <host>
```

#### Services and Versions

```bash
nmap -sV <host>
```

#### Complete Scan

```bash
nmap -sCV <host>
```

#### Operating Systems

```bash
nmap -O <host>
```

#### Operating Systems and Services

```bash
nmap -A <host>
```

#### Fast Scan of 100 Ports

```bash
nmap -T5-F <host>
```

#### Slow Scan (avoid IDS)

```bash
nmap -T1 <host>
```

#### Vulnerability Scan

```bash
nmap-script vuln <host>
```

#### Use Specific Scripts

```bash
nmap-script <script> <host>
```

#### Statistics Returned Every 30 Seconds

```bash
nmap-stats-every 30s <host>
```

#### Minimum Packet Rate

```bash
nmap-min-rate 1000 <host>
```

#### Top 20 Most Common Ports

```bash
nmap-top-ports 20 <host>
```

#### Export in XML

```bash
nmao -oX output.xml <host>
```

#### Export in Web XML

```bash
nmap -webxml <host>
```
