import shlex
import subprocess


def run_commands_from_file(file_path):
    with open(file_path, "r") as file:
        commands = file.readlines()
        for command in commands:
            parsed_command = shlex.split(command.strip())
            subprocess.run(parsed_command)


if __name__ == "__main__":
    run_commands_from_file("file")
