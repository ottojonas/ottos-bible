<?php
echo "Enter a number: ";
$number = intval(trim(fgets(STDIN)));

while ($number != 1) {
    if ($number % 2 == 0) {
        $number = intdiv($number, 2);
    } else {
        $number = $number * 3 + 1;
    }
    echo "$number\n";
}
?>