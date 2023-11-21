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
$betthisjson = isset($request->betthisjson) ? $request->betthisjson : "";
$amount = isset($request->amount) ? $request->amount : 0;

// testing stand alone
// $operation = "addUser";
// $email = "john.horton86@gmail.com";
// $pswd = "Ashleigh1!";
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
if ($operation == "makebet") {
  $resparr = makebet($conn, $email, $betthisjson, $amount);
}
// var_dump($resparr);

echo json_encode($resparr);

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
  $sql = "SELECT * FROM users
          WHERE email = '$email' AND pswd = MD5('$pswd')";

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
  $sql = "UPDATE users
            SET pswd = MD5('$pswd'),
            dateupdated = now()
            WHERE email = '$email'";

  if ($conn->query($sql) === TRUE) {
    array_push($resparr, 'success', "reset");
  } else {
    array_push($resparr, 'error', $conn->error);
  }
  
  return $resparr;
}

function makebet($conn, $email, $betthisjson, $amount)
{
  $resparr = array();
  $sql = "INSERT INTO bets (email, betthisjson, amount, datecreated)
			VALUES
			('$email','$betthisjson', $amount, now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "added");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
