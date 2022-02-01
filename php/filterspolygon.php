<?php
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$operation = $request->operation;
	$hashtag = isset($request->hashtag)? $request->hashtag : [];
	$polygon = isset($request->polygon)? $request->polygon : "";
	$gte = isset($request->fromdate)? $request->fromdate : "";
	$lte = isset($request->todate)? $request->todate : "";
	$uname = isset($request->uname)? $request->uname : [];
	$socnet = isset($request->socnet)? $request->socnet : [];
	$device = isset($request->device)? $request->device : [];
	$sentiment = isset($request->sentiment)? $request->sentiment : [];
	$lang = isset($request->lang)? $request->lang : [];
	$method = "POST";

	if(empty($gte)) { 
		$gte = "2020-11-01";
	}
	if(empty($lte)) { 
		$lte = "2020-12-31";
	}
	$interval = date_diff(date_create($gte), date_create($lte)); 
	$dif = $interval->format('%a'); 		// convert to number 
	$calinterval = "1w";					// default
	
if(empty($hashtag) || count($hashtag)==0) {
	if($dif>365) {
		$calinterval = "1w";
	}
}
$filter = array();

if(!empty($polygon) && $polygon>"") {
	array_push($filter, $polygon);
}
	  
if(empty($hashtag) || count($hashtag)==0) {
	array_push($filter, json_decode( '{"bool": {"should": [{"exists": { "field": "description"}}],"minimum_should_match": 1}}', true));
} else {
	$tmparr = $hashtag;
	$more="";
	
	for($i=0; $i<count($tmparr); $i++) {
		$more = $more.', {"match": { "description": "'.$tmparr[$i].'" }}';
	}

	array_push($filter, json_decode( '{"bool": {"should": [{"match": { "description": "'.$tmparr[0].'" }}'.$more.'],"minimum_should_match": 1}}', true));
}
if(empty($uname) || count($uname)==0) {
	array_push($filter, json_decode( '{"bool": {"should": [{"exists": { "field": "user_screen_name"}}],"minimum_should_match": 1}}', true));
} else {
	$tmparr = $uname;
	$more="";
	
	for($i=0; $i<count($tmparr); $i++) {
		$more = $more.', {"match": { "user_screen_name": "'.$tmparr[$i].'" }}';
	}

	array_push($filter, json_decode( '{"bool": {"should": [{"match": { "user_screen_name": "'.$tmparr[0].'" }}'.$more.'],"minimum_should_match": 1}}', true));
}
if(!empty($socnet)) {
	$tmparr = $socnet;
	$more="";
	
	for($i=0; $i<count($tmparr); $i++) {
		$more = $more.', {"match": { "social_network": "'.$tmparr[$i].'" }}';
	}

	array_push($filter, json_decode( '{"bool": {"should": [{"match": { "social_network": "'.$tmparr[0].'" }}'.$more.'],"minimum_should_match": 1}}', true));
}
if(!empty($device)) {
	$tmparr = $device;
	$more="";
	
	for($i=0; $i<count($tmparr); $i++) {
		$more = $more.', {"match": { "device_type": "'.$tmparr[$i].'" }}';
	}

	array_push($filter, json_decode( '{"bool": {"should": [{"match": { "device_type": "'.$tmparr[0].'" }}'.$more.'],"minimum_should_match": 1}}', true));
}
if(!empty($sentiment)) {
	$tmparr = $sentiment;
	$more="";
	
	for($i=0; $i<count($tmparr); $i++) {
		$more = $more.', {"match": { "sentiment": "'.$tmparr[$i].'" }}';
	}

	array_push($filter, json_decode( '{"bool": {"should": [{"match": { "sentiment": "'.$tmparr[0].'" }}'.$more.'],"minimum_should_match": 1}}', true));
}
if(!empty($lang)) {
	$tmparr = $lang;
	$more="";
	
	for($i=0; $i<count($tmparr); $i++) {
		$more = $more.', {"match": { "text_lang": "'.$tmparr[$i].'" }}';
	}

	array_push($filter, json_decode( '{"bool": {"should": [{"match": { "text_lang": "'.$tmparr[0].'" }}'.$more.'],"minimum_should_match": 1}}', true));
}

array_push($filter, json_decode( '{ "range": {"created_at": {"gte": "'.$gte.'","lte": "'.$lte.'","format": "strict_date_optional_time"}}}', true));
?>