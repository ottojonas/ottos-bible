The Advanced Encryption Standard (AES) is the algorithm trusted as the standard by the U.S. Government and numerous organizations and is also found in Arcserve Unified Data Protection (UDP) software. Although it is highly efficient in 128-bit form, AES also uses keys of 192 and 256 bits for heavy-duty encryption purposes.

AES is largely considered impervious to all attacks, except for brute force, which attempts to decipher messages using all possible combinations in the 128, 192, or 256-bit cipher.


sudo pacman -Syu
sudo pacman -S dotnet-sdk

dotnet new console -n AESProject
cd AESProject

dotnet add package System.Security.Cryptography.Algorithms
dotnet add package System.Security.Cryptography.Primitives

dotnet run 