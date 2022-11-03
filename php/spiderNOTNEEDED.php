<?php
error_reporting(E_ALL ^ E_NOTICE);

header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
	
//require "esconnection.php";
$url = "http://195.154.17.15:9045/api/v1/jobs";

$query = "";
$method = "POST"; 
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json', 
                'Accept: application/json; charset=UTF-8',
                'Connection: "keep-alive',
                'Cache-Control: "no-cache'));
curl_setopt($ch, CURLOPT_HEADER, 0);
//	curl_setopt($ch, CURLOPT_USERPWD, $userpwd);
// if($method=="POST") {
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");
// }
curl_setopt($ch, CURLOPT_POSTFIELDS, $query);		
//	curl_setopt($ch, CURLOPT_TIMEOUT, 5);		
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$ch_result = curl_exec($ch);
curl_close($ch);

// return $ch_result;	
$newjson = json_encode($ch_result, true);

echo $newjson;


?>
