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

$curl = curl_init();

curl_setopt_array(
    $curl,
    array(
        CURLOPT_SSL_VERIFYHOST => false,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_URL => 'https://aflapi.afl.com.au/afl/v2/matches?pageSize=300&competitionId=1&compSeasonId=62',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36",
            "Accept-Language:en-US,en;q=0.5"
        ),
    )
);

$response = curl_exec($curl);

curl_close($curl);
// echo $response;

$rounds = json_decode($response, true);
$matches = new ArrayObject();
$matches = $rounds["matches"];
for ($i = 0; $i < count($matches); $i++) {

    $gameid = $matches[$i]["id"];
    $roundid = $matches[$i]["round"]["id"];
    $roundname = $matches[$i]["round"]["name"];
    $roundnumber = $matches[$i]["round"]["roundNumber"];
    $venue = $matches[$i]["venue"]["name"];
    $location = $matches[$i]["venue"]["location"];
    $state = $matches[$i]["venue"]["state"];
    $timezone = $matches[$i]["venue"]["timezone"];

    if (isset ($matches[$i]["utcStartTime"])) {
        $utcStartTime = $matches[$i]["utcStartTime"];
    } else {
        $utcStartTime = "";
    }
    if (isset ($matches[$i]["status"])) {
        $status = $matches[$i]["status"];
    } else {
        $status = "";
    }

    $hometeamid = $matches[$i]["home"]["team"]["id"];
    $hometeamname = $matches[$i]["home"]["team"]["name"];
    $hometeamnickname = $matches[$i]["home"]["team"]["nickname"];

    $awayteamid = $matches[$i]["away"]["team"]["id"];
    $awayteamname = $matches[$i]["away"]["team"]["name"];
    $awayteamnickname = $matches[$i]["away"]["team"]["nickname"];

    if (isset ($matches[$i]["home"]["score"]["totalScore"])) {
        $hometeamscore = $matches[$i]["home"]["score"]["totalScore"];
        $awayteamscore = $matches[$i]["away"]["score"]["totalScore"];
        $winner = "draw";
        if ($hometeamscore > $awayteamscore) {
            $winner = $hometeamname;
        }

        if ($hometeamscore < $awayteamscore) {
            $winner = $awayteamname;
        }

        echo $gameid . " " . $hometeamname . " " . $awayteamname . " " . $utcStartTime . " " . $status . " " . $hometeamscore . " " . $awayteamscore . " " . $winner . "\n";

        $sql = "UPDATE `games` SET `completed`= 1,`result`= '$winner' WHERE `gameid` = $gameid";

        if ($conn->query($sql) === true) {
            echo 'success' . "\n";
        } else {
            echo 'error' . "\n";
            echo $sql;
        }
    }
}
