<?php
echo "Enter op1: ";
$op1 = intval(trim(fgets(STDIN)));

echo "Enter op2: ";
$op2 = intval(trim(fgets(STDIN)));

$ans = 0;

while ($op1 > 0) {
    if ($op1 % 2 != 0) {
        $ans += $op2;
        echo "$ans\n";
    }

    $op1 = intdiv($op1, 2);
    $op2 *= 2;

    echo "$op1 $op2\n";
}

echo "The answer is: $ans\n";
?>