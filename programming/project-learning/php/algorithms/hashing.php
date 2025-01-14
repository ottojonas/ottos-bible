<?php
echo "Enter data size: ";
$dataSize = intval(trim(fgets(STDIN)));

$data = [];
$hashTable = array_fill(0, $dataSize, null);

for ($i = 0; $i < $dataSize; $i++) {
    $nameLength = rand(3, 12);
    $tempString = '';
    for ($j = 0; $j < $nameLength; $j++) {
        $char = chr(rand(65, 90));
        $tempString .= $char;
    }
    $data[] = $tempString;
}

print_r($data);
?>