use strict;
use warnings;
use Time::HiRes qw(time);
use List::Util qw(shuffle);

sub linear_search {
    my ($data, $search_key) = @_;
    foreach my $item (@$data) {
        return 1 if $item == $search_key;
    }
    return 0;
}

sub binary_search {
    my ($data, $search_key) = @_;
    my ($head, $tail) = (0, scalar(@$data) - 1);
    while ($head <= $tail) {
        my $mid_point = int(($head + $tail) / 2);
        if ($data->[$mid_point] == $search_key) {
            return 1;
        } elsif ($data->[$mid_point] > $search_key) {
            $tail = $mid_point - 1;
        } else {
            $head = $mid_point + 1;
        }
    }
    return 0;
}

sub bubble_sort {
    my ($data) = @_;
    my $nlen = scalar(@$data) - 1;
    while (1) {
        my $swap = 0;
        for my $i (0 .. $nlen - 1) {
            if ($data->[$i] > $data->[$i + 1]) {
                @$data[$i, $i + 1] = @$data[$i + 1, $i];
                $swap = 1;
            }
        }
        last unless $swap;
        $nlen--;
    }
    return $data;
}

sub insertion_sort {
    my ($data) = @_;
    for my $i (1 .. @$data - 1) {
        my $key = $data->[$i];
        my $j = $i - 1;
        while ($j >= 0 && $data->[$j] > $key) {
            $data->[$j + 1] = $data->[$j];
            $j--;
        }
        $data->[$j + 1] = $key;
    }
    return $data;
}

sub merge_sort {
    my ($data) = @_;
    return $data if @$data <= 1;
    my $mid = int(@$data / 2);
    my $left = merge_sort([@$data[0 .. $mid - 1]]);
    my $right = merge_sort([@$data[$mid .. @$data - 1]]);
    return merge($left, $right);
}

sub merge {
    my ($left, $right) = @_;
    my @result;
    while (@$left && @$right) {
        if ($left->[0] <= $right->[0]) {
            push @result, shift @$left;
        } else {
            push @result, shift @$right;
        }
    }
    return [@result, @$left, @$right];
}

sub quick_sort {
    my ($data) = @_;
    return $data if @$data <= 1;
    my $pivot = $data->[0];
    my @less = grep { $_ <= $pivot } @$data[1 .. @$data - 1];
    my @greater = grep { $_ > $pivot } @$data[1 .. @$data - 1];
    return [ @{quick_sort(\@less)}, $pivot, @{quick_sort(\@greater)} ];
}

sub get_search_key {
    print "Enter search key: ";
    chomp(my $search_key = <STDIN>);
    return $search_key;
}

sub create_data {
    print "Enter size of data set: ";
    chomp(my $num_items = <STDIN>);
    return [ shuffle(1 .. $num_items * 2) ];
}

sub view_data {
    my ($data) = @_;
    print join(' ', @$data), "\n";
}

sub main {
    my $data = create_data();
    my $temp_data = [@$data];
    my $choice = "";
    while ($choice ne "8") {
        print "1. Linear search\n";
        print "2. Binary search\n";
        print "3. Bubble sort\n";
        print "4. Insertion sort\n";
        print "5. Merge sort\n";
        print "6. View Data\n";
        print "7. Restore original data\n";
        print "8. Quit\n";
        print "9. Quick Sort\n";
        chomp($choice = <STDIN>);
        if ($choice eq "1") {
            my $search_key = get_search_key();
            print linear_search($data, $search_key), "\n";
        } elsif ($choice eq "2") {
            my $search_key = get_search_key();
            print binary_search($data, $search_key), "\n";
        } elsif ($choice eq "3") {
            my $start = time();
            $data = bubble_sort($data);
            my $end = time();
            printf("Total time: %.1f ms\n", ($end - $start) * 1000);
        } elsif ($choice eq "4") {
            my $start = time();
            $data = insertion_sort($data);
            my $end = time();
            printf("Total time: %.1f ms\n", ($end - $start) * 1000);
        } elsif ($choice eq "5") {
            my $start = time();
            $data = merge_sort($data);
            my $end = time();
            printf("Total time: %.1f ms\n", ($end - $start) * 1000);
        } elsif ($choice eq "6") {
            view_data($data);
        } elsif ($choice eq "7") {
            $data = [@$temp_data];
        } elsif ($choice eq "9") {
            my $start = time();
            $data = quick_sort($data);
            my $end = time();
            printf("Total time: %.1f ms\n", ($end - $start) * 1000);
        }
    }
}

main();