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

// $sql = "CREATE TABLE `afl`.`prizepool` 
// ( `id` INT NOT NULL AUTO_INCREMENT , 
// `roundnumber` INT NOT NULL , 
// `amount` FLOAT NOT NULL , 
// `dateupdated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , 
// PRIMARY KEY (`id`)) 
// ENGINE = InnoDB";

// if (mysqli_query($conn, $sql)) {
//     echo "prizepool created successfully";
// } else {
//     echo "Error creating table: " . mysqli_error($conn);
// }

$sql = "INSERT INTO `prizepool`(`roundnumber`, `amount`, `dateupdated`)
			VALUES
			('1','1620', now())";

if ($conn->query($sql) === true) {
    echo 'success';
} else {
    echo'error';
}

mysqli_close($conn);

?>
