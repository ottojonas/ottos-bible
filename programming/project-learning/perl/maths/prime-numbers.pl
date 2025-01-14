use strict;
use warnings;

print "range: ";
my $p = <STDIN>;
chomp($p);

# Initialize an array of boolean values representing primality, initially all set to "T" (True)
my @primes = ("T") x $p;

# Iterate through each number in the range starting from 2 to p-1
for my $possiblePrime (2 .. $p - 1) {
    # If the number is still marked as prime
    if ($primes[$possiblePrime] eq "T") {
        # Mark all multiples of the number as not prime ("F")
        for (my $multiple = $possiblePrime * 2; $multiple < $p; $multiple += $possiblePrime) {
            $primes[$multiple] = "F";
        }
    }
}

# Create a list of prime numbers by filtering indices marked as "T" (True) and greater than 1
my @primeNumbers = grep { $primes[$_] eq "T" && $_ > 1 } 0 .. $p - 1;

# Print the list of prime numbers
print "@primeNumbers\n";