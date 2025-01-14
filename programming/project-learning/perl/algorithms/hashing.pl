use strict;
use warnings;
use List::Util 'shuffle';

print "Enter data size: ";
my $dataSize = <STDIN>;
chomp($dataSize);

my @data;
my @hashTable = (undef) x $dataSize;

for (my $i = 0; $i < $dataSize; $i++) {
    my $nameLength = int(rand(10)) + 3;
    my $tempString = '';
    for (my $j = 0; $j < $nameLength; $j++) {
        my $char = chr(int(rand(26)) + 65);
        $tempString .= $char;
    }
    push @data, $tempString;
}

print "@data\n";