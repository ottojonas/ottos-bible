package PriorityQueue;

use strict;
use warnings;
use Carp;

# Constructor for PriorityQueue
sub new {
    my ($class, $compare) = @_;
    croak "Compare has to be a function" unless ref($compare) eq 'CODE';  # Ensure compare is a function reference
    my $self = {
        heap => [],       # Array to hold the heap elements
        compare => $compare,  # Comparison function to maintain heap order
    };
    bless $self, $class;  # Bless the reference to make it an object of PriorityQueue
    return $self;         # Return the object
}

# Method to get the parent index of a given index
sub get_parent_index {
    my ($self, $index) = @_;
    return int(($index - 1) / 2);  # Calculate and return the parent index
}

# Method to get the left child index of a given index
sub get_left_child_index {
    my ($self, $index) = @_;
    return 2 * $index + 1;  # Calculate and return the left child index
}

# Method to get the right child index of a given index
sub get_right_child_index {
    my ($self, $index) = @_;
    return 2 * $index + 2;  # Calculate and return the right child index
}

# Method to swap two elements in the heap
sub swap {
    my ($self, $index1, $index2) = @_;
    # Swap the elements at index1 and index2
    ($self->{heap}[$index1], $self->{heap}[$index2]) = ($self->{heap}[$index2], $self->{heap}[$index1]);
}