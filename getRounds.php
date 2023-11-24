<?php

$host = 'localhost';
$db = 'afl';
$user = 'john';
$pass = 'john';
$charset = 'utf8mb4';

$conn = new mysqli($host, $user, $pass, $db);

$curl = curl_init();
$rndno = 2;
curl_setopt_array($curl, array(
    CURLOPT_URL => 'https://aflapi.afl.com.au/afl/v2/matches?pageSize=100&competitionId=1&compSeasonId=62&roundNumber=' . $rndno,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'GET',
)
);

$response = curl_exec($curl);

curl_close($curl);

$rounds = json_decode($response, true);
$matches = new ArrayObject();
$matches = $rounds["matches"];
for ($i = 0; $i < count($matches); $i++) {
    // echo ($i + 1) . "\n";
    // echo $matches[$i]["id"] . "\n";
    // echo $matches[$i]["round"]["id"] . "\n";
    // echo $matches[$i]["round"]["name"] . "\n";
    // echo $matches[$i]["round"]["roundNumber"] . "\n";
    // echo $matches[$i]["round"]["utcStartTime"] . "\n";

    // echo $matches[$i]["home"]["team"]["id"] . "\n";
    // echo $matches[$i]["home"]["team"]["name"] . "\n";
    // echo $matches[$i]["home"]["team"]["nickname"] . "\n";

    // echo $matches[$i]["away"]["team"]["id"] . "\n";
    // echo $matches[$i]["away"]["team"]["name"] . "\n";
    // echo $matches[$i]["away"]["team"]["nickname"] . "\n";
    // echo "\n";

    $gameid = $matches[$i]["id"] . "\n";
    $roundid = $matches[$i]["round"]["id"] . "\n";
    $roundname = $matches[$i]["round"]["name"] . "\n";
    $roundnumber = $matches[$i]["round"]["roundNumber"] . "\n";
    $utcStartTime = $matches[$i]["round"]["utcStartTime"] . "\n";

    $hometeamid = $matches[$i]["home"]["team"]["id"] . "\n";
    $hometeamname = $matches[$i]["home"]["team"]["name"] . "\n";
    $hometeamnickname = $matches[$i]["home"]["team"]["nickname"] . "\n";

    $awayteamid = $matches[$i]["away"]["team"]["id"] . "\n";
    $awayteamname = $matches[$i]["away"]["team"]["name"] . "\n";
    $awayteamnickname = $matches[$i]["away"]["team"]["nickname"] . "\n";


    $sql = "INSERT INTO `games`( `roundid`, `roundnumber`, `roundname`, `gameid`, `utcStartTime`, 
                    `hometeamid`, `hometeamname`, `hometeamnickname`, `awayteamid`, `awayteamname`, `awayteamnickname`,
                    `completed`, `result`) 
            VALUES ('$roundid','$roundnumber','$roundname','$gameid','$utcStartTime',
                    '$hometeamid','$hometeamname','$hometeamnickname','$awayteamid','$awayteamname','$awayteamnickname',
                    false, '' )";

    if ($conn->query($sql) === true) {
        echo 'success';
    } else {
        echo 'error';
        echo $sql;
    }
}

?>