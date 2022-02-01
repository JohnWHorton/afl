<?php

function runCurl($url, $userpwd, $method, $query) {
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
	if($method=="POST") {
		curl_setopt($ch, CURLOPT_POST, 1);
	}
	curl_setopt($ch, CURLOPT_POSTFIELDS, $query);		
//	curl_setopt($ch, CURLOPT_TIMEOUT, 5);		
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	$ch_result = curl_exec($ch);
	curl_close($ch);

	return $ch_result;	
}

?>