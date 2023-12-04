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

// $postdata = file_get_contents("php://input");
// $request = json_decode($postdata);
// $operation = isset($request->operation) ? $request->operation : "";
// $email = isset($request->email) ? $request->email : "";
// $pswd = isset($request->pswd) ? $request->pswd : "";
// $predictionjson = isset($request->predictionjson) ? $request->predictionjson : "";
// $amount = isset($request->amount) ? $request->amount : 0;
// $roundnumber = isset($request->roundnumber) ? $request->roundnumber : 1;

// testing stand alone
// $operation = "makeprediction";
// $email = "john.horton86@gmail.com";
// $pswd = "999";
$roundnumber = 1;

$gamesarray = array();
$sql = "SELECT * FROM games
          WHERE roundnumber = $roundnumber ";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // array_push($resparr, $row);
        array_push($gamesarray, $row);
        //    var_dump($row);
    }
} else {
    array_push($gamesarray, [$sql]);
}
// var_dump($gamesarray);


$predictionsarray = array();
$sql = "SELECT * FROM predictions
          WHERE roundnumber = '$roundnumber'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        array_push($predictionsarray, $row);
    }
} else {
    array_push($predictionsarray, [$sql]);
}

// var_dump($predictionsarray);

// for ($j = 0; $j < count($predictionsarray); $j++) {
$wincnt = 0;
foreach ($predictionsarray as $obj) {
    $predictions_id = $obj['id'];
    $predictions_email = $obj['email'];
    $desc = "";
    $correct_cnt = 0;
    $predictjsonarray = json_decode($obj['predictthisjson'], true);
    if (!json_last_error()) {
        $tot = 0;
        foreach ($predictjsonarray as $objjson) {           
            $p = $objjson;
            for ($i = 0; $i < count($gamesarray); $i++) {
                $g = $gamesarray[$i];
                
                if ($g["gameid"] == $p["gameid"]) {
                    if ($g["result"] == $p["winname"]) {
                        $tot++;
                        $desc = "GREEN TICK";
                    } else {
                        $desc = "RED CROSS";
                    }
                    // echo $predictions_id . " " . $objjson['gameid'] . " " . $objjson['hometeamname'] . " vs " . $objjson['awayteamname'] . "winner " . $g["result"] . " predicted " . $p["winname"] . " " . $desc . " " . $tot . "\n";
                }
            }
        }
        echo $predictions_id . "\n";
        echo $predictions_email . "\n";
        echo $tot . "\n";
        if($tot == 6) {
            $win = "1";
            $wincnt++;
        } else{
            $win = "0";
        }

        $sql = "UPDATE predictions SET correct_count = $tot, winner = $win WHERE id = $predictions_id";
        echo $sql . "\n";

        if ($conn->query($sql) === TRUE) {
            echo 'success' . "\n";
        } else {
            echo 'error' . "\n";
        }
    }
}

$sql = "SELECT `roundnumber`, sum(amount) as amt, sum(winner) as wins 
FROM `predictions` WHERE `roundnumber`= '$roundnumber'
group by `roundnumber`";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $sql = "UPDATE rounds SET prize_pool = $row[amt], no_of_winners = $row[wins] WHERE roundnumber = $roundnumber";
        echo $sql . "\n";

        if ($conn->query($sql) === TRUE) {
            echo 'success' . "\n";
        } else {
            echo 'error' . "\n";
        }
    }
} else {
    array_push($predictionsarray, [$sql]);
}



