<?php

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
$predictjsonarray = array();
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
// $tot = 0;
foreach ($predictionsarray as $obj) {
    echo $obj['id'] . "\n";
    echo $obj['email'] . "\n";
    $predictjsonarray = json_decode($obj['predictthisjson'], true);
    if (!json_last_error()) {
        foreach ($predictjsonarray as $objjson) {
            echo $objjson['hometeamname'] . " vs " . $objjson['awayteamname'] . "\n";
        }
    }
}

// echo "Prediction {$j} {$x}->{id}";
// p = JSON.parse(predictions[j].predictthisjson);
// for (k = 0; k < p.length; k++) {
//   for (i = 0; i < games.length; i++) {
//     if (games[i].gameid == p[k].gameid) {
//       g = games[i];

//       if (g.result == p[k].winname) {
//         tot++;
//         desc = "GREEN TICK";
//       } else {
//         desc = "RED CROSS";
//       }

//       let h1 = `Game ${g.gameid}  ${g.hometeamname} vs ${g.awayteamname} winner ${g.result}  predicted ${p[k].winname}  ${desc} ${tot}}`;
//       console.log(h1);
//     }
//   }
// }
// console.log(`You got ${tot} wins out of 6`);
//   }
/*
for (j = 0; j < predictions.length; j++) {
    let tot = 0;
    console.log(`Prediction ${j + 1}`);
    p = JSON.parse(predictions[j].predictthisjson);
    for (k = 0; k < p.length; k++) {
      for (i = 0; i < games.length; i++) {
        if (games[i].gameid == p[k].gameid) {
          g = games[i];

          if (g.result == p[k].winname) {
            tot++;
            desc = "GREEN TICK";
          } else {
            desc = "RED CROSS";
          }

          let h1 = `Game ${g.gameid}  ${g.hometeamname} vs ${g.awayteamname} winner ${g.result}  predicted ${p[k].winname}  ${desc} ${tot}}`;
          console.log(h1);
        }
      }
    }
    console.log(`You got ${tot} wins out of 6`);
  }
*/

// var_dump($predictionsarray);
