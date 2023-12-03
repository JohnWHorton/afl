<?php

$host = 'localhost';
$db = 'afl';
$user = 'john';
$pass = 'john';
$charset = 'utf8mb4';


$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_errno) {
    echo "Failed to connect to MySQL: " . $conn->connect_error;
    exit();
}

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$operation = isset($request->operation) ? $request->operation : "";
$email = isset($request->email) ? $request->email : "";
$pswd = isset($request->pswd) ? $request->pswd : "";
$predictionjson = isset($request->predictionjson) ? $request->predictionjson : "";
$amount = isset($request->amount) ? $request->amount : 0;
$roundnumber = isset($request->roundnumber) ? $request->roundnumber : 1;

// testing stand alone
// $operation = "makeprediction";
// $email = "john.horton86@gmail.com";
// $pswd = "999";
// $roundnumber = 1;

$gamesarray = array();
$sql = "SELECT * FROM games
          WHERE roundnumber = '$roundnumber'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // array_push($resparr, $row);
        array_push($gamesarray, $row);
    }
} else {
    array_push($gamesarray, [$sql]);
}
var_dump($gamesarray);


$betsarray = array();
$sql = "SELECT * FROM bets
          WHERE roundnumber = '$roundnumber'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        array_push($betsarray, json_decode($row["predictionjson"]));
    }
} else {
    array_push($betsarray, [$sql]);
}


var_dump($betsarray);
