<?php

$host = 'localhost';
$db   = 'afl';
$user = 'john';
$pass = 'john';
$charset = 'utf8mb4';

$conn = new mysqli($host,$user,$pass,$db);

// Check connection
if ($conn -> connect_errno) {
  echo "Failed to connect to MySQL: " . $conn -> connect_error;
  exit();
} 


$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$operation = isset($request->operation) ? $request->operation : "";
$email = isset($request->email) ? $request->email : "";
$pswd = isset($request->pswd) ? $request->pswd : "";

// testing stand alone
// $operation = "resetPassword";
// $email = "john.horton86@gmail.com";
// $pswd = "Ashleigh1!";
//
$resparr = array();

if ($operation == "addUser") {
  $resparr = addUser($conn,  $email,  $pswd);
}
if ($operation == "loginUser") {
  $resparr = loginUser($conn, $email, $pswd);
}
if ($operation == "resetPassword") {
  $resparr = resetPassword($conn, $email, $pswd);
}


// var_dump($resparr);
echo json_encode($resparr);


// function addUser($conn, $name, $email, $phoneno, $pswd)
function addUser($conn, $email, $pswd)
{

  $resparr = array();

//   $sql = "INSERT INTO users (name, email, phoneno, pswd) 
  $sql = "INSERT INTO users (email, pswd, datecreated, dateupdated) 
			VALUES 
			('$email',MD5('$pswd'), now(), now())";

  if ($conn->query($sql) === TRUE) {
    array_push($resparr, 'success', $sql);
  } else {
    array_push($resparr, 'error', $sql);
  }
  return $resparr;
}

function loginUser($conn, $email, $pswd)
{
  $resp = array();
  $sql = "SELECT  email FROM users
			WHERE email = '$email' AND pswd = MD5('$pswd')";
	// echo $sql;

  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resp, $row);
    }
  }
  
  return $resp;
}
function resetPassword($conn, $email, $pswd)
{
  $resp = array();
  $sql = "UPDATE users 
            SET pswd = MD5('$pswd'), 
            dateupdated = now() 
            WHERE email = '$email'";
	// echo $sql;

  $result = $conn->query($sql);
  
  return $resp;
}


?>