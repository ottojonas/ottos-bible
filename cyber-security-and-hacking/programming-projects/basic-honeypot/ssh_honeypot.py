import getpass
import logging
import socket
import threading
import time
from logging.handlers import RotatingFileHandler
from pathlib import Path

import paramiko
from icecream import ic

# Constants
SSH_BANNER = "SSH-2.0-MySSHServer_1.0"

# get base dir of where user is running honeypy from
base_dir = base_dir = Path(__file__).parent.parent

# source creds_audits.log and cmd_audits.log file path
server_key = base_dir / "honeypotSetup" / "static" / "server.key"
creds_audits_log_local_file_path = (
    base_dir / "honeypotSetup" / "log_files" / "creds_audits.log"
)
cmd_audits_log_local_file_path = (
    base_dir / "honeypotSetup" / "log_files" / "cmd_audits.log"
)

# ssh server host key
private_key_password = getpass.getpass(prompt="enter password for server.key: ")
host_key = paramiko.RSAKey(filename=server_key, password=private_key_password)

# logging format
logging_format = logging.Formatter("%(message)s")

# funnel (catch all) logger
funnel_logger = logging.getLogger("FunnelLogger")
funnel_logger.setLevel(logging.INFO)
funnel_handler = RotatingFileHandler(
    cmd_audits_log_local_file_path, maxBytes=2000, backupCount=5
)
funnel_handler.setFormatter(logging_format)
funnel_logger.addHandler(funnel_handler)

# credentials logger. capture ip addr, username and password
creds_logger = logging.getLogger("CredsLogger")
creds_logger.setLevel(logging.INFO)
creds_handler = RotatingFileHandler(
    creds_audits_log_local_file_path, maxBytes=2000, backupCount=5
)
creds_handler.setFormatter(logging_format)
creds_logger.addHandler(creds_handler)


# establishes options for ssh server
class Server(paramiko.ServerInterface):
    def __init__(self, client_ip, input_username=None, input_password=None):
        self.event = threading.Event()
        self.client_ip = client_ip
        self.input_username = input_username
        self.input_password = input_password
    
    def check_channel_request(self, kind, channelid):
        if kind == "session":
            return paramiko.OPEN_SUCCEEDED

    def get_allowed_auths(self, username):
        return "password"

    def check_auth_password(self, username, password):
        funnel_logger.info(
            f"client {self.client_ip} attempted connection with "
            + f"username: {username}, "
            + f"{password}"
        )
        creds_logger.info(f"{self.client_ip}, {username}, {password}")
        if self.input_username is not None and self.input_password is not None:
            if username == self.input_username and password == self.input_password:
                return paramiko.AUTH_SUCCESSFUL
            else:
                return paramiko.AUTH_FAILED
        else:
            return paramiko.AUTH_SUCCESSFUL

    def check_channel_shell_request(self, channel):
        self.event.set()
        return True

    def check_channel_pty_request(
        self, channel, term, width, height, pixelwidth, pixelheight, modes
    ):
        return True

    def check_channel_exec_request(self, channel, command):
        command = str(command)
        return True


def emulated_shell(channel, client_ip):
    channel.send(b"corporate-jumpbox2$ ")
    command = b""
    while True:
        char = channel.recv(1)
        channel.send(char)
        if not char:
            channel.close()
        command += char

        # emulate common shell commands
        if char == b"\r":
            if command.strip() == b"exit":
                response = b"\n goodbye\n"
                channel.close()

            elif command.strip() == b"pwd":
                response = b"\n" + b"\\usr\\local" + b"\r\n"
                funnel_logger.info(
                    f"command {command.strip()}" + "executed by" f"{client_ip}"
                )

            elif command.strip() == b"whoami":
                response = b"\n" + b"corpuser1" + b"\r\n"
                funnel_logger.info(
                    f"Command {command.strip()}" + "executed by " f"{client_ip}"
                )

            elif command.strip() == b"ls":
                response = b"\n" + b"jumpbox1.conf" + b"\r\n"
                funnel_logger.info(
                    f"Command {command.strip()}" + "executed by " f"{client_ip}"
                )
            elif command.strip() == b"ll":
                response = b"\n" + b"jumpbox1.conf" + b"\r\n"
                funnel_logger.info(
                    f"Command {command.strip()}" + "executed by " f"{client_ip}"
                )

            elif command.strip() == b"cat jumpbox1.conf":
                response = b"\n" + b"Go to deeboodah.com" + b"\r\n"
                funnel_logger.info(
                    f"Command {command.strip()}" + "executed by " f"{client_ip}"
                )

            else:
                response = b"\n" + bytes(command.strip()) + b"\r\n"
                funnel_logger.info(
                    f"Command {command.strip()}" + "executed by " f"{client_ip}"
                )

            channel.send(response)
            channel.send(b"corporate-jumpbox2$ ")
            command = b""


def client_handle(client, addr, username, password, tarpit=False):
    client_ip = addr[0]
    ic(f"{client_ip} connected to the server")
    try:
        # initializes transport object using socket from client connection
        transport = paramiko.Transport(client)
        transport.local_version = SSH_BANNER

        # creates an instance of the SSH server, adds host key to prove identity, starts ssh server
        server = Server(client_ip, input_username=username, input_password=password)
        transport.add_server_key(host_key)
        transport.start_server(server=server)

        # establishes an encrypted tunnel for bidirectional communication between client and server
        channel = transport.accept(100)

        if channel is None:
            ic("no channel opened")

        standard_banner = "welcome"

        try:
            # endless banner -> if tarpit option is passed then send 'endless' ssh banner
            if tarpit:
                endless_banner = standard_banner * 100
                for char in endless_banner:
                    channel.send(char)
                    time.sleep(8)
            
            # standard banner -> send generic welcome banner to impersonate server
            else:
                channel.send(standard_banner)

            # send channel connection to emulated shell for interpritation
            emulated_shell(channel, client_ip=client_ip)
        
        except Exception as error:
            ic(error)
    # generic catch all exception error code
    
    except Exception as error:
        ic(error)

    # once session complete -> close transportation connection
    finally:
        try:
            transport.close()
        except Exception:
            pass
        
        client.close()


def honeypot(address, port, username, password, tarpit=False):
    # open a new socket using TCP | bind to port
    socks = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    socks.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    socks.bind((address, port))
    
    socks.listen(100)

    # debug to see what port is being listened to     
    ic(f"ssh server is listening on port {port}")

    while True:
        try:
            # accept connection from client and address
            client, addr = socks.accept()
            # start new thread to handle client connection
            ssh_honeypot_thread = threading.Thread(
                target=client_handle, args=(client, addr, username, password, tarpit)
            )
            ssh_honeypot_thread.start()

        except Exception as error:
            # catch all exception error code
            ic("could not open new client connection")
            ic(error)
