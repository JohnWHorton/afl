<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <title>FeedsMonitor</title>

		<link rel="stylesheet" href="../css/select2.min.css" type="text/css">	
		<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">       
		<link rel="stylesheet" href="../css/prettify.min.css" type="text/css">
		<link rel="stylesheet" href="../css/bootstrap-table.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/fontawesome.min.css" type="text/css">
        <link rel="stylesheet" href="../css/all.css" type="text/css">

<!-- should always be last-->
        <link rel="stylesheet" href="../css/feedsmonitor.css" type="text/css">

	</head>
<body>

<?php require "../php/lang.php"; ?>

<script type="text/javascript">
var langarr = <?php echo json_encode($lang); ?>;
var weblang = "en";
</script>

	<div id="fmdata" style="display: block;">

		<div id="loading" >loading..</div>
		<center>
			<div id="startspinner" class="spinner-border text-success spinner-border" style="z-index: 99; width: 100px; height: 100px;"></div>
		</center>

		<div class="container col-md-12">
			<b><span style="margin-left: 5px; display: inline; color: #FFD600;"> <?php echo $lang[1]; ?></span></b>
		</div>

		<div class="container col-md-12">
			<form >
				<div class="form-check-inline" style="width: 100%;">
					<span style="min-width: 100px; margin-left: 5px;"><?php echo $lang[2]; ?>:&nbsp;&nbsp;</span>
					<button class="btn btn-sm btn-outline-secondary active" data-toggle="button" checked aria-pressed="true" autocomplete="off" id="btn-social"><i class="fas fa-share-alt-square"></i> <?php echo $lang[3]; ?></button>
					<button class="btn btn-sm btn-outline-secondary active" data-toggle="button" aria-pressed="true" autocomplete="off" id="btn-websites"><i class="fas fa-window-restore"></i> <?php echo $lang[4]; ?></button>
					<button class="btn btn-sm btn-outline-secondary active" data-toggle="button" aria-pressed="true" autocomplete="off" id="btn-rss"><i class="fas fa-rss-square"></i> <?php echo $lang[5]; ?></button>
					<button class="btn btn-sm btn-outline-secondary active" data-toggle="button" aria-pressed="true" autocomplete="off" id="btn-forums"><i class="fab fa-wpforms"></i> <?php echo $lang[6]; ?></button>
					<select id="subcat" class="my-select2-subcat dropdown-menu" name="subcat" multiple="multiple" 
					style="width: 100%; margin-right: 10px; margin-left: 5px;">
					</select>
					<span style="width: 100%; text-align: right;">
					<button type="button" class="btn btn-secondary btn-sm" onclick="doGoBtn();"><?php echo $lang[33]; ?></button>
					</span>
				</div>
			</form>
		</div>

		<div class="container col-md-12" style="width: 100%; margin-left: 5px;">
				<?php echo $lang[7]; ?>:&nbsp;&nbsp;</b><span id="moncnt"></span>&nbsp;&nbsp;<?php echo $lang[8]; ?>:&nbsp;&nbsp;<span id="maxlastrun"></span>
				<button type="submit" class="btn btn-secondary btn-sm" onclick="showSchedule();"><i class="far fa-clock"></i>  <?php echo $lang[9]; ?></button>
				<span style="text-align: right; float: right;">
						<button type="button" class="btn btn-secondary btn-sm" onclick="showAddSource();"><?php echo $lang[10]; ?></button>
						<button type="button" class="btn btn-secondary btn-sm" onclick="showSaveView();"><?php echo $lang[11]; ?></button>
						<button type="button" class="btn btn-secondary btn-sm" onclick="showLoadView();"><?php echo $lang[12]; ?></button>
						<button type="button" class="btn btn-secondary btn-sm" onclick="showUploadCSV();"><?php echo $lang[34]; ?></button>
						<button type="button" class="btn btn-secondary btn-sm" onclick="exportTable();" ><?php echo $lang[13]; ?></button>
				</span>
				<span id="myspinner" class="spinner-border text-success spinner-border" style="z-index: 99; width: 20px; height: 20px;"></span>
		</div>
		<br/>
		<div class="container col-md-12" style="margin-left: 5px;">
			<?php echo $lang[14]; ?> (<span id="srccnt"></span>)
		</div>
		<br/>
	  
	  
		<div class="container col-md-12" style="background-color: rgba(0,0,0,0.4);">
			<div class="row">
				<div class="col-sm-3" style="width: 100%; padding-right: 1px; ">
					<div class="container">
						<div class="row" style="margin-right: 5px; background-color: rgba(0,0,0,0.3); border: 1px solid transparent; border-radius: 1px;">
							<h2 class="tile-title" style="width: 100%;"><?php echo $lang[15]; ?></h2>					
							<div class="container" style="background: rgba(0,0,0,0.3); margin-top: -8px; padding: 0; width: 100%; border: 1px solid transparent; border-radius: 1px;">
								<div id="userspertime">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-9" style="margin: 0; padding: 0;">
					<div class="container col-sm-12" style="height: 100%;">
						<div class="row" style="height: 100%;">
							<div class="container col-sm-3" style="padding-right: 4px; padding-left: 2px;">
								<div class="row" style="height: 100%;">
									<div class="col-md-12" style="background-color:  transparent; margin-left: 5px;" >
										<div class="row" style="margin-right: 5px; background-color: rgba(0,0,0,0.3); height: 100%;">
											<h2 class="tile-title "><?php echo $lang[16]; ?>
											</h2>
											<div class="col-md-12" style="margin-left: 1px;padding-right: 0; padding-left: 0;">
												<div id="chart1">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>	
							<div class="container col-sm-3" style="padding-right: 12px; padding-left: 12px;">
								<div class="row">
									<div class="col-md-12" style="margin-left: 5px;">
										<div class="row" style="margin-right: 5px; background-color: rgba(0,0,0,0.3); height: 100%;">
											<h2 class="tile-title "><?php echo $lang[17]; ?>
											</h2>
											<div class="col-md-12" style="padding-right: 0; padding-left: 0;">
												<div id="chart2">
												</div>
											</div>
										</div>
									</div>
								</div>	
							</div>
							<div class="container col-sm-3" style="padding-right: 12px; padding-left: 12px;">
								<div class="row">
									<div class="col-md-12" style="margin-left: 5px;">
										<div class="row" style="margin-right: 5px; background-color: rgba(0,0,0,0.3); height: 100%;">
											<h2 class="tile-title "><?php echo $lang[18]; ?>
											</h2>
											<div class="col-md-12" style="padding-right: 0; padding-left: 0;">
												<div id="chart3">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="container col-sm-3" style="padding-right: 12px; padding-left: 12px;">
								<div class="row">
									<div class="col-md-12" style="margin-left: 5px;">
										<div class="row" style="margin-right: 5px; background-color: rgba(0,0,0,0.3); height: 100%;">
											<h2 class="tile-title "><?php echo $lang[19]; ?>
											</h2>
											<div class="col-md-12" style="padding-right: 0; padding-left: 10px;">
												<div id="chart4">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container col-md-12 mt-3" style="padding-left: unset;">
			<div class="col-md-12">
				<table id="feedmonitortable" class="display" style="width:100%; background-color: rgba(0, 0, 0, 0.5);">
					<thead >
						<tr id="tabheadings" >
					   </tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
  
	<div class="modal myModal text-center" id="myModalAddSource" style="height:auto; margin-top: 8%; margin-left: 35%; width: 70%; background-color: #000;">
		<div class="modal-dialog w-50">
			<div class="modal-content col-sm-12">

				<!-- Modal Header -->
				<div class="modal-header text-center" style="font-size: 0.8rem;">
					<h5 class="modal-title w-100" style="text-align: center"><?php echo $lang[20]; ?></h5>
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="padding: .05rem .3rem;"><?php echo $lang[21]; ?></button>
				</div>
			  
				<!-- Modal body -->
				<div class="modal-body ">
					<form id="addsrcform" class="form" action="">
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmtype" style="min-width: 140px; padding: 5px; outline: transparent;"><?php echo $lang[22]; ?>:</label>

						<select class="w10" id="fmtype" required>
						  <option><?php echo $lang[3]; ?></option>
						  <option><?php echo $lang[4]; ?></option>
						  <option><?php echo $lang[5]; ?></option>
						  <option><?php echo $lang[6]; ?></option>
						</select>
					  </div>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmsource" style="min-width: 140px; padding: 5px;"><?php echo $lang[23]; ?>:</label>
						<input class="w-20" type="text" class="form-control" id="fmsource" required>
					  </div>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmname" style="min-width: 140px; padding: 5px;"><?php echo $lang[24]; ?>:</label>
						<input class="w-20" type="text" class="form-control" id="fmname" required>
					  </div>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmurl" style="min-width: 140px; padding: 5px;"><?php echo $lang[25]; ?>:</label>
						<input class="w-20" style="min-width: 400px;" type="text" class="form-control" id="fmurl" required>
					  </div>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmschedule" style="min-width: 140px; padding: 5px;"><?php echo $lang[26]; ?>:</label>
						<select class="w10" id="fmschedule" required>
						  <option><?php echo $lang[27]; ?></option>
						  <option><?php echo $lang[28]; ?></option>
						  <option><?php echo $lang[29]; ?></option>
						</select>
					  </div>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmhour" style="min-width: 140px; padding: 5px;"><?php echo $lang[47]; ?>:</label>
						<select class="w10" id="fmhour" >
						  <option>01</option>
						  <option>02</option>
						  <option>03</option>
						  <option>04</option>
						  <option>05</option>
						  <option>06</option>
						  <option>07</option>
						  <option>08</option>
						  <option>09</option>
						  <option>10</option>
						  <option>11</option>
						  <option>12</option>
						  <option>13</option>
						  <option>14</option>
						  <option>15</option>
						  <option>16</option>
						  <option>17</option>
						  <option>18</option>
						  <option>19</option>
						  <option>20</option>
						  <option>21</option>
						  <option>22</option>
						  <option>23</option>
						  <option>24</option>
						</select>
					  </div>					  
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmday" style="min-width: 140px; padding: 5px;"><?php echo $lang[46]; ?>:</label>
						<select class="w10" id="fmday" >
						  <option value="1"><?php echo $lang[39]; ?></option>
						  <option value="2"><?php echo $lang[40]; ?></option>
						  <option value="3"><?php echo $lang[41]; ?></option>
						  <option value="4"><?php echo $lang[42]; ?></option>
						  <option value="5"><?php echo $lang[43]; ?></option>
						  <option value="6"><?php echo $lang[44]; ?></option>
						  <option value="7"><?php echo $lang[45]; ?></option>
						</select>
					  </div>
					  <br><br>
					  <center><button type="submit" class="btn btn-sm btn-secondary" onclick="doAddSource();" style="min-width: 100px;"><?php echo $lang[10]; ?></button></center>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer ">
<!--				<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="padding: .05rem .3rem;"><?php echo $lang[21]; ?></button>-->
					<div class="alertText text-center w-100"></div>
				</div>
			</div>
		</div>		
	</div>		

	<div class="modal myModal text-center" id="mySaveView" style="height:auto; margin-top: 8%; margin-left: 35%; width: 50%; background-color: #000;">
		<div class="modal-dialog w-50">
			<div class="modal-content col-sm-12">

				<!-- Modal Header -->
				<div class="modal-header text-center" style="font-size: 0.8rem;">
					<h5 class="modal-title w-100" style="text-align: center"><?php echo $lang[11]; ?></h5>
				</div>
			  
				<!-- Modal body -->
				<div class="modal-body ">
					<form id="saveviewform" class="form" action="">
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="viewname" style="min-width: 80px; padding: 5px; outline: transparent;"><?php echo $lang[30]; ?>:</label>
						<input class="w-20" type="text" class="form-control" id="viewname" required>
					  </div><br><br>
					  <center><button type="submit" class="btn btn-sm btn-secondary" onclick="doSaveView();" style="min-width: 100px;"><?php echo $lang[11]; ?></button></center>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer ">
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="padding: .05rem .3rem;"><?php echo $lang[21]; ?></button>
					<div class="alertText text-center w-100"></div>
				</div>
			</div>
		</div>		
	</div>		

	<div class="modal myModal text-center" id="myLoadView" style="height:auto; margin-top: 8%; margin-left: 35%; width: 50%; background-color: #000;">
		<div class="modal-dialog w-50">
			<div class="modal-content col-sm-12">

				<!-- Modal Header -->
				<div class="modal-header text-center" style="font-size: 0.8rem;">
					<h5 class="modal-title w-100" style="text-align: center"><?php echo $lang[12]; ?></h5>
				</div>
			  
				<!-- Modal body -->
				<div class="modal-body ">
					<form>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="loadname" style="min-width: 80px; padding: 5px; outline: transparent;"><?php echo $lang[30]; ?>:</label>
						<select class="w-20" type="text" class="form-control" id="loadname" style="min-width: 75%;">
						
						</select>
					  </div><br><br>
					  <center><button type="button" class="btn btn-sm btn-secondary" onclick="doLoadView();" style="min-width: 100px;"><?php echo $lang[12]; ?></button></center>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer ">
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="padding: .05rem .3rem;"><?php echo $lang[21]; ?></button>
					<div class="alertText text-center w-100"></div>
				</div>
			</div>
		</div>		
	</div>		

	<div class="modal myModal text-center" id="mySchedule" style="height:auto; margin-top: 8%; margin-left: 15%; width: 70%; background-color: #000;">
		<div class="modal-dialog w-100">
			<div class="modal-content col-sm-12">

				<!-- Modal Header -->
				<div class="modal-header text-center" style="font-size: 0.8rem; margin-top: 10px;">
					<h5 class="modal-title w-100" style="text-align: center"><?php echo $lang[26]; ?></h5>
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="padding: .05rem .3rem;"><?php echo $lang[21]; ?></button>
				</div>
			  
				<!-- Modal body -->
				<div class="modal-body" style="padding: 0; text-align: left;">
					<div class="container col-md-12">
						<br><br>
						<div class="col-md-12">
							<table id="scheduletable" class="display" style="width:100%; background-color: transparent;">
								<thead style="border-bottom: 2px solid #e4e1e1;">
									<tr id="scheduletabheadings" >
								   </tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer ">
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="padding: .05rem .3rem;"><?php echo $lang[21]; ?></button>
				</div>
			</div>
		</div>		
	</div>		

	<div class="modal myModal text-center" id="myEditSource" style="height:auto; margin-top: 8%; margin-left: 35%; width: 40%; background-color: #000;">
		<div class="modal-dialog w-100">
			<div class="modal-content col-sm-12">

				<!-- Modal Header -->
				<div class="modal-header text-center" style="font-size: 0.8rem;">
					<h5 class="modal-title w-100" style="text-align: center"><?php echo $lang[31]; ?></h5>
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="padding: .05rem .3rem;"><?php echo $lang[21]; ?></button>
				</div>
			  
				<!-- Modal body -->
				<div class="modal-body ">
					<form id="updatesrcform" class="form" action="">
						<span id="editsourceHTML">
						
						</span>						
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer ">
					<div class="alertText text-center w-100"></div>
				</div>
			</div>
		</div>		
	</div>		

	<div class="modal myModal text-center" tabindex="-1" id="myConfirm" role="dialog" style="height:auto; margin-top: 1.5%; margin-left: 35%; width: 40%;">
		<div class="modal-dialog w-100">
			<div class="modal-content col-sm-12">

				<!-- Modal Header -->
				<div class="modal-header text-center" style="font-size: 0.8rem;">
					<h5 class="modal-title w-100" id="myModalLabel"><?php echo $lang[32]; ?></h5>
				</div>
		  <div class="modal-footer text-center" style="width: 480px;">
			<button type="button" class="btn btn-secondary btn-sm" onclick="doDeleteScedule();" id="modal-btn-yes">Yes</button>
			<button type="button" class="btn btn-secondary btn-sm" onclick="$('#myConfirm').modal('hide');"  id="modal-btn-no">No</button>
		  </div>
		</div>
	  </div>
	</div>
	
	<div class="modal myModal text-center" tabindex="-1" id="myFullPost" role="dialog" style="height:auto; margin-top: 3%; margin-left: 20%; width: 60%;">
		<div class="modal-dialog w-100">
			<div class="modal-content col-sm-12">

				<!-- Modal Header -->
				<div class="modal-header text-center" style="font-size: 0.8rem;">
				</div>
				<div class="modal-body ">
					<div id="fullPost">
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer ">
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="padding: .05rem .3rem;"><?php echo $lang[21]; ?></button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal myModal text-center" id="myUploadCSV" style="height:auto; margin-top: 8%; margin-left: 35%; width: 70%;">
		<div class="modal-dialog w-50">
			<div class="modal-content col-sm-12">

				<!-- Modal Header -->
				<div class="modal-header text-center" style="font-size: 0.8rem;">
					<h5 class="modal-title w-100" style="text-align: center"><?php echo $lang[34]; ?></h5>
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="padding: .05rem .3rem;"><?php echo $lang[21]; ?></button>
				</div>
			  
				<!-- Modal body -->
				<div class="modal-body ">
					<form id="uploadCSV" class="form" action="">
						<div class="form-group">
							<label for="sourceCSV">Select a CSV to upload</label>
							<input type="file" class="form-control-file" id="sourceCSV" value="">
							</br><p class="text-left">Note: Already existing feeds will be ignored. Only new feeds will be added.</p>
						</div>
						<center>
						  <button type="button" class="btn btn-sm btn-secondary" onclick="doUploadCSV();" style="min-width: 100px;"><?php echo $lang[37]; ?></button>
						  <button type="button" class="btn btn-sm btn-secondary" onclick="window.open(window.location.hostname+'/../../logs/fm.log', '_blank')" style="min-width: 100px;"><?php echo $lang[38]; ?></button>
					  	</center>
						<div id="csvspinner" class="spinner-border text-success spinner-border" style="z-index: 99; width: 20px; height: 20px; display: none;"></div>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer ">
					<div class="alertText text-center w-100"></div>
				</div>
			</div>
		</div>		
	</div>		

	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/moment.js"></script>
	<script type="text/javascript" src="../js/popper.min.js"></script>
	<script type="text/javascript" src="../js/bootstrapv4.3.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datepicker.min.js"> </script>
	<script type="text/javascript" src="../js/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="../js/select2.min.js"></script>
	<script type="text/javascript" src="../js/solid.min.js"></script>
	<script type="text/javascript" src="../js/prettify.min.js"></script>
	<script type="text/javascript" src="../js/feedsmonitor.js"></script>
	<script type="text/javascript" src="../js/zingchart.min.js"></script>
	<script type="text/javascript" src="../js/isoLangs.js"></script>
	<script type="text/javascript" src="../js/fontawesome.min.js"></script>
	<script type="text/javascript" src="../js/all.js"></script>
	<script type="text/javascript" src="../js/jquery.dataTables.js" charset="utf8" ></script>

<!--	<script type="text/javascript" src="../js/fakedata.js"></script>-->

</body>