package CircularQueue;

sub new {
    my ($class, $maxSize) = @_;
    my $self = {
        queue => [(undef) x $maxSize],
        maxSize => $maxSize,
        head => -1,
        tail => -1
    };
    bless $self, $class;
    return $self;
}

sub enqueue {
    my ($self, $data) = @_;
    if (($self->{tail} + 1) % $self->{maxSize} == $self->{head}) {
        print "Circular Queue is full\n";
    } elsif ($self->{head} == -1) {
        $self->{head} = 0;
        $self->{tail} = 0;
        $self->{queue}[$self->{tail}] = $data;
    } else {
        $self->{tail} = ($self->{tail} + 1) % $self->{maxSize};
        $self->{queue}[$self->{tail}] = $data;
    }
}

sub dequeue {
    my ($self) = @_;
    if ($self->{head} == -1) {
        print "Circular Queue is empty\n";
        return undef;
    } elsif ($self->{head} == $self->{tail}) {
        my $temp = $self->{queue}[$self->{head}];
        $self->{head} = -1;
        $self->{tail} = -1;
        return $temp;
    } else {
        my $temp = $self->{queue}[$self->{head}];
        $self->{head} = ($self->{head} + 1) % $self->{maxSize};
        return $temp;
    }
}