Collecting workspace information

# AESProject

AESProject is a simple console application that demonstrates the use of the Advanced Encryption Standard (AES) for encrypting and decrypting messages in C#. This project is part of the basic cryptography programming projects.

## Prerequisites

- .NET SDK 8.0 or later

## Setup

1. Required packages:
    ```sh
    dotnet restore
    ```

## Build and Run

To build and run the project, use the following commands:

```sh
dotnet build
dotnet run
```

## Usage

When you run the application, it will prompt you to enter a message that needs to be encrypted. The application will then encrypt the message using AES and display the encrypted message.

## Project Structure

- 

AESProject.csproj

: Project file containing project configuration and dependencies.
- 

Program.cs

: Main program file containing the AES encryption logic.
- `bin/`: Directory containing the compiled binaries.
- `obj/`: Directory containing temporary object files and build artifacts.

## Dependencies

The project uses the following NuGet packages:

- 

System.Security.Cryptography.Algorithms

 (Version 4.3.1)
- 

System.Security.Cryptography.Primitives

 (Version 4.3.0)

## Notes

The Advanced Encryption Standard (AES) is a widely used encryption algorithm trusted by the U.S. Government and numerous organizations. It is highly efficient in 128-bit form and also supports 192 and 256-bit keys for more secure encryption.

For more information on AES, refer to the notes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contributing

Contributions are welcome! Please see the CONTRIBUTING.md file for more information.

---

Feel free to modify this README to better suit your project's needs.