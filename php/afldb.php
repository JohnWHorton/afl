<?php

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
  header('Access-Control-Allow-Origin: *');
  header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS');
  header('Access-Control-Allow-Headers: token, Content-Type');
  header('Access-Control-Max-Age: 1728000');
  header('Content-Length: 0');
  header('Content-Type: text/plain');
  die();
}

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

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

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$operation = isset($request->operation) ? $request->operation : "";
$email = isset($request->email) ? $request->email : "";
$pswd = isset($request->pswd) ? $request->pswd : "";
$predictthisjson = isset($request->predictthisjson) ? $request->predictthisjson : "";
$amount = isset($request->amount) ? $request->amount : 0;
$roundnumber = isset($request->roundnumber) ? $request->roundnumber : 0;
$resultthisjson = isset($request->resultthisjson) ? $request->resultthisjson : "";
$subject = isset($request->subject) ? $request->subject : "";
$body = isset($request->body) ? $request->body : "";

// testing stand alone
// $operation = "rounds";
// $email = "john.horton86@gmail.com";
// $pswd = "123";
// $amount = 66;
// $roundnumber = 1;
//

$resparr = array();

if ($operation == "addUser") {
  $resparr = addUser($conn, $email, $pswd);
}
if ($operation == "loginUser") {
  $resparr = loginUser($conn, $email, $pswd);
}
if ($operation == "resetPassword") {
  $resparr = resetPassword($conn, $email, $pswd);
}
if ($operation == "getPredictions") {
  $resparr = getPredictions($conn, $email, $roundnumber);
}
if ($operation == "getResults") {
  $resparr = getresults($conn, $email, $roundnumber);
}
if ($operation == "makeprediction") {
  $resparr = makeprediction($conn, $email, $roundnumber, $predictthisjson, $amount);
}
if ($operation == "deposit") {
  $resparr = deposit($conn, $email, $amount);
}
if ($operation == "saveemail") {
  $resparr = saveemail($conn, $email, $subject, $body);
}
if ($operation == "withdrawalrequest") {
  $resparr = withdrawalrequest($conn, $email, $amount);
}
if ($operation == "withdrawalscompleted") {
  $resparr = withdrawalscompleted($conn, $email, $amount);
}
if ($operation == "winnings") {
  $resparr = winnings($conn, $email, $amount);
}
if ($operation == "rounds") {
  $resparr = rounds($conn);
}
if ($operation == "games") {
  $resparr = games($conn, $roundnumber);
}
if ($operation == "prizepool") {
  $resparr = prizepool($conn, $roundnumber);
}
if ($operation == "transactionhistory") {
  $resparr = transactionhistory($conn, $email);
}
// var_dump($resparr);
if ($operation == "loginUser" || $operation == "makeprediction" || $operation == "deposit" || $operation == "withdrawalrequest" || $operation == "withdrawalscompleted" || $operation == "winnings") {
  $r = array();
  $r = transhistory($conn, $email);
  $resparr["trans-history"] = $r;
}
echo json_encode($resparr);
function rounds($conn)
{
  $resparr = array();
  $sql = "SELECT * FROM rounds";

  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resparr, $row);
    }
  } else {
    array_push($resparr, [$sql]);
  }

  for ($i = 1; $i < 25; $i++) {
    $sql = "UPDATE `rounds` SET `no_of_predictions` = (SELECT count(*) FROM predictions where predictions.roundnumber = $i), `prize_pool` = (SELECT IFNULL(sum(amount),0) FROM predictions where predictions.roundnumber = $i) where roundnumber = $i";
    $result = $conn->query($sql);
  }
  
  return $resparr;
}
function prizepool($conn, $roundnumber)
{
  $resparr = array();

  $sql = "UPDATE `rounds` SET `no_of_predictions` = (SELECT count(*) FROM predictions where predictions.roundnumber = $roundnumber), `prize_pool` = (SELECT IFNULL(sum(amount),0) FROM predictions where predictions.roundnumber = $roundnumber) where roundnumber = $roundnumber";

  $sql = "SELECT IFNULL(sum(amount),0) as prizepoolamt FROM predictions where predictions.roundnumber = " . $roundnumber;

  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resparr, $row);
    }
  } else {
    array_push($resparr, [$sql]);
  }

  return $resparr;
}
function games($conn, $roundnumber)
{
  $resparr = array();
  $sql = "SELECT * FROM games
          WHERE roundnumber = '$roundnumber'";

  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resparr, $row);
    }
  } else {
    array_push($resparr, [$sql]);
  }

  return $resparr;
}
function addUser($conn, $email, $pswd)
{

  $resparr = array();

  $sql = "SELECT email from users WHERE email = '" . $email . "'";

  $result = $conn->query($sql);

  // echo ("num-rows" . $result->num_rows . "\n");
  if ($result->num_rows > 0) {
    array_push($resparr, 'error', 'exists');
    return $resparr;
  }

  $sql = "INSERT INTO users (email, pswd, datecreated, dateupdated)
			VALUES
			('$email',MD5('$pswd'), now(), now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "added");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
function loginUser($conn, $email, $pswd)
{
  $resparr = array();
  $sql = "SELECT * FROM users WHERE email = '$email' AND pswd = MD5('$pswd')";
  // echo $sql."\n";

  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resparr, $row);
    }
  } else {
    array_push($resparr, 'error', $sql);
    return $resparr;
  }

  return $resparr;
}
function transhistory($conn, $email)
{
  $resparr = array();

  $sql = "SELECT date_format(`date`, '%Y-%m-%d %H:%i:%S') as date, transtype, amount FROM `trans_history` WHERE `email` = '$email' ORDER BY date desc";

  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resparr, $row);
    }
  }

  return $resparr;
}
function resetPassword($conn, $email, $pswd)
{
  $resparr = array();
  $sql = "UPDATE users SET pswd = MD5('$pswd'), dateupdated = now() WHERE email = '$email'";

  if ($conn->query($sql) === TRUE) {
    array_push($resparr, 'success', "reset");
  } else {
    array_push($resparr, 'error', $conn->error);
  }

  return $resparr;
}
function makeprediction($conn, $email, $roundnumber, $predictthisjson, $amount)
{
  $resparr = array();
  $sql = "INSERT INTO predictions (email, roundnumber, predictthisjson, amount, datecreated) VALUES ('$email','$roundnumber','$predictthisjson', $amount, now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "added");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
function getPredictions($conn, $email, $roundnumber)
{
  $resparr = array();
  $sql = "SELECT * FROM predictions WHERE email = '$email' AND roundnumber = $roundnumber ORDER BY id desc";

  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resparr, $row);
      // array_push($resparr, $sql);
    }
  } else {
    array_push($resparr, []);
  }

  return $resparr;
}
function getResults($conn, $email, $roundnumber)
{
  $resparr = array();

  $sql = "SELECT * FROM results WHERE email = '$email' AND roundnumber = $roundnumber ORDER BY predictionid, id";

  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resparr, $row);
    }
  } else {
    array_push($resparr, []);
  }

  return $resparr;
}
function deposit($conn, $email, $amount)
{
  $resparr = array();
  $sql = "INSERT INTO deposits (email, amount, datecreated) VALUES ('$email','$amount', now())";
  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "success");
  } else {
    array_push($resparr, 'error', $sql);
  }
  return $resparr;
}

function saveemail($conn, $email, $subject, $body)
{
  $resparr = array();
  $sql = "INSERT INTO emails(email, `subject`, body, datecreated) VALUES ('$email','$subject', '$body', now())";
  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "success");
  } else {
    array_push($resparr, 'error', $sql);
  }
  return $resparr;
}
//
function withdrawalrequest($conn, $email, $amount)
{

  $resparr = array();

  $sql = "INSERT INTO withdrawalrequests (email, amount, datecreated) VALUES ('$email','$amount', now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "success");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
function withdrawalscompleted($conn, $email, $amount)
{

  $resparr = array();

  $sql = "INSERT INTO withdrawalscompleted (email, amount, datecreated) VALUES ('$email','$amount',  now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "success");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
function winnings($conn, $email, $amount)
{

  $resparr = array();

  $sql = "INSERT INTO winnings (email, amount, datecreated) VALUES ('$email','$amount',  now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "success");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
