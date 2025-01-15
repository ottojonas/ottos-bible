use strict;
use warnings;
use Time::HiRes qw(time);  # Import high-resolution time functions
use List::Util qw(shuffle);  # Import the shuffle function

# Linear search algorithm
sub linear_search {
    my ($data, $search_key) = @_;
    foreach my $item (@$data) {
        return 1 if $item == $search_key;  # Return 1 if the search key is found
    }
    return 0;  # Return 0 if the search key is not found
}

# Binary search algorithm
sub binary_search {
    my ($data, $search_key) = @_;
    my ($head, $tail) = (0, scalar(@$data) - 1);
    while ($head <= $tail) {
        my $mid_point = int(($head + $tail) / 2);
        if ($data->[$mid_point] == $search_key) {
            return 1;  # Return 1 if the search key is found
        } elsif ($data->[$mid_point] > $search_key) {
            $tail = $mid_point - 1;  # Search in the left half
        } else {
            $head = $mid_point + 1;  # Search in the right half
        }
    }
    return 0;  # Return 0 if the search key is not found
}

# Bubble sort algorithm
sub bubble_sort {
    my ($data) = @_;
    my $nlen = scalar(@$data) - 1;
    while (1) {
        my $swap = 0;
        for my $i (0 .. $nlen - 1) {
            if ($data->[$i] > $data->[$i + 1]) {
                @$data[$i, $i + 1] = @$data[$i + 1, $i];  # Swap elements
                $swap = 1;
            }
        }
        last unless $swap;  # Exit if no swaps were made
        $nlen--;
    }
    return $data;
}

# Insertion sort algorithm
sub insertion_sort {
    my ($data) = @_;
    for my $i (1 .. @$data - 1) {
        my $key = $data->[$i];
        my $j = $i - 1;
        while ($j >= 0 && $data->[$j] > $key) {
            $data->[$j + 1] = $data->[$j];  # Shift elements to the right
            $j--;
        }
        $data->[$j + 1] = $key;  # Insert the key in the correct position
    }
    return $data;
}

# Merge sort algorithm
sub merge_sort {
    my ($data) = @_;
    return $data if @$data <= 1;  # Base case: array with 0 or 1 element
    my $mid = int(@$data / 2);
    my $left = merge_sort([@$data[0 .. $mid - 1]]);  # Sort the left half
    my $right = merge_sort([@$data[$mid .. @$data - 1]]);  # Sort the right half
    return merge($left, $right);  # Merge the sorted halves
}

# Merge function for merge sort
sub merge {
    my ($left, $right) = @_;
    my @result;
    while (@$left && @$right) {
        if ($left->[0] <= $right->[0]) {
            push @result, shift @$left;  # Add the smaller element to the result
        } else {
            push @result, shift @$right;  # Add the smaller element to the result
        }
    }
    return [@result, @$left, @$right];  # Add any remaining elements
}

# Quick sort algorithm
sub quick_sort {
    my ($data) = @_;
    return $data if @$data <= 1;  # Base case: array with 0 or 1 element
    my $pivot = $data->[0];
    my @less = grep { $_ <= $pivot } @$data[1 .. @$data - 1];  # Elements less than or equal to pivot
    my @greater = grep { $_ > $pivot } @$data[1 .. @$data - 1];  # Elements greater than pivot
    return [ @{quick_sort(\@less)}, $pivot, @{quick_sort(\@greater)} ];  # Recursively sort and combine
}

# Function to get the search key from user input
sub get_search_key {
    print "Enter search key: ";
    chomp(my $search_key = <STDIN>);
    return $search_key;
}

# Function to create a data set of random numbers
sub create_data {
    print "Enter size of data set: ";
    chomp(my $num_items = <STDIN>);
    return [ shuffle(1 .. $num_items * 2) ];  # Generate and shuffle the data set
}

# Function to view the data set
sub view_data {
    my ($data) = @_;
    print join(' ', @$data), "\n";  # Print the data set
}

# Main function to run the program
sub main {
    my $data = create_data();  # Create the initial data set
    my $temp_data = [@$data];  # Make a copy of the original data
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
            $data = [@$temp_data];  # Restore the original data
        } elsif ($choice eq "9") {
            my $start = time();
            $data = quick_sort($data);
            my $end = time();
            printf("Total time: %.1f ms\n", ($end - $start) * 1000);
        }
    }
}

main();  # Run the main function