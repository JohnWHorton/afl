<?php

$host = 'localhost';
$db = 'afl';
$user = 'john';
$pass = 'john';
$charset = 'utf8mb4';

$conn = new mysqli($host, $user, $pass, $db);

$curl = curl_init();
// $rndno = 2;
for ($rndno = 1; $rndno < 25; $rndno++) {
    curl_setopt_array(
        $curl,
        array(
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

        $gameid = $matches[$i]["id"];
        $roundid = $matches[$i]["round"]["id"];
        $roundname = $matches[$i]["round"]["name"];
        $roundnumber = $matches[$i]["round"]["roundNumber"];
        if (isset($matches[$i]["round"]["utcStartTime"])) {
            $utcStartTime = $matches[$i]["round"]["utcStartTime"];
        } else {
            $utcStartTime = "";
        }

        $hometeamid = $matches[$i]["home"]["team"]["id"];
        $hometeamname = $matches[$i]["home"]["team"]["name"];
        $hometeamnickname = $matches[$i]["home"]["team"]["nickname"];

        $awayteamid = $matches[$i]["away"]["team"]["id"];
        $awayteamname = $matches[$i]["away"]["team"]["name"];
        $awayteamnickname = $matches[$i]["away"]["team"]["nickname"];


        $sql = "INSERT INTO `games`( `roundid`, `roundnumber`, `roundname`, `gameid`, `utcStartTime`, 
                    `hometeamid`, `hometeamname`, `hometeamnickname`, `awayteamid`, `awayteamname`, `awayteamnickname`,
                    `completed`, `result`) 
            VALUES ('$roundid','$roundnumber','$roundname','$gameid','$utcStartTime',
                    '$hometeamid','$hometeamname','$hometeamnickname','$awayteamid','$awayteamname','$awayteamnickname',
                    false, '' )";

        if ($conn->query($sql) === true) {
            echo 'success' . "\n";
        } else {
            echo 'error' . "\n";
            echo $sql;
        }
    }
}
