use strict;
use warnings;

my @data = ("A", "+", "B", "*", "C", "/", "D", "-", "E");

my @left = (undef, 0, undef, 2, undef, 1, undef, 6, undef);
my @right = (undef, 3, undef, 4, undef, 7, undef, 8, undef);

my $root = 5;

sub P {
    my ($T) = @_;
    P($left[$T]) if defined $left[$T];
    P($right[$T]) if defined $right[$T];
    print $data[$T], "\n";
}

P($root);