<?php

// $host = 'localhost';
// $db = 'afl';
// $user = 'john';
// $pass = 'john';
// $charset = 'utf8mb4';

$host = '13.49.223.11';
$db = 'afl';
$user = 'tiffaman@gmail.com';
$pass = 'V4513john';
$charset = 'utf8mb4';

$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_errno) {
    echo "Failed to connect to MySQL: " . $conn->connect_error;
    exit();
}

// testing stand alone
$operation = "addUser";
// $email = "john.horton86@gmail.com";
// $pswd = "999";
$resparr = addUser($conn, "ash@afltest.com", "ash12345");
$resparr = deposit($conn, "ash@afltest.com", 40);
$resparr = addUser($conn, "ben@afltest.com", "ben12345");
$resparr = deposit($conn, "ben@afltest.com", 40);
$resparr = addUser($conn, "jan@afltest.com", "jan12345");
$resparr = deposit($conn, "jan@afltest.com", 40);
$resparr = addUser($conn, "em@afltest.com", "em12345");
$resparr = deposit($conn, "em@afltest.com", 40);

$resparr = array();

if ($operation == "addUser") {
    $resparr = addUser($conn, $email, $pswd);
}

if ($operation == "deposit") {
    $resparr = deposit($conn, $email, $amount);
}

var_dump($resparr);

echo json_encode($resparr);


function addUser($conn, $email, $pswd)
{

    $resparr = array();

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

