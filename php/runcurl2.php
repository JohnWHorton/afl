<?php

function runCurl($url) {
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, 1);
	$ch_result = curl_exec($ch);
	curl_close($ch);

	return $ch_result;	
}

?>