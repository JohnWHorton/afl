<?php

$host = 'localhost';
$db   = 'test';
$user = 'test';
$pass = 'test';
$charset = 'utf8mb4';

$conn = new mysqli($host,$user,$pass,$db);

// Check connection
if ($conn -> connect_errno) {
  echo "Failed to connect to MySQL: " . $conn -> connect_error;
  exit();
} else {
  echo "Connected"."\n";
}


$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$operation = isset($request->operation) ? $request->operation : "loginUser";
$name = isset($request->name) ? $request->name : "John Horton";
$email = isset($request->email) ? $request->email : "john@me.com";
$phoneno = isset($request->phoneno) ? $request->phoneno : "65432199";
$pswd = isset($request->pswd) ? $request->pswd : "booBoo";

$resparr = array();

if ($operation == "addUser") {
  $resparr = addUser($conn, $name, $email, $phoneno, $pswd);
}
if ($operation == "loginUser") {
  $resparr = loginUser($conn, $email, $pswd);
}


mysqli_close($conn);

echo json_encode($resparr);


function addUser($conn, $name, $email, $phoneno, $pswd)
{

  $resparr = array();

  $sql = "INSERT INTO users (name, email, phoneno, pswd) 
			VALUES 
			('$name','$email','$phoneno',MD5('$pswd'))";

  if ($conn->query($sql) === TRUE) {
    array_push($resparr, 'success', $sql);
  } else {
    array_push($resparr, 'error', $sql);
  }
  return $resparr;
}

function loginUser($conn, $email, $pswd)
{
  $resparr = array();
  $sql = "SELECT  name, email, phoneno FROM users
			WHERE email = '$email' AND pswd = MD5('$pswd')";
			
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resparr, $row);
    }
  }
  
  return $resparr;
}

?>