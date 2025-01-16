import shlex
import subprocess

# Function to run commands from a file
def run_commands_from_file(file_path):
    # Open the file containing the commands
    with open(file_path, "r") as file:
        # Read all lines (commands) from the file
        commands = file.readlines()
        # Iterate over each command
        for command in commands:
            # Parse the command into a list of arguments
            parsed_command = shlex.split(command.strip())
            # Execute the parsed command
            subprocess.run(parsed_command)

# If this script is run directly, execute the function with "file" as the argument
if __name__ == "__main__":
    run_commands_from_file("file")