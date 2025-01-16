import socket
import threading
import time

import paramiko
from icecream import ic


# define simple server interface
class SimpleSSHServer(paramiko.ServerInterface):
    def check_channel_request(self, kind: str, chanid: int) -> int:
        if kind == "session":
            return paramiko.OPEN_SECCEEDED
        return paramiko.OPEN_FAILED_ADMINISTRATIVELY_PROHIBITED

    def check_auth_password(self, username: str, password: str) -> int:
        if username == "user" and password == "pass":
            return paramiko.AUTH_SUCCESSFUL
        return paramiko.AUTH_FAILED

    def check_channel_pty_request(
        self,
        channel: paramiko.Channel,
        term: bytes,
        width: int,
        height: int,
        pixelwidth: int,
        pixelheight: int,
        modes: bytes,
    ) -> bool:
        return True

    def check_channel_shell_request(self, channel: paramiko.Channel) -> bool:
        return True


def handle_client(client_socket):
    transport = paramiko.Transport(client_socket)
    transport.add_server_key(host_key)
    server = SimpleSSHServer()

    try:
        transport.start_server(server=server)
        chan = transport.accept(20)
        if chan is None:
            ic("no channel")
            return
        standard = "welcome to the simple SSH server!\n"
        multi = standard * 2
        for char in multi:
            chan.send(char)
            time.sleep(0.5)

        chan.send("welcome to the simple ssh server!\n")
        while True:
            command = chan.recv(1024).decode("utf-8")
            if command.lower() == "exit":
                chan.send("goodbye!\n")
                break
            chan.send(f"received: {command}\n")
        chan.close()
    except Exception as e:
        ic(f"exception: {e}")
    finally:
        transport.close()


def start_server(host="0.0.0.0", port=2223):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_socket.bind((host, port))
    server_socket.listen(100)

    ic(f"listening on {host}:{port}")

    while True:
        client_socket, addr = server_socket.accept()
        ic(f"accepted connection from {addr[0]}:{addr[1]}")
        client_handler = threading.Thread(target=handle_client, args=(client_socket,))
        client_handler.start()


if __name__ == "__main__":
    # generate rsa key for ssh server
    host_key = paramiko.RSAKey(filename="server.key")
    start_server(port=2222)  # non privledged port for testing
