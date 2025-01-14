<?php
$data = ["A", "+", "B", "*", "C", "/", "D", "-", "E"];

$left = [null, 0, null, 2, null, 1, null, 6, null];
$right = [null, 3, null, 4, null, 7, null, 8, null];

$root = 5;

function P($T, $data, $left, $right) {
    if ($left[$T] !== null) {
        P($left[$T], $data, $left, $right);
    }
    if ($right[$T] !== null) {
        P($right[$T], $data, $left, $right);
    }
    echo $data[$T] . "\n";
}

P($root, $data, $left, $right);
?>