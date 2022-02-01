<?php
error_reporting(E_ALL ^ E_NOTICE);

header('Content-Type: application/json');
	
require 'dcidb.php';

	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$operation = isset($request->operation)? $request->operation : "getAll";
	$fmtype = isset($request->fmtype)? $request->fmtype : "";
	$fmsource = isset($request->fmsource)? $request->fmsource : "";
	$fmname = isset($request->fmname)? $request->fmname : "";
	$fmurl = isset($request->fmurl)? $request->fmurl : "";
	$fmschedule = isset($request->fmschedule)? $request->fmschedule : "";
	$fmhour = isset($request->fmhour)? $request->fmhour : "";
	$fmday = isset($request->fmday)? $request->fmday : "";
	$fldtypes  = isset($request->fldtypes)? $request->fldtypes : "";
	$name  = isset($request->name)? $request->name : "";
	$subcats  = isset($request->subcat)? $request->subcat : [];
	$id = isset($request->id)? $request->id : "";
	$newSchedule = isset($request->newSchedule)? $request->newSchedule : "";

	$fdata = isset($request->fdata)? $request->fdata : "";
	$filename = isset($request->filename)? $request->filename : "";

	//	English must always be the first element of this array as all others will be converted to this in the db
	$fmschedarray = array(
		array("Hourly","Daily","Weekly"),
		array("Horaire","Quotidien","Hebdomadaire")
	);
	
	$fmschedule = convertSchedToEnglish($fmschedule, $fmschedarray);

	$fmtype = trim($conn->real_escape_string($fmtype));
	$fmsource = trim($conn->real_escape_string($fmsource));
	$fmname = trim($conn->real_escape_string($fmname));
	$fmurl = trim($conn->real_escape_string($fmurl));
	$fmschedule = trim($conn->real_escape_string($fmschedule));
	$fmhour = trim($conn->real_escape_string($fmhour));
	$fmday = trim($conn->real_escape_string($fmday));
	$name = trim($conn->real_escape_string($name));
//	$subcats = $conn->real_escape_string($subcats);

	
	$idsarr = array();
	for($i=0; $i<count($subcats); $i++ ) {
		$pieces = explode(" ", $subcats[$i]);
		$idsarr[] = $pieces[0];
	}

	$fldarr = array();

	if($fldtypes->social) { $fldarr[] = "Social";};
	if($fldtypes->websites) { $fldarr[] = "Websites";};
	if($fldtypes->rss) { $fldarr[] = "RSS";};
	if($fldtypes->forums) { $fldarr[] = "Forums";};
	
	$resparr = array();
	$srcarr = array();
//	tmp for testing
//	$operation = "bulksource";
/*	$id = "7";
	$fmtype = "Social";
	$fmsource = "xyz";
	$fmname = "xyz";
	$fmurl = "xyz.com";
	$fmschedule = "Hourly";*/
//	$fdata = 'FEED TYPE,FEED SOURCE,SOURCE NAME,FEED URL,FEED SCHEDULE'."\n";
//	$fdata = $fdata.'Social, Facebook, OBSERVATOIRE LIBRE DE, https://www.facebook.com/groups/336396707239934a, Hourly'."\n";

	if($operation=="getall") {
		$resparr = getAll($fldarr, $conn);
	}
	
	if($operation=="getSelected") {
		$srcarr = getSelected($idsarr, $fldtypes, $conn);
		array_push($resparr,'sources',$srcarr);
	}
	
	if($operation=="addSource") {
		$resparr = addSource($resparr, $fmtype,$fmsource,$fmname,$fmurl,$fmschedule,$fmhour,$fmday, $conn);
	}

	if($operation=="bulksource") {
		$resparr = bulksource($resparr, $fdata, $conn);
	}

	if($operation=="updateSource") {
		$resparr = updateSource($id,$fmtype,$fmsource,$fmname,$fmurl,$fmschedule,$fmhour,$fmday, $conn);
	}

	if($operation=="saveView") {
		$resparr = saveView($name, $subcats, $fldtypes, $conn);
	}
	
	if($operation=="updateSchedule") {
		$resparr = updateSchedule($id, $newSchedule, $conn);
	}
	
	if($operation=="deleteSource") {
		$resparr = deleteSource($id, $conn);
	}

	mysqli_close($conn);

	echo json_encode($resparr);
	
function addSource($resparr, $fmtype,$fmsource,$fmname,$fmurl,$fmschedule,$fmhour,$fmday, $conn) {	
	$sql = "insert into feedsources (fmtype,fmsource,fmname,fmurl,fmschedule,fmhour,fmday,date_created,date_update,date_last_run) 
			values 
			('$fmtype','$fmsource','$fmname','$fmurl','$fmschedule','$fmhour','$fmday',now(),now(), NOW() - INTERVAL  10 DAY )";
	
	if ($conn->query($sql) === TRUE) {
		array_push($resparr,'success',$sql);
	}else {
		array_push($resparr,'error',$sql);
	}
	 	
	return $resparr;
}

function bulksource($resparr, $fdata, $conn) {
	
	$fmlogame = "../logs/fm.log";
	$text = "";
	$fh = fopen($fmlogame, "a") or die("Could not open log file.");

	$added=0;
	$ignored=0;
	$invalid=0;
	$invalidarr=[];
	$fdatarr = preg_split('/\r\n|\r|\n/', $fdata);
	$dt = date("Y-m-d H:i:s");
	
	for($i=0; $i<count($fdatarr); $i++) {
		$outcome = "";
		if($fdatarr[$i]=="") {
			continue;
		}
		$feedarr = explode(",", $fdatarr[$i]);
		$fmtype = $conn->real_escape_string(ucwords(strtolower(trim($feedarr[0]))));
		$fmsource = trim($conn->real_escape_string($feedarr[1]));
		$fmname = trim($conn->real_escape_string($feedarr[2]));
		$fmurl = trim($conn->real_escape_string($feedarr[3]));
		$fmschedule = $conn->real_escape_string(ucwords(strtolower(trim($feedarr[4]))));
/*		$fmschedule = convertSchedToEnglish($fmschedule, $fmschedarray);*/

		if(strtoupper($fmtype)=="RSS") { $fmtype="RSS"; }
		
		if($fmtype=="Social" || $fmtype=="Websites" || $fmtype=="RSS" || $fmtype=="Forums") {
		} else {
			if($i>0) { 
				$invalid++;
				$outcome = "Invalid type";
				array_push($invalidarr, [$fmtype,$fmsource,$fmname,$fmurl,$fmschedule]);
				$text  .= $dt." ".str_pad($fmtype, 10)." ".str_pad($fmsource, 10 )." ".str_pad($fmname, 20 )." ".str_pad($fmurl, 50 )." ".str_pad($fmschedule, 10 )." ".str_pad($outcome, 20 )."\n"; 
				continue;
			} else {
				continue;
			}
		}
		if($fmschedule=="Hourly" || $fmschedule=="Daily" || $fmschedule=="Weekly") {
		} else {
			if($i>0) { 
				$invalid++;
				$outcome = "Invalid schedule";
				array_push($invalidarr, [$fmtype,$fmsource,$fmname,$fmurl,$fmschedule]);
				$text  .= $dt." ".str_pad($fmtype, 10)." ".str_pad($fmsource, 10 )." ".str_pad($fmname, 20 )." ".str_pad($fmurl, 50 )." ".str_pad($fmschedule, 10 )." ".str_pad($outcome, 20 )."\n"; 
				continue;
			} else {
				continue;
			}
		}
			
		if($outcome=="") {
			$sql = "insert into feedsources (fmtype,fmsource,fmname,fmurl,fmschedule,date_created,date_update,date_last_run) 
					values 
					('$fmtype','$fmsource','$fmname','$fmurl','$fmschedule',now(),now(), NOW() - INTERVAL  10 DAY )";
			
			if ($conn->query($sql) === TRUE) {
				$added++;
				$outcome = "Added";
				$text  .= $dt." ".str_pad($fmtype, 10)." ".str_pad($fmsource, 10 )." ".str_pad($fmname, 20 )." ".str_pad($fmurl, 50 )." ".str_pad($fmschedule, 10 )." ".str_pad($outcome, 20 )."\n"; 
			}else {
				$ignored++;
				$outcome = "Ignored";
				$text  .= $dt." ".str_pad($fmtype, 10)." ".str_pad($fmsource, 10 )." ".str_pad($fmname, 20 )." ".str_pad($fmurl, 50 )." ".str_pad($fmschedule, 10 )." ".str_pad($outcome, 20 )."\n"; 
			}
		}		
	}
	
	fwrite($fh, $text) or die("Could not write file!");
	fclose($fh);

	array_push($resparr,'success');	
	array_push($resparr, 'Processed: added '.$added.'   ignored '.$ignored.'   invalid '.$invalid);	
	array_push($resparr, $invalidarr);
	return $resparr;
}

function getAll($f, $conn) {

	$srcarr = array();
	$savedarr = array();
	$resparr = array();

	$fldarr = implode("','",$f);
	
	$sql = "select * from feedsources where fmtype in ('".$fldarr."')";
	
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
		array_push($srcarr, $row);
		}
	}
	$resparr['sources'] = $srcarr;

	$sql = "select * from saved";
	
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
		array_push($savedarr, $row);
		}
	}
	$resparr['saved'] = $savedarr;

	return $resparr;
}

function getSelected($idsarr, $fldtypes, $conn) {

	$srcarr = array();
	
	$idsarr = implode("','",$idsarr);
	
	$sql = "select * from feedsources where id in ('".$idsarr."')";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
		array_push($srcarr, $row);
		}
	}
	return $srcarr;
}

function saveView($name, $subcats, $fldtypes, $conn) {

	$srcarr = array();
	$savedarr = array();
	
	$p = json_encode($subcats);
	$p = $conn->real_escape_string($p);

	$sql = "INSERT INTO saved (name, social, websites, rss, forums, subcats) 
			VALUES 
			('".$name."', ".$fldtypes->social.", ".$fldtypes->social.", ".$fldtypes->social.", ".$fldtypes->social.", '".$p."')";
	$result = $conn->query($sql);

	array_push($srcarr, $sql);
	array_push($srcarr, "success");

	$sql = "select * from saved";
	
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
		array_push($savedarr, $row);
		}
	}
	$srcarr['saved'] = $savedarr;

	return $srcarr;
}

function updateSchedule($id, $newSchedule, $conn) {

	$srcarr = array();
	
	$sql = "update feedsources 
			set fmschedule = '$newSchedule', date_update = now()
			where id = ".$id;
	if ($conn->query($sql) === TRUE) {
		array_push($srcarr,'success',$sql);
	}else {
		array_push($srcarr,'error',$sql);
	}

	return $srcarr;	
}

function updateSource($id,$fmtype,$fmsource,$fmname,$fmurl,$fmschedule,$fmhour,$fmday, $conn) {

	$srcarr = array();
	
	$sql = "update feedsources set 
				fmtype = '$fmtype' ,
				fmsource = '$fmsource' ,
				fmname = '$fmname' ,
				fmurl = '$fmurl' ,
				fmschedule = '$fmschedule' ,
				fmhour = '$fmhour' ,
				fmday = '$fmday' ,
				date_update = now()
			where id = ".$id;
	if ($conn->query($sql) === TRUE) {
		array_push($srcarr,'success',$sql);
	}else {
		array_push($srcarr,'error',$sql);
	}

	return $srcarr;	

}
function deleteSource($id, $conn) {

	$srcarr = array();
	
	$sql = "delete from feedsources where id = ".$id;
	if ($conn->query($sql) === TRUE) {
		array_push($srcarr,'success',$sql);
	}else {
		array_push($srcarr,'error',$sql);
	}

	return $srcarr;	

}

function convertSchedToEnglish($fmschedule, $fmschedarray) {
	
	for($i=0; $i<count($fmschedarray); $i++) {
		if($fmschedarray[$i][0]==$fmschedule) { return $fmschedarray[0][0]; }
		if($fmschedarray[$i][1]==$fmschedule) { return $fmschedarray[0][1]; }
		if($fmschedarray[$i][2]==$fmschedule) { return $fmschedarray[0][2]; }		
	}
}
?>
