package CircularQueue;

# Constructor for CircularQueue
sub new {
    my ($class, $maxSize) = @_;
    # Initialize the queue with undefined values, set maxSize, head, and tail
    my $self = {
        queue => [(undef) x $maxSize],  # Array to hold queue elements
        maxSize => $maxSize,            # Maximum size of the queue
        head => -1,                     # Index of the front element
        tail => -1                      # Index of the rear element
    };
    bless $self, $class;  # Bless the reference to make it an object of CircularQueue
    return $self;         # Return the object
}

# Method to add an element to the queue
sub enqueue {
    my ($self, $data) = @_;
    # Check if the queue is full
    if (($self->{tail} + 1) % $self->{maxSize} == $self->{head}) {
        print "Circular Queue is full\n";
    # If the queue is empty, initialize head and tail to 0 and add the element
    } elsif ($self->{head} == -1) {
        $self->{head} = 0;
        $self->{tail} = 0;
        $self->{queue}[$self->{tail}] = $data;
    # Otherwise, add the element to the next position and update tail
    } else {
        $self->{tail} = ($self->{tail} + 1) % $self->{maxSize};
        $self->{queue}[$self->{tail}] = $data;
    }
}

# Method to remove an element from the queue
sub dequeue {
    my ($self) = @_;
    # Check if the queue is empty
    if ($self->{head} == -1) {
        print "Circular Queue is empty\n";
        return undef;
    # If there is only one element, reset head and tail to -1 and return the element
    } elsif ($self->{head} == $self->{tail}) {
        my $temp = $self->{queue}[$self->{head}];
        $self->{head} = -1;
        $self->{tail} = -1;
        return $temp;
    # Otherwise, remove the front element and update head
    } else {
        my $temp = $self->{queue}[$self->{head}];
        $self->{head} = ($self->{head} + 1) % $self->{maxSize};
        return $temp;
    }
}