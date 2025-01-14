use strict;
use warnings;

# Define the Node package
package Node;
sub new {
    my ($class, $data) = @_;
    my $self = {
        data => $data,
        next => undef,
    };
    bless $self, $class;
    return $self;
}

# Create a linked list
my $head = Node->new(1); # Create the head of the list
$head->{next} = Node->new(2); # Create the first node of the list pointed by the head
$head->{next}->{next} = Node->new(3); # Create the second node of the list

# Linked List
# head -> Node(1) -> Node(2) -> Node(3) -> undef

my $temp = $head;
while ($temp) {
    print $temp->{data}, " ";
    $temp = $temp->{next};
}