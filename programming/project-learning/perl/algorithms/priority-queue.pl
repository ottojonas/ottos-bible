package PriorityQueue;

use strict;
use warnings;
use Carp;

sub new {
    my ($class, $compare) = @_;
    croak "Compare has to be a function" unless ref($compare) eq 'CODE';
    my $self = {
        heap => [],
        compare => $compare,
    };
    bless $self, $class;
    return $self;
}

sub get_parent_index {
    my ($self, $index) = @_;
    return int(($index - 1) / 2);
}

sub get_left_child_index {
    my ($self, $index) = @_;
    return 2 * $index + 1;
}

sub get_right_child_index {
    my ($self, $index) = @_;
    return 2 * $index + 2;
}

sub swap {
    my ($self, $index1, $index2) = @_;
    ($self->{heap}[$index1], $self->{heap}[$index2]) = ($self->{heap}[$index2], $self->{heap}[$index1]);
}

1;