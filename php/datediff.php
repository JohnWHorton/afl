<?php

	if(empty($gte)) { 
		$gte = "2006-01-01";
	}
	if(empty($lte)) { 
		$lte = "2020-12-31";
	}

$hashtag=["blacklivesmatter"];
// creates DateTime objects 
$datetime1 = date_create($gte); 
$datetime2 = date_create($lte); 
  
// calculates the difference between DateTime objects 
$interval = date_diff($datetime1, $datetime2); 
  
// printing result in days format 
$dif = $interval->format('%a'); 

$calinterval = "1w";					// default

if(empty($hashtag) || count($hashtag)==0) {
	if($dif>365) {
		$calinterval = "1y";
	}
}

echo $calinterval
?>