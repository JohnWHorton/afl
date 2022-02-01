<?php
error_reporting(E_ALL ^ E_NOTICE);

header('Content-Type: application/json');
	
require 'dcidb.php';

getAll($conn);

//$sql = 'update feedsources set date_last_run = now()';
//$result = $conn->query($sql);

function getAll($conn) {

	$sql = 'select id, fmtype, fmschedule, fmhour, fmday, fmurl, date_last_run, NOW() AS now, timediff(NOW() ,date_last_run) AS dtdiff from feedsources';
	
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		$currhour = date("H");
		$currday = date('N');
//		echo $currhour."   -   ".$currday."\n";
		while($row = $result->fetch_assoc()) {

			if($row["fmschedule"]=="Hourly") {
				if($row["dtdiff"] == NULL) {
					$row["dtdiff"] = 1;
				}
				if($row["dtdiff"] >= 1  ) {
//					echo $row["fmschedule"]." ".$row["dtdiff"]."  run this feed: ".$row["fmschedule"]." ".$row["fmhour"]." ".$row["fmday"]." - id is ".$row["id"]."\n"; // info debug
					setSubmitted("m".$row["id"]."_".$row["fmtype"], $row["fmurl"], $conn);
					updateLastRun($row["id"], $conn);
				} else {
//					echo $row["fmschedule"]." ".$row["dtdiff"]."  NOT SELECTED: ".$row["fmschedule"]." ".$row["fmhour"]." ".$row["fmday"]." - id is ".$row["id"]."\n"; // info debug
				}
			} elseif($row["fmschedule"]=="Daily") {
				
				if($row["dtdiff"] == NULL) {
					$row["dtdiff"] = 24;
				}
				if($row["dtdiff"] >= 24 && $currhour == $row["fmhour"]) {
//					echo $row["fmschedule"]." ".$row["dtdiff"]."  run this feed: ".$row["fmschedule"]." ".$row["fmhour"]." ".$row["fmday"]." - id is ".$row["id"]."\n"; // info debug
					setSubmitted("m".$row["id"]."_".$row["fmtype"], $row["fmurl"], $conn);
					updateLastRun($row["id"], $conn);
				}else {
//					echo $row["fmschedule"]." ".$row["dtdiff"]."  NOT SELECTED: ".$row["fmschedule"]." ".$row["fmhour"]." ".$row["fmday"]." - id is ".$row["id"]."\n"; // info debug
				}
			} elseif($row["fmschedule"]=="Weekly") {
				
				if($row["dtdiff"] == NULL) {
					$row["dtdiff"] = 168;
				}
				if($row["dtdiff"] >= 168 && $currday == $row["fmday"]  && $currhour == $row["fmhour"]) {
//					echo $row["fmschedule"]." ".$row["dtdiff"]."  run this feed: ".$row["fmschedule"]." ".$row["fmhour"]." ".$row["fmday"]." - id is ".$row["id"]."\n"; // info debug
					setSubmitted("m".$row["id"]."_".$row["fmtype"], $row["fmurl"], $conn);
					updateLastRun($row["id"], $conn);
				}else {
//					echo $row["fmschedule"]." ".$row["dtdiff"]."  NOT SELECTED: ".$row["fmschedule"]." ".$row["fmhour"]." ".$row["fmday"]." - id is ".$row["id"]."\n"; // info debug
				}
			}
		}
	}

	return;
}
function setSubmitted($id, $fmurl, $conn) {
	
	$sql = 'update feedsources set 
			date_feed_submitted = now(),
			feed_status = "running"
			where id = '.$id;
	
	$result = $conn->query($sql);
	$fmurl = urlencode($fmurl);
	$url =  "curl 'crwb.rogueeye.systems:888/feed_monitor.php?Action=feedUpdate&feed_url=".$fmurl."&feedID=".$id."'";

	exec($url, $output, $retval);
	echo $url;
}
function updateLastRun($id, $conn) {
	$sql = 'update feedsources set date_last_run = now() where id = '.$id;
	$result = $conn->query($sql);
}

?>