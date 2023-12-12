<?php

if (PHP_SAPI === 'cli') {
    $roundnumber = $argv[1];
}
echo $roundnumber;
// $host = 'localhost';
// $db = 'afl';
// $user = 'john';
// $pass = 'john';
// $charset = 'utf8mb4';

$host = '13.49.223.11';
$db = 'afl';
$user = 'aflpools';
$pass = 'V4513john';
$charset = 'utf8mb4';


$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_errno) {
    echo "Failed to connect to MySQL: " . $conn->connect_error;
    exit();
}

$resparr = array();

// $roundnumber = 1;

$predictionsarray = array();
$sql = "SELECT * FROM predictions
          WHERE roundnumber = $roundnumber and correct_count = 6";

// echo $sql . "\n";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // array_push($resparr, $row);
        // array_push($predictionsarray, $row);
        // var_dump($row);
        echo ($row["id"] . "\n");
        echo ($row["email"] . "\n");
        echo ($row["roundnumber"] . "\n");
        echo ($row["amount"] . "\n");
        //    var_dump($row);
    }
} else {
    array_push($predictionsarray, [$sql]);
};
// var_dump($predictionsarray);
// write to winnings table;
