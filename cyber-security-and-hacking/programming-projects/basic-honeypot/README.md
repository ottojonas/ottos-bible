Collecting workspace information

# Honeypot Project

This project is a honeypot implementation that captures and logs unauthorized access attempts to SSH and HTTP services. It includes a web dashboard to visualize the captured data.

## Project Structure

```
.gitignore
assets/
dashboard_data_parser.py
honeypy.py
log_files/
    baseline_ssh.py
    cmd_audits.log
    creds_audits.log
    http_audit.log
    http_audits.log
notes.md
public.env
ssh_honeypot.py
systemd/
    honeypy.service
templates/
    dashboard.html
    index.html
    wp-admin.html
web_app.py
web_honeypot.py
```

## Files

- **dashboard_data_parser.py**: Contains functions to parse log files and generate data for the dashboard.
- **honeypy.py**: Main script to run the honeypot.
- **log_files/**: Directory containing log files and a baseline SSH server script.
- **public.env**: Environment variables configuration.
- **ssh_honeypot.py**: SSH honeypot implementation.
- **systemd/honeypy.service**: Systemd service configuration for running the honeypot.
- **templates/**: HTML templates for the web dashboard.
- **web_app.py**: Web application to visualize the captured data.
- **web_honeypot.py**: HTTP honeypot implementation.

## Setup

1. **Install Dependencies**:
    ```sh
    pip install -r requirements.txt
    ```

2. **Generate SSH Server Key**:
    ```sh
    ssh-keygen -t rsa -b 2048 -f server.key
    ```

3. **Configure Environment Variables**:
    Edit 

public.env

 to set the required environment variables.

4. **Run the Honeypot**:
    ```sh
    python honeypy.py -a <address> -p <port> -s
    ```

## Usage

- **SSH Honeypot**:
    ```sh
    python honeypy.py -a <address> -p <port> -s
    ```

- **HTTP Honeypot**:
    ```sh
    python honeypy.py -a <address> -p <port> -wh
    ```

- **Web Dashboard**:
    ```sh
    python web_app.py
    ```

## Systemd Service

To run the honeypot as a systemd service, copy honeypy.service to `/etc/systemd/system/` and enable the service:

```sh
sudo systemctl enable honeypy.service
sudo systemctl start honeypy.service
```
