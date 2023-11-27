<?php

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

/*
calc balance
SELECT email, sum(dep) , sum(withd) , (sum(dep) - sum(withd)) bal  FROM `balance`
group by email

SELECT sum(`deposit_amt`), sum(`request_amt`), sum(`completed_amt`),
(sum(`deposit_amt`)-sum(`request_amt`)-sum(`completed_amt`)) as balance 
FROM `transaction_history` 
group by email;

select * 
FROM transaction_history
WHERE email= "john.horton86@gmail.com";

drop view transaction_history;

create view transaction_history as
SELECT `email` AS `email`, `amount` AS `deposit_amt`, 0 AS `request_amt`, 0 AS `completed_amt`,`datecreated` 
FROM `deposits` 
union 
SELECT `email` AS `email`, 0 AS `deposit_amt`, `amount` AS `request_amt`, 0 AS `completed_amt`,`datecreated` 
FROM `withdrawalrequests` 
union 
SELECT `email` AS `email`, 0 AS `deposit_amt`, 0 AS `request_amt`, `amount` AS `completed_amt`,`datecreated` 
FROM `withdrawalcompleted`

*/
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
$roundnumber = isset($request->roundnumber) ? $request->roundnumber : 0;

// testing stand alone
// $operation = "games";
// $email = "john.horton86@gmail.com";
// $pswd = "Ashleigh1!";
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
if ($operation == "makebet") {
  $resparr = makebet($conn, $email, $betthisjson, $amount);
}
if ($operation == "deposit") {
  $resparr = deposit($conn, $email, $amount);
}
if ($operation == "withdrawalrequest") {
  $resparr = withdrawalrequest($conn, $email, $amount);
}
if ($operation == "withdrawalcompleted") {
  $resparr = withdrawalcompleted($conn, $email, $amount);
}
if ($operation == "games") {
  $resparr = games($conn, $roundnumber);
}

if ($operation == "transactionhistory") {
  $resparr = transactionhistory($conn, $email);
}
// var_dump($resparr);

echo json_encode($resparr);

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

function loginUser($conn, $email, $pswd){
  $resparr = array();
  $sql = "SELECT * FROM users
          WHERE email = '$email' AND pswd = MD5('$pswd')";

  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      array_push($resparr, $row);
    }
  }

  $sql = "SELECT sum(`deposit_amt`), sum(`request_amt`), sum(`completed_amt`),
          (sum(`deposit_amt`)-sum(`request_amt`)-sum(`completed_amt`)) as balance 
          FROM `transaction_history` 
          WHERE `email` = '$email'
          GROUP BY `email`";

  $result2 = $conn->query($sql);

  if ($result2 !== false && $result2->num_rows > 0) {
    while ($row = $result2->fetch_assoc()) {
      array_push($resparr, $row);
    }
  } else {
      array_push($resparr, '0');
  }

  return $resparr;
  }

function transactionhistory($conn, $email){
  $resparr = array();
  
  $sql = "SELECT * FROM `transaction_history` WHERE `email` = '$email'";

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

function deposit($conn, $email, $amount)
{

  $resparr = array();

  $sql = "INSERT INTO deposits (email, amount, datecreated)
			VALUES
			('$email','$amount', now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "success");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
function withdrawalrequest($conn, $email, $amount)
{

  $resparr = array();

  $sql = "INSERT INTO withdrawalrequest (email, amount, datecreated)
			VALUES
			('$email','$amount', now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "success");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
function withdrawalcompleted($conn, $email, $amount)
{

  $resparr = array();

  $sql = "INSERT INTO withdrawalcompleted (email, amount, datecreated)
			VALUES
			('$email','$amount',  now())";

  if ($conn->query($sql) === true) {
    array_push($resparr, 'success', "success");
  } else {
    array_push($resparr, 'error', $sql);
  }

  return $resparr;
}
