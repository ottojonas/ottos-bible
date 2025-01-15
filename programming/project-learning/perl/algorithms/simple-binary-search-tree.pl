use strict;
use warnings;

# Array representing the data stored in the binary search tree nodes
my @data = ("A", "+", "B", "*", "C", "/", "D", "-", "E");

# Arrays representing the left and right children of each node
my @left = (undef, 0, undef, 2, undef, 1, undef, 6, undef);
my @right = (undef, 3, undef, 4, undef, 7, undef, 8, undef);

# Index of the root node in the @data array
my $root = 5;

# Subroutine to perform a post-order traversal of the binary search tree
sub P {
    my ($T) = @_;
    P($left[$T]) if defined $left[$T];  # Recursively traverse the left subtree
    P($right[$T]) if defined $right[$T];  # Recursively traverse the right subtree
    print $data[$T], "\n";  # Print the data of the current node
}

# Start the post-order traversal from the root node
P($root);