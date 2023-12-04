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
$roundnumber = isset($request->roundnumber) ? $request->roundnumber : 0;

// testing stand alone
$operation = "makeprediction";
// $email = "john.horton86@gmail.com";
// $pswd = "999";
$roundnumber = 1;
$predictionjson = '[{"id":"2","roundid":"955","roundnumber":"1","roundname":"Round 1","gameid":"5899","utcStartTime":"2024-03-14T08:30:00.000+0000","hometeamid":"5","hometeamname":"Carlton","hometeamnickname":"Blues","awayteamid":"16","awayteamname":"Richmond","awayteamnickname":"Tigers","completed":"0","result":"","checked":true,"winname":"Richmond"},{"id":"3","roundid":"955","roundnumber":"1","roundname":"Round 1","gameid":"5900","utcStartTime":"2024-03-14T08:30:00.000+0000","hometeamid":"3","hometeamname":"Collingwood","hometeamnickname":"Magpies","awayteamid":"13","awayteamname":"Sydney Swans","awayteamnickname":"Swans","completed":"0","result":"","checked":true,"winname":"Sydney Swans"},{"id":"4","roundid":"955","roundnumber":"1","roundname":"Round 1","gameid":"5901","utcStartTime":"2024-03-14T08:30:00.000+0000","hometeamid":"12","hometeamname":"Essendon","hometeamnickname":"Bombers","awayteamid":"9","awayteamname":"Hawthorn","awayteamnickname":"Hawks","completed":"0","result":"","checked":true,"winname":"Hawthorn"},{"id":"5","roundid":"955","roundnumber":"1","roundname":"Round 1","gameid":"5902","utcStartTime":"2024-03-14T08:30:00.000+0000","hometeamid":"15","hometeamname":"GWS Giants","hometeamnickname":"Giants","awayteamid":"6","awayteamname":"North Melbourne","awayteamnickname":"Kangaroos","completed":"0","result":"","checked":true,"winname":"North Melbourne"},{"id":"6","roundid":"955","roundnumber":"1","roundname":"Round 1","gameid":"5904","utcStartTime":"2024-03-14T08:30:00.000+0000","hometeamid":"10","hometeamname":"Geelong Cats","hometeamnickname":"Cats","awayteamid":"11","awayteamname":"St Kilda","awayteamnickname":"Saints","completed":"0","result":"","checked":true,"winname":"Geelong Cats"},{"id":"7","roundid":"955","roundnumber":"1","roundname":"Round 1","gameid":"5903","utcStartTime":"2024-03-14T08:30:00.000+0000","hometeamid":"4","hometeamname":"Gold Coast Suns","hometeamnickname":"Suns","awayteamid":"1","awayteamname":"Adelaide Crows","awayteamnickname":"Crows","completed":"0","result":"","checked":true,"winname":"Gold Coast Suns"}]';
//
for ($i = 1; $i < 10; $i++) {
  $email = "testuser".$i."@afltest.com";
    $amount = 20;
//   $pswd = "999";
  $resparr = makeprediction($conn, $email, $roundnumber, $predictionjson, $amount);
}


$resparr = array();


if ($operation == "makeprediction") {
  $resparr = makeprediction($conn, $email, $roundnumber, $predictionjson, $amount);
}

// var_dump($resparr);

echo json_encode($resparr);


function makeprediction($conn, $email, $roundnumber, $predictionjson, $amount)
{
  $resparr = array();
  $sql = "INSERT INTO bets (email, roundnumber, predictionjson, amount, datecreated) VALUES ('$email','$roundnumber', '$predictionjson', $amount, now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "added");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
