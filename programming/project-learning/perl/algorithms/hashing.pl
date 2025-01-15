use strict;
use warnings;
use List::Util 'shuffle';  # Import the shuffle function from List::Util

print "Enter data size: ";
my $dataSize = <STDIN>;  # Read the data size from user input
chomp($dataSize);        # Remove the newline character from the input

my @data;                # Array to store generated data
my @hashTable = (undef) x $dataSize;  # Initialize hash table with undefined values

# Generate random strings and store them in @data
for (my $i = 0; $i < $dataSize; $i++) {
    my $nameLength = int(rand(10)) + 3;  # Generate a random length between 3 and 12
    my $tempString = '';                 # Temporary string to hold the generated name
    for (my $j = 0; $j < $nameLength; $j++) {
        my $char = chr(int(rand(26)) + 65);  # Generate a random uppercase letter
        $tempString .= $char;                # Append the letter to the temporary string
    }
    push @data, $tempString;  # Add the generated string to the @data array
}

print "@data\n";  # Print the generated data