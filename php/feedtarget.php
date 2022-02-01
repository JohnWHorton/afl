<?php
error_reporting(E_ALL ^ E_NOTICE);

header('Content-Type: application/json');
	
require 'dcidb.php';

/*example
/php/feedtarget.php?fmtargetid="1234"&fmtype="Social"&fmsource="Facebook"&fmname="Peter Parker"&fmurl="https://www.spiderman.com"&fmschedule="Daily"
or
/php/feedtarget.php?fmtargetid=1234&fmtype=Social&fmsource=Facebook&fmname=Peter Parker&fmurl=https://www.spiderman.com&fmschedule=Weekly
*/
	$operation = isset($_REQUEST['operation']) ? $_REQUEST['operation'] : "createTarget";
	$fmtype = isset($_REQUEST['fmtype']) ? $_REQUEST['fmtype'] : "";
	$fmsource = isset($_REQUEST['fmsource']) ? $_REQUEST['fmsource'] : "";
	$fmname = isset($_REQUEST['fmname']) ? $_REQUEST['fmname'] : "";
	$fmurl = isset($_REQUEST['fmurl']) ? $_REQUEST['fmurl'] : "";
	$fmschedule = isset($_REQUEST['fmschedule']) ? $_REQUEST['fmschedule'] : "";
	$fmtargetid = isset($_REQUEST['fmtargetid']) ? $_REQUEST['fmtargetid'] : "";
	
/*	echo $operation."\n";
	echo $fmtype."\n";
	echo $fmsource."\n";
	echo $fmname."\n";
	echo $fmurl."\n";
	echo $fmschedule."\n";
	echo $fmtargetid."\n";
*/	
	$validtypes = array("Social", "Websites", "RSS", "Forums");
	$validsources = array("Facebook", "Twitter", "Instagram", "RSS");
	$validschedules = array("Hourly", "Daily", "Weekly");
	
	$response="";

// validation
	if($fmtargetid=="") {
		echo "invalid targetid";
		return;
	}
	
	if (!in_array($fmtype, $validtypes)) {
		echo "invalid type";
		return;
	}
	
	if (!in_array($fmsource, $validsources)) {
		echo "invalid source";
		return;
	}

	if($fmname=="") {
		echo "invalid name";
		return;
	}
	
	if($fmurl=="") {
		echo "invalid url";
		return;
	}

	if (!in_array($fmschedule, $validschedules)) {
		echo "invalid schedule";
		return;
	}
// end validation
	
	if($operation=="createTarget") {
		$response = createTarget($fmtargetid,$fmtype,$fmsource,$fmname,$fmurl,$fmschedule, $conn);
	}

	mysqli_close($conn);
	echo $response;
	return;
	
function createTarget($fmtargetid,$fmtype,$fmsource,$fmname,$fmurl,$fmschedule, $conn) {	
	$sql = "insert into feedsources (fmtargetid,fmtype,fmsource,fmname,fmurl,fmschedule,date_created,date_update) 
			values 
			('$fmtargetid','$fmtype','$fmsource','$fmname','$fmurl','$fmschedule',now(),now()) ";
	
	if ($conn->query($sql) === TRUE) {
		$response = 'success';
	}else {
		$response = 'error';
	}
	 	
	return $response;
}

?>
