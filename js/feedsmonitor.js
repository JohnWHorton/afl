/*
var weblang="en";
var enarray = ["Hourly","Daily","Weekly","Hour","Day","","","","","","",""] ;
var frarray = ["Horaire","Quotidien","Hebdomadaire","","","","","","","","",""];
var langarr;
*/
var winlocpath;
var hostname="";

var scheduledata = [];
var scheduledata2 = [];
var saveddata = [];
var sources = [];
var maxlastrun = "";

var addsrctext="";
var fmoperation = "getall";
var results;

var fldtypes = new Object();
	fldtypes.social = true;
	fldtypes.websites = true;
	fldtypes.rss = true;
	fldtypes.forums = true;

var subcat = [];
var mydata = [];
var rawdata = [];
var table = "";
var subcatHTML="";
var schedtable = "";
var selectedID;

	// charts
var top10users = [];
var networkpertime = [];
var devices = [];
var sentiment = [];
var lang = [];
var socialnetwork = [];
var searchtags = [];
//var allphits = [];

var theserieschart0 = [];
var thelabelschart0 = [];
var theserieschart1 = [];
var theserieschart2 = [];
var theserieschart3 = [];
var theserieschart4 = [];
var theserieschart5 = [];
var thelabelschart5 = [];

// filters
var socnet=[];
var device=[];
var sent=[];
var langs=[];
var search=[];
var grid = [];

var initdate = true;
var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
var yyyy = today.getFullYear();
	today = yyyy + '-' +mm + '-' + dd;
var todate=today;
var initfromdate = new Date();
	initfromdate.setDate(initfromdate.getDate() - 60);
	dd = String(initfromdate.getDate()).padStart(2, '0');
	mm = String(initfromdate.getMonth() + 1).padStart(2, '0');
	yyyy = initfromdate.getFullYear();
var fromdate = yyyy + '-' +mm + '-' + dd;
var fileName;
var mychartconfig;

var myTheme = {  
  "palette" : { // object
    "pie" : [ // Key is chart type name, value is array of arrays
      ["#ffffff", "#40beeb", "#40beeb", "#40beeb"], // array of colors for plot 0
      ["#ffffff", "#305f74", "#305f74", "#305f74"], // array of colors for plot 1
      ["#ffffff", "#4492a8", "#4492a8", "#4492a8"], // array of colors for plot 2
      ["#ffffff", "#8e8e8e", "#8e8e8e", "#8e8e8e"], // etc...
      ["#ffffff", "#85bdcd", "#85bdcd", "#85bdcd"],
      ["#ffffff", "#00695c", "#00695c", "#00695c"],
      ["#ffffff", "#004d40", "#004d40", "#004d40"],
      ["#ffffff", "#69f0ae", "#69f0ae", "#69f0ae"],
      ["#ffffff", "#f4ff81", "#f4ff81", "#f4ff81"],
      ["#ffffff", "#827717", "#827717", "#827717"]
    ],
    "vbar" : [
      ["#ffffff", "#40beeb", "#40beeb", "#40beeb"],
      ["#ffffff", "#305f74", "#305f74", "#305f74"],
      ["#ffffff", "#4492a8", "#4492a8", "#4492a8"],
      ["#ffffff", "#8e8e8e", "#8e8e8e", "#8e8e8e"],
      ["#ffffff", "#85bdcd", "#85bdcd", "#85bdcd"],
      ["#ffffff", "#00695c", "#00695c", "#00695c"],
      ["#ffffff", "#004d40", "#004d40", "#004d40"],
      ["#ffffff", "#69f0ae", "#69f0ae", "#69f0ae"],
      ["#ffffff", "#f4ff81", "#f4ff81", "#f4ff81"],
      ["#ffffff", "#827717", "#827717", "#827717"]
    ]
  }
}; 

var fa_android = '<span style="color: #ffffff;"><center><i class="fab fa-android"></i></center></span>';
var fa_apple = '<span style="color: #ffffff;"><center><i class="fab fa-apple"></i></center></span>';
var fa_apps = '<span style="color: #bdbdb9;"><center><i class="fa fa-th"></i></center></span>';
var fa_instagram = '<span style="color: #808080; font-size: 36px;" title="Instagram"><center><i class="fab fa-instagram"></i></center></span>';
var fa_twitter = '<span style="color: #40beeb; font-size: 30px;" title="Twitter"><center><i class="fab fa-twitter"></i></center></span>';
var fa_facebook = '<span style="color: #4267b2; font-size: 30px;" title="Facebook"><center><i class="fab fa-facebook-f"></i></center></span>';
var fa_telegram = '<span style="color: #22b8f0; font-size: 30px;" title="Instagram"><center><i class="fab fa-telegram-plane"></i></center></span>';
var fa_viber = '<span style="color: #22b8f0; font-size: 30px;" title="Instagram"><center><i class="fab fa-viber"></i></center></span>';
var fa_vk = '<span style="color: #40beeb; font-size: 30px;"><center title="Telegram"><i class="fab fa-vk"></i></center></span>';
var fa_positive = '<span style="color: #71bf32;"><center><i class="fas fa-long-arrow-alt-up"></i></center></span>';
var fa_neutral = '<span style="color: #40beeb;"><center><i class="fas fa-minus"></i></center></span>';
var fa_negative = '<span style="color: #c94d51;"><center><i class="fas fa-long-arrow-alt-down"></i></center></span>';
var fa_rss = '<span style="color: #22b8f0;"><center><i class="fas fa-rss"></i></center></span>';
var fa_newscontent = '<span style="color: #22b8f0;"><center><i class="far fa-newspaper" style="color:white"></i></center></span>';
var fa_whatsapp = '<span style="color: #22b8f0;"><center><i class="fab fa-whatsapp"  style="color:green"></i></center></span>';
var fa_youtube = '<span style="color: #22b8f0;"><center><i class="fab fa-youtube" style="color:red"></i></center></span>';


$(document).ready(function() {
	
	hostname = window.location.hostname;
	winlocpath = window.location.pathname.toLowerCase();
/*	if(winlocpath.includes("/fr")){
		weblang = "fr";
		langarr = frlang;
	} else {
		weblang = "en";
		langarr = enlang;
	}*/

	table = $('#feedmonitortable').DataTable( {
		"paging":   true,
		"pagingType": "simple_numbers",
		"language": {
			"paginate": {
				"previous": "&lt;&lt;",
				"next": "&gt;&gt;"
			}
		},
		"ordering": true,
		"info":     true,
		"bLengthChange": false,
		"pageLength": 10,
		"stripeClasses": [],
		"data": mydata,
		"columns": [
			{ "width": "3%", "data": "id" },
			{ "width": "7%", "data": "created_at" },
			{ "width": "4%", "data": "type" },
			{ "width": "7%", "data": "social_network" },
			{ "width": "3%", "data": "pic_url" },
			{ "width": "6%", "data": "user_name" },
			{ "width": "1%", "data": "spacer"},
			{ "width": "13%", "data": "description" },
			{ "width": "13%", "data": "tags" },
			{ "width": "6%", "data": "engagements" },
			{ "width": "8%", "data": "sentiment" },
			{ "width": "7%", "data": "link" }
			]
		});

	getAllSources();
	$("#addsource").hide();
	$("#fmdata").show();

	$( "#addsrcform" ).submit(function( event ) {
	  event.preventDefault();
	});
	
	$( "#updatesrcform" ).submit(function( event ) {
	  event.preventDefault();
	});
	
	$( "#saveviewform" ).submit(function( event ) {
	  event.preventDefault();
	});

	$('#btn-social').on('click', function (e) {
		if(fldtypes.social == false) {
			fldtypes.social = true;
		} else {
			fldtypes.social = false;
		}
	})

	$('#btn-websites').on('click', function (e) {
		if(fldtypes.websites == false) {
			fldtypes.websites = true;
		} else {
			fldtypes.websites = false;
		}
	})
	
	$('#btn-rss').on('click', function (e) {
		if(fldtypes.rss == false) {
			fldtypes.rss = true;
		} else {
			fldtypes.rss = false;
		}
	})

	$('#btn-forums').on('click', function (e) {
		if(fldtypes.forums == false) {
			fldtypes.forums = true;
		} else {
			fldtypes.forums = false;
		}
	})
	
	$('.my-select2-subcat').select2({
		width: 'resolve',
		placeholder: "Source",
		tags: true
	});

	$(document).on('change', '.fmschedule', function(){
		let id = $(this).val();
		let newSchedule = $("#"+id+" option:selected" ).text();
		updateSchedule(id, newSchedule);
	});

	$('#fmday').prop('disabled', 'disabled');
	$('#fmhour').prop('disabled', 'disabled');

	$(document).on('change', '#fmschedule', function(){			// add a source
		let id = $(this).val();
		if(id == "Hourly" || id == "Horaire") {
			$('#fmday').prop('disabled', 'disabled');
			$('#fmhour').prop('disabled', 'disabled');
		}
		if(id == "Daily" || id == "Quotidien") {
			$('#fmday').prop('disabled', 'disabled');
			$('#fmhour').removeAttr('disabled');
		}
		if(id == "Weekly" || id == "Hebdomadaire") {
			$('#fmday').removeAttr('disabled');
			$('#fmhour').removeAttr('disabled');
		}
	});


})
function updateSchedule(id, newSchedule) {
	var parms = {operation: "updateSchedule", id: id, newSchedule: newSchedule};

	$.ajax({
		type: "POST",
		url: "../php/feedsource.php",
		contentType: 'application/json; charset=UTF-8',
		dataType: "json",
		data: JSON.stringify(parms),
		success: function (response) {
		},
		error: function () {
			alert("Error!");
		}
	});	
}

function transformData() {

	for(i=0; i<mydata.length; i++) {
		// seperate pseudo targetID
		mydata[i].id = i+1;
		mydata[i].created_at = mydata[i].created_at.replace(" ","<br>");

		if(mydata[i].targetID.includes("_")) {
			let typearr = mydata[i].targetID.split("_");
			mydata[i].type = '<i class="fas fa-share-alt-square"></i> '+typearr[1];
		} else {
			mydata[i].type = '<i class="fas fa-share-alt-square"></i> '+"Social";
		}

		if(mydata[i].social_network.toLowerCase()=="twitter") { mydata[i].social_network = '<div>'+fa_twitter+'</div>'; }
		if(mydata[i].social_network.toLowerCase()=="instagram") { mydata[i].social_network = '<div>'+fa_instagram+'</div>'; }
		if(mydata[i].social_network.toLowerCase()=="facebook") { mydata[i].social_network = '<div>'+fa_facebook+'</div>'; }
		if(mydata[i].social_network.toLowerCase()=="telegram") { mydata[i].social_network = '<div>'+fa_telegram+'</div>'; }
		if(mydata[i].social_network.toLowerCase()=="viber") { mydata[i].social_network = '<div>'+fa_viber+'</div>'; }
		
		mydata[i].pic_url = '<img src="'+mydata[i].pic_url+'" onerror="this.src=&quot;https://rogueeye.systems/images/twitterProfile.png&quot;" class="picture">';
//		mydata[i].pic_url = '<img src="'+mydata[i].pic_url+'" onerror="this.src=&quot;https://'+hostname+'/images/twitterProfile.png&quot;" class="picture">';
		
		if(typeof mydata[i].user_name !== 'undefined') {
			mydata[i].user_name = mydata[i].user_name+" ("+mydata[i].user_id+")";
		} else {
			mydata[i].user_name = "("+mydata[i].user_id+")";			
		}
		
		mydata[i].spacer = "";
		tmpdesc = "";
		if(typeof mydata[i].title !== 'undefined' && mydata[i].title && mydata[i].title>"") {
			tmpdesc += '<div onclick="showFullPost('+i+')" style="padding: 10px 5px 5px 5px; width: 100%; height: 140px; overflow-x: hidden;"><strong>Title: </strong>'+mydata[i].title.replace(/(\r\n|\n|\r)/gm, "<br />")+'<br>';
			
		}
		if(typeof mydata[i].description !== 'undefined' && mydata[i].description && mydata[i].description>"") {
			tmpdesc += '<strong>Content: </strong>'+mydata[i].description.substr(0,200)+' ...</div>';
		}
		mydata[i].description = tmpdesc;
		
		let htags = "";
		let mention = false;
		if(typeof mydata[i].text_entities_extra !== 'undefined') {
			let textentities = mydata[i].text_entities_extra;
			for(j=0; j<textentities.length; j++) {
//				console.log(i+" "+textentities[j].text+" "+textentities[j].type);
				if(textentities[j].type=="mention") {
					mention=true;
				} 
				if(textentities[j].type=="hashtag") {
					htags += textentities[j].text+" ";
				}
			}
			htags.trim();
		}
		mydata[i].tags="";
		if(mention && htags>"") {
//			console.log(i+" "+htags);
			let ht = htags.split(" ");
			for(k=0; k<ht.length; k++) {
				if(ht[k]!==" " && ht[k]!=="") mydata[i].tags += '<button class="button tagbtns" style="outline: none;">'+ht[k]+'</button>';
			}
		} else {
			mydata[i].tags =`<button class="button tagbtns" style="outline: none;">content</button>
					<button class="button tagbtns" style="outline: none;">data object</button>
					<button class="button tagbtns" style="outline: none;">text</button>
					<button class="button tagbtns" style="outline: none;">link</button>
					<button class="button tagbtns" style="outline: none;">document</button>
					<button class="button tagbtns" style="outline: none;">url</button>`;
		}
	
		mydata[i].engagements = '<div style="min-width: 150px;">';
		if((typeof mydata[i].like_count !== 'undefined') && mydata[i].like_count>'0') {
			mydata[i].engagements += '<span style="float: left;" title="Likes"><i class="far fa-thumbs-up"></i><b> '+mydata[i].like_count+'</b></span>';
		} 
		if((typeof mydata[i].comment_count !== 'undefined') && mydata[i].comment_count>'0') {
			mydata[i].engagements += '<span style="padding-right: 30px; float: right;"><i class="fas fa-retweet" title="Retweets"></i><b> '+mydata[i].comment_count+'</b></span>';
		}
		mydata[i].engagements += '<br>';
		if((typeof mydata[i].retweet_count !== 'undefined') && mydata[i].retweet_count>'0') {
			mydata[i].engagements += '<span style="float: left;"><i class="fas fa-retweet" title="Retweets"></i><b> '+mydata[i].retweet_count+'</b></span>';
		}
		if((typeof mydata[i].shared_count !== 'undefined') && mydata[i].shared_count>'0') {
			mydata[i].engagements += '<span style="padding-right: 30px; float: right;" title="shared"><i class="far fa-share-square"></i><b> '+mydata[i].shared_count+'</b></span>';
		}
		mydata[i].engagements += '</div>';

		mydata[i].sentiment = mydata[i].sentiment.replace("Natural","Neutral");
		
		if(mydata[i].sentiment=="Positive") {
			senticon = '<span style="color: #008000; font-size: 24px;"><i class="fas fa-smile"></i></span>';
		} else if(mydata[i].sentiment=="Negative") {
			senticon = '<span style="color: #DC3608; font-size: 24px;"><i class="fas fa-frown-open"></i></span>';			
		} else {
			senticon = '<span style="color: #808080; font-size: 24px;"><i class="fas fa-meh"></i></span>';			
		}

		let s = mydata[i].sentiment;
		if(winlocpath.includes("/fr")) {
			if(mydata[i].sentiment=="Neutral") {s = "Neutralité";}
			if(mydata[i].sentiment=="Positive") {s = "Positif";}
			if(mydata[i].sentiment=="Negative") {s = "Négatif";}
		}
		mydata[i].sentiment = '<span style="padding-left: 5px;" >'+senticon+' '+s+'</span>';

		if(winlocpath.includes("/fr")) {
			mydata[i].link = `<a target="blank" href="`+mydata[i].marker_url+`">
						<div class="linkToPost">Cliquez ici<br>pour le contenu</div></a>`;
		} else {
			mydata[i].link = `<a target="blank" href="`+mydata[i].marker_url+`">
						<div class="linkToPost">Click Here<br>For Content</div></a>`;
		}

		mydata[i].action = `<i class="icon pull-left btn"><a target="_blank" href="https://targetcenter.rogueeye.systems/targetcenter-addprofile.php?massInd=1&amp;TFirstName=İsimsizler Hareketi&amp;massTaskID=0&amp;massUser=İsimsizler Hareketi&amp;massType=&amp;massPics=" title="Create Target" style="color: white; padding: 10px;">&nbsp;+&nbsp;</a><a title="View On Map" style="padding: 10px;"><img style="height:15px; width: 15px; " src="../img/icon/AnalyzeW.png"></a></i>`;
	}
	if(table!=="") {
		table
			.clear()
			.rows.add(mydata)
			.draw();
	}
	let th="";
	if(winlocpath.includes("/fr")) {
		th=`<th style="width: 3%;">ID</th>
				<th style="width: 6%;">Heure</th>
				<th style="width: 6%;">Type</th>
				<th style="width: 5%;">La Source</th>
				<th style="width: 4%;">Image</th>
				<th style="width: 6%;">Nom/ID</th>
				<th style="width: 1%;"></th>
				<th style="width: 26%;">Contenu </th>
				<th style="width: 13%;">Tags et entités</th>
				<th style="width: 7%;">Engagements</th>
				<th style="width: 7%;">Sentiment</th>
				<th style="width: 7%;">Lien</th>`;
	} else {
		th=`<th style="width: 3%;">ID</th>
			<th style="width: 6%;">Time</th>
			<th style="width: 6%;">Type</th>
			<th style="width: 4%;">Source</th>
			<th style="width: 4%;">Picture</th>
			<th style="width: 6%;">Name/ID</th>
			<th style="width: 1%;"></th>
			<th style="width: 26%;">Content</th>
			<th style="width: 13%;">Tags And Entities</th>
			<th style="width: 7%;">Engagements</th>
			<th style="width: 7%;">Sentiment</th>
			<th style="width: 7%;">Link</th>`;
	}
	document.getElementById("tabheadings").innerHTML = th;
}
function showFullPost(i) {

	let tmpdesc = "";
	if(typeof rawdata[i].title !== 'undefined' && rawdata[i].title && rawdata[i].title>"") {
		tmpdesc += '<div style="text-align: left; padding: 10px 5px 5px 5px; width: 100%; height: 100%;"><strong>Title: </strong>'+rawdata[i].title.replace(/(\r\n|\n|\r)/gm, "<br />")+'<br>';
		
	}
	if(typeof rawdata[i].description !== 'undefined' && rawdata[i].description && rawdata[i].description>"") {
		tmpdesc += '<strong>Content: </strong>'+rawdata[i].description.replace(/(?:\r\n|\r|\n)/g, '<br>')+'</div>';
	}

	$('#myFullPost').modal('show');
	document.getElementById("fullPost").innerHTML = tmpdesc;

}
function getData() {

	$("#myspinner").show();

	var parms = {operation: "query1", sources: sources};

	$.ajax({
		type: "POST",
		url: "../php/fmsearch.php",
		contentType: 'application/json; charset=UTF-8',
		dataType: "json",
		data: JSON.stringify(parms),
		success: function (response) {
			results = response.aggs;		//JSON.parse(response);
			mydata = response.source;
			rawdata = JSON.parse(JSON.stringify(response.source));
			document.getElementById("srccnt").innerHTML = sources.length;
//console.log(rawdata);
			top10users = results.UserTop10.buckets;
//			top10users = ttu();				// temp hack
			topuserspertime = results.NetworksOverTime.buckets;
//			topuserspertime = npt();		// temp hack
			devices = results.device_aggs.buckets;
			sentiment = results.sentiment_aggs.buckets;
			lang = results.lang_aggs.buckets;
			socialnetwork = results.social_networks_aggs.buckets;

			setUsersPerTimeConfig(socialnetwork);
			doBiggerChart('userspertime', mychartconfig);

			setPieSeries(devices,"chart1");
			doChart('chart1', mychartconfig);
			
			setPieSeries(sentiment,"chart2");
			doChart('chart2', mychartconfig);
			
			setPieSeries(lang,"chart3");
			doChart('chart3', mychartconfig);
			
			setPieSeries(socialnetwork,"chart4");
			doChart('chart4', mychartconfig);
			$('.container').show();
			
			transformData();
			 
			$('#feedmonitortable').css( 'display', 'block' );
			table.columns.adjust().draw();
			
		},
		error: function () {
		}
	});
	$("#myspinner").hide();

}

function showAddSource() {
	$('#addsrctext').html('Please add a source below.');
	$('.alertText').html('');
	$('#myModalAddSource').modal({backdrop: 'static', keyboard: false});
	$('#myModalAddSource').modal('show');
}
function showSaveView() {
	$('.alertText').html('');
	$('#mySaveView').modal({backdrop: 'static', keyboard: false});
	$('#mySaveView').modal('show');
}
function showEditSource(id) {
	$('.alertText').html('');
	$('#mySchedule').modal('hide');	
	$('#myEditSource').modal({backdrop: 'static', keyboard: false});
	$('#myEditSource').modal('show');
//	doEditSource(id);
}
function showLoadView() {
	$('.alertText').html('');
	$('#myLoadView').modal({backdrop: 'static', keyboard: false});
	$('#myLoadView').modal('show');
	makeViewDropdown(saveddata);
}
function showConfirm() {
	$('.alertText').html('');
	$('#myConfirm').modal({backdrop: 'static', keyboard: false});
	$('#myConfirm').modal('show');
//	makeViewDropdown(saveddata);
}
function showSchedule() {
	$('.alertText').html('');
	$('#mySchedule').modal({backdrop: 'static', keyboard: false});
	$('#mySchedule').modal('show');	
	schedtable = $('#scheduletable').DataTable();			 
	$('#scheduletable').css( 'display', 'block' );
	schedtable.columns.adjust().draw();
}
function showUploadCSV() {
	$('.alertText').html('');
	$('#myUploadCSV').modal({backdrop: 'static', keyboard: false});
	$('#myUploadCSV').modal('show');
}
function doGoBtn() {
	if($('#subcat').val()!=null) {
		getSelectedSources();
	} else {
		getAllSources();
	}
}
function doLoadView(){
	if($('#loadname').val()!=null) {loadname = $('#loadname').val()} else {loadname=""} ;
	if(loadname=="") {
		alert("Please select a view to load");
	} else {
		$("#myspinner").show();
		for(i=0; i<saveddata.length; i++) {
			if(saveddata[i].name == loadname) {
				if((saveddata[i].social==0 && fldtypes.social == true) || (saveddata[i].social==1 && fldtypes.social == false)) {
					$("#btn-social").click();					
				}
				if((saveddata[i].websites==0 && fldtypes.websites == true) || (saveddata[i].websites==1 && fldtypes.websites == false)) {
					$("#btn-websites").click();					
				}
				if((saveddata[i].rss==0 && fldtypes.rss == true) || (saveddata[i].rss==1 && fldtypes.rss == false)) {
					$("#btn-rss").click();					
				}
				if((saveddata[i].forums==0 && fldtypes.forums == true) || (saveddata[i].forums==1 && fldtypes.forums == false)) {
					$("#btn-forums").click();					
				}
				
				$(".modal").modal('hide');
								
				let subcats = ((saveddata[i].subcats.replace("[","")).replace("]","")).split(",");
				let tmp = [];
				for(j=0; j<subcats.length; j++) {
					tmp.push(subcats[j].replaceAll('\"', ''));
					t = subcats[j].replaceAll('\"', '');
					if ($('#subcat').find("option[value='" + t + "']").length) {
					} else { 
						var newOption = new Option(t, t, true, false);
						$('#subcat').append(newOption).trigger('change');
					}
				}
				$('#subcat').val(tmp).trigger('change');
				doGoBtn();
			}
		}
	}
}

function getAllSources() {

	if($('#subcat').val()!=null) {
		subcat = $('#subcat').val()} else {subcat=[]
	}
	
	var parms = {operation: "getall", fldtypes: fldtypes, subcat: subcat};

	$.ajax({
		type: "POST",
		url: "../php/feedsource.php",
		contentType: 'application/json; charset=UTF-8',
		dataType: "json",
		data: JSON.stringify(parms),
		success: function (response) {
			scheduledata = response.sources;
			scheduledata2 = [...scheduledata];
			sources=[];
			maxlastrun="";
//			scheduledata2=[];
			for(i=0; i<scheduledata.length; i++) {
//				scheduledata2.push(scheduledata[i]);
				if(scheduledata[i].fmtargetid > "") {
					sources.push(scheduledata[i].fmtargetid+":"+scheduledata[i].fmsource);
				} else {
					sources.push("m"+scheduledata[i].id+"_"+scheduledata[i].fmtype);
				}
				if(scheduledata[i].date_last_run!==null && scheduledata[i].date_last_run > maxlastrun) {
					maxlastrun = scheduledata[i].date_last_run;
				}
			}
			document.getElementById("maxlastrun").innerHTML = maxlastrun;
			saveddata = response.saved;
			document.getElementById("moncnt").innerHTML = scheduledata.length;
//			console.log(scheduledata);
//			console.log(saveddata);
			makeSubCatDropdown();
			makeScheduleTable();
			getData();
		},
		error: function () {
			alert("Error!");
		}
	});
	
}

function getSelectedSources() {

	$("#startspinner").show();

	if($('#subcat').val()!=null) {
		subcat = $('#subcat').val()} else {subcat=[]
	}
	
	var parms = {operation: "getSelected", subcat: subcat};

	$.ajax({
		type: "POST",
		url: "../php/feedsource.php",
		contentType: 'application/json; charset=UTF-8',
		dataType: "json",
		data: JSON.stringify(parms),
		success: function (response) {
			scheduledata = response[1];
			sources=[];
			maxlastrun="";
			for(i=0; i<scheduledata.length; i++) {
				if(scheduledata[i].fmtargetid > "") {
					sources.push(scheduledata[i].fmtargetid+":"+scheduledata[i].fmsource);
				} else {
					sources.push("m"+scheduledata[i].id+"_"+scheduledata[i].fmtype);
				}
				if(scheduledata[i].date_last_run!==null && scheduledata[i].date_last_run > maxlastrun) {
					maxlastrun = scheduledata[i].date_last_run;
				}
			}
			document.getElementById("maxlastrun").innerHTML = maxlastrun;
			getData();
		},
		error: function () {
			$('.alertText').html('View could not be loaded!');
		}
	});
	
	$("#startspinner").hide();
	
}
function doSaveView() {
	if($('#subcat').val()!=null) {
		subcat = $('#subcat').val()} else {subcat=[]
	}
	if($('#viewname').val()!=null) {name = $('#viewname').val()} else {name=""} ;
	
	
	var parms = {operation: "saveView", name: name, fldtypes: fldtypes, subcat: subcat};
	$.ajax({
		type: "POST",
		url: "../php/feedsource.php",
		contentType: 'application/json; charset=UTF-8',
		dataType: "json",
		data: JSON.stringify(parms),
		success: function (response) {
		if(winlocpath.includes("/fr")) {			
			$('.alertText').html('La vue a été enregistrée!');
		} else {
			$('.alertText').html('View has been saved!');
		}
			saveddata = response.saved;
//			console.log(response);
		},
		error: function () {
			if(winlocpath.includes("/fr")) {			
				$('.alertText').html("La vue n'a pas pu être enregistrée!");
			} else {
				$('.alertText').html('View could not be saved!');
			}
		}
	});
	
}

function doAddSource() {

	if($('#fmtype').val()!=null) {fmtype = $('#fmtype').val()} else {fmtype=""};
	if(fmtype=="Sites Internet") {fmtype="Websites"};
	if($('#fmsource').val()!=null) {fmsource = $('#fmsource').val()} else {fmsource=""};
	if($('#fmname').val()!=null) {fmname = $('#fmname').val()} else {fmname=""};
	if($('#fmurl').val()!=null) {fmurl = $('#fmurl').val()} else {fmurl=""};
	if($('#fmschedule').val()!=null) {fmschedule = $('#fmschedule').val()} else {fmschedule=""};
	if($('#fmhour').val()!=null) {fmhour = $('#fmhour').val();} else {fmhour=""};
	if($('#fmday').val()!=null) {fmday = $('#fmday').children("option:selected").val();} else {fmday=""};
	
	var parms = {operation: "addSource", fmtype: fmtype, fmsource: fmsource, fmname: fmname, fmurl: fmurl, fmschedule: fmschedule, fmhour: fmhour, fmday: fmday};

	$.ajax({
		type: "POST",
		url: "../php/feedsource.php",
		contentType: 'application/json; charset=UTF-8',
		dataType: "json",
		data: JSON.stringify(parms),
		success: function (response) {
			if(response[0] == 'success'){
				if(winlocpath.includes("/fr")) {
					$("#toastmsg").html("La source a été ajoutée!");
//					$('.alertText').html('La source a été ajoutée!');
				} else {
					$("#toastmsg").html("Source has been added!");
//					$('.alertText').html('Source has been added!');
				}
				$('#myModalAddSource').modal('hide');
				$('.toast').toast({delay: 2000});
				$('.toast').toast('show');
				getAllSources();

			} else {
				if(winlocpath.includes("/fr")) {			
					$('.alertText').html("La source n'a pas pu être ajoutée!");
				} else {
					$('.alertText').html('Source could not be added!');
				}
			}
		},
		error: function () {
			alert("Error!");
		}
	});
	
}
function doUploadCSV() {
	if($('#sourceCSV').val() == "") {
		if(winlocpath.includes("/fr")) {
			$('.alertText').html("Veuillez sélectionner un fichier à télécharger");
		} else {
			$('.alertText').html("Please select a file to upload");
		}
		return;
	}
	$('#csvspinner').show();
	var file = document.getElementById('sourceCSV').files[0]; //Files[0] = 1st file
	var reader = new FileReader();
	reader.readAsText(file, 'UTF-8');
	reader.onload = shipOff;

}
function shipOff(event) {
    var fdata = event.target.result;
    var fileName = document.getElementById('sourceCSV').files[0].name; 
	console.log(fdata);
	console.log(fileName);
	var parms = {operation: "bulksource", fdata: fdata, filename: fileName};

	$.ajax({
		type: "POST",
		url: "../php/feedsource.php",
		contentType: 'application/json; charset=UTF-8',
		dataType: "json",
		data: JSON.stringify(parms),
		success: function (response) {
			if(response[0] == 'success'){
				if(winlocpath.includes("/fr")) {
					$('.alertText').html(response[1]);
				} else {
					$('.alertText').html(response[1]);
				}
//				$('#myModalAddSource').modal('hide');
				getAllSources();
				$('#csvspinner').hide();
			} 
		},
		error: function () {
			$('#csvspinner').hide();
			alert("Error!");
		}
	});
	$('#sourceCSV').val("");
}

function doConfirm() {
	$("#myConfirm").modal("show");
}
function doDeleteScedule() {
	id = selectedID;
	var parms = {operation: "deleteSource", id: id};

	$.ajax({
		type: "POST",
		url: "../php/feedsource.php",
		contentType: 'application/json; charset=UTF-8',
		dataType: "json",
		data: JSON.stringify(parms),
		success: function (response) {
			if(response[0] == 'success'){
				$("#myConfirm").modal("hide");
				if(winlocpath.includes("/fr")) {			
					$('.alertText').html("La source a été supprimée!");
				} else {
					$('.alertText').html('Source has been deleted!');
				}
				getAllSources();
			} else {
				if(winlocpath.includes("/fr")) {			
					$('.alertText').html("La source n'a pas pu être supprimée!");
				} else {
					$('.alertText').html('Source could not be deleted!');
				}
			}
		},
		error: function () {
			alert("Error!");
		}
	});
	
}

function doUpdateSource(id) {
	
	if($('#fmtype2').val()!=null) {fmtype = $('#fmtype2').val()} else {fmtype=""} ;
	if(fmtype=="Sites Internet") {fmtype="Websites"};
	if($('#fmsource2').val()!=null) {fmsource = $('#fmsource2').val()} else {fmsource=""} ;
	if($('#fmname2').val()!=null) {fmname = $('#fmname2').val()} else {fmname=""};
	if($('#fmurl2').val()!=null) {fmurl = $('#fmurl2').val()} else {fmurl=""};
	if($('#fmschedule2').val()!=null) {fmschedule = $('#fmschedule2').val()} else {fmschedule=""};
	if($('#fmhour2').val()!=null) {fmhour = $('#fmhour2').val()} else {fmhour=""};
	if($('#fmday2').val()!=null) {fmday = $('#fmday2').val()} else {fmday=""};

	var parms = {operation: "updateSource", id: id, fmtype: fmtype, fmsource: fmsource, fmname: fmname, fmurl: fmurl, fmschedule: fmschedule, fmhour: fmhour, fmday: fmday};

	$.ajax({
		type: "POST",
		url: "../php/feedsource.php",
		contentType: 'application/json; charset=UTF-8',
		dataType: "json",
		data: JSON.stringify(parms),
		success: function (response) {
			if(response[0] == 'success'){
				if(winlocpath.includes("/fr")) {			
					$('.alertText').html("La source a été mise à jour!");
				} else {
					$('.alertText').html('Source has been updated!');
				}
				getAllSources();
			} else {
				if(winlocpath.includes("/fr")) {			
					$('.alertText').html("La source n'a pas pu être mise à jour!");
				} else {
					$('.alertText').html('Source could not be updated!');
				}
			}
		},
		error: function () {
			alert("Error!");
		}
	});
	
}

function setUsersPerTimeConfig(top10users) {
/*       TEMPORARY to fix data  */
//topuserspertime=[];
/* ------ */
	tmparr=[];
	for(i=0; i<top10users.length; i++) {
		tmparr.push(top10users[i].key);
	}
	let theseries = [];
	let datearr = [];
	let usersarr = [];
	for(i=0; i<topuserspertime.length; i++) {
		for(j=0; j<topuserspertime[i].Networks.buckets.length; j++) {
			if(tmparr.includes(topuserspertime[i].Networks.buckets[j].key)) {
				datearr.push([topuserspertime[i].key_as_string.replace(" 00:00:00",""), topuserspertime[i].Networks.buckets[j].doc_count, topuserspertime[i].Networks.buckets[j].key]);
				userexists = false;
				for(k=0; k< usersarr.length; k++) {
					if(usersarr[k] == topuserspertime[i].Networks.buckets[j].key ) {
						userexists = true;
					}
				}
				if(userexists == false) {
					usersarr.push(topuserspertime[i].Networks.buckets[j].key);
				}
			}
		}
	}
	let bydate = datearr.sort(sortByDate);
	let uniqDate = [];
	
	for(i=0; i<bydate.length;i++) {
		dateexist=false;
		for(k=0; k<uniqDate.length;k++) {
			if(bydate[i][0] == uniqDate[k].replace(" 00:00:00","")) {
				dateexist=true;
			}
		}
		if(dateexist==false) {
			uniqDate.push(bydate[i][0].replace(" 00:00:00",""));
		}
	}
		
	let thelabels = [];
	
	for(i=0; i<usersarr.length; i++) {
		networkname = usersarr[i];
		let valarray = [];
		let theval = 0;
		let thedate="";
		for(j=0; j<uniqDate.length; j++) {
			thedate = uniqDate[j];
			theval=0;
			for(k=0; k<bydate.length;k++) {
				if(bydate[k][0]==thedate && bydate[k][2]==networkname) {
					theval = bydate[k][1];
				}
			}
			valarray.push(theval);
		}
		let obj =  {values: valarray,text: networkname, legendItem: {visible: false}};
		theseries.push(obj);
		valarray = [];
	}
	
	for(j=0; j<uniqDate.length; j++) {
		thedate = uniqDate[j];
		thelabels.push(thedate);
	}

	theserieschart5 = theseries;
	thelabelschart5 = thelabels;
	
	getBarConfig(theseries, thelabels);

}

function compareNetworkColumn(a, b) {
    if (a[2] === b[2]) {
        return 0;
    }
    else {
        return (a[2] < b[2]) ? -1 : 1;
    }
}

function sortByDate(a, b) {
    if (a[0] === b[0]) {
        return 0;
    }
    else {
        return (a[0] < b[0]) ? -1 : 1;
    }
}

function doBiggerChart(elid, mycfg) {
	zingchart.render({
	  id: elid,
	  data: mycfg,
	  height: 250,
	  defaults:myTheme
	});
	$(".tile-title").show();
	$("hr").show();
	$("#startspinner").hide();
	
	$("#loading").hide();
	
	$('.container').show();

}

function getBarConfig(theseries, thelabels) {	
	mychartconfig = {
	graphset: [
		{
		type: 'bar',
		backgroundColor: 'transparent',
		title: {
		  text: '',
		  color: '#ffffff',
		  align: 'left',
		  padding: '30 0 0 35'
		},
		subtitle: {
		  text: '',
		  color: '#ffffff',
		  fontWeight: 300,
		  align: 'left',
		  padding: '35 0 0 35'
		},
		tooltip: {
		  visible: false
		},
		crosshairX: {
		  plotLabel: {
			fontColor: '#333',
			backgroundColor: '#fff',
			borderRadius: 5,
			borderColor: '#EEE',
			padding: 10
		  },
		  scaleLabel: {
			fontFamily: 'Georgia'
		  }
		},
		plotarea: {
			margin: '30 1 90 60'
		},
		scaleX: {
		  labels: thelabels,
		  label: {
			color: '#ffffff',
			text: ''
		  },
		  lineColor: '#D8D8D8',
		  tick: {
			visible: false,
			_lineColor: '#ffffff'
		  },
		  item: {
			color: '#ffffff',
			angle: '-35'
		  },

		},
		plot: {
		  stacked: true,
		  'stack-type': "normal"
		},
		scaleY: {
		  lineColor: '#ffffff',
		  guide: {
			lineStyle: 'solid'
		  },
		  tick: {
			lineColor: '#ffffff'
		  },
		  item: {
			color: '#ffffff'
		  },
		  label: {
			padding: '20 0 0 0',
			text: '',
			color: '#ffffff'
		  }
		},
		series: theseries
	  }
	]
	}
}

function doChart(elid, mycfg) {
	// Render Method[3]
	zingchart.render({
	  id: elid,
	  data: mycfg,
	  height: 200,
	  defaults:myTheme
	});
	$(".tile-title").show();
	$("#myspinner").hide();
}

function makeViewDropdown() {
	viewHTML="";
	for(i=0; i<saveddata.length; i++) {
		viewHTML += '<option style="background-color: #000; color: #fff;">'+saveddata[i].name+'</option>';
	}
	document.getElementById("loadname").innerHTML = viewHTML;
}

function makeScheduleTable() {

	maxlastrun="";
	for(i=0; i<scheduledata2.length; i++) {
		if(scheduledata2[i].date_last_run!==null && scheduledata2[i].date_last_run > maxlastrun) {
			maxlastrun = scheduledata2[i].date_last_run;
		}
/*		let tabopts = '<select class="w10 fmschedule" id="'+scheduledata2[i].id+'">';
		let sched = scheduledata2[i].fmschedule;
		if(sched==frarray[0] || sched==enarray[0]) { 
			tabopts += '<option value="1" selected>'+langarr[0]+'</option>';		
		} else { 
			tabopts += '<option value="1" >'+langarr[0]+'</option>'; 
		}
		if(sched==frarray[1] || sched==enarray[1]) { 
			tabopts += '<option  value="2" selected>'+langarr[1]+'</option>';		
		} else { 
			tabopts += '<option value="2" >'+langarr[1]+'</option>'; 
		}
		if(sched==frarray[2] || sched==enarray[2]) { 
			tabopts += '<option  value="3" selected>'+langarr[2]+'</option>';		
		} else { 
			tabopts += '<option value="3" >'+langarr[2]+'</option>'; 
		}
		
		tabopts += '</select>';
		scheduledata[i].fmscheduleopts = tabopts;*/
		
		scheduledata[i].editbtn= '<button id="btn-edit'+scheduledata[i].id+'" onclick="doEditSource('+scheduledata[i].id+');"><i class="far fa-edit"></i></button>';
	}

	document.getElementById("maxlastrun").innerHTML = maxlastrun;
	
	if(schedtable!=="") {
		schedtable
			.clear()
			.rows.add(scheduledata)
			.draw();
	} else {
	schedtable = $('#scheduletable').DataTable( {
		"paging":   true,
		"pagingType": "simple_numbers",
		"language": {
			"paginate": {
				"previous": "&lt;&lt;",
				"next": "&gt;&gt;"
			}
		},
		"ordering": true,
		"info":     true,
		"bLengthChange": false,
		"pageLength": 10,
		"stripeClasses": [],
		"data": scheduledata,
		"columns": [
			{ "width": "3%", "data": "id" },
			{ "width": "5%", "data": "fmtype" },
			{ "width": "10%", "data": "fmsource" },
			{ "width": "10%", "data": "fmname", "className": "padleft" },
			{ "width": "15%", "data": "fmurl" },
			{ "width": "10%", "data": "fmschedule", "className": "colcenter" },
			{ "width": "5%", "data": "fmhour", "className": "colcenter" },
			{ "width": "5%", "data": "fmday", "className": "colcenter" },
//			{ "width": "10%", "data": "fmscheduleopts" },
			{ "width": "5%", "data": "editbtn"}
			]
		});
	}
	
	let th="";
	if(winlocpath.includes("/fr")) {
		th=`<th style="width: 3%;">ID</th>
			<th style="width: 10%; text-align: center;">Type de flux</th>
			<th style="width: 10%; text-align: center;">Source de flux</th>
			<th style="width: 20%; text-align: center;">Nom de la source</th>
			<th style="width: 10%; text-align: center;">URL de flux</th>
			<th style="width: 10%; text-align: center;">Programme de flux</th>
			<th style="width: 10%; text-align: center;">Hour</th>
			<th style="width: 10%; text-align: center;">Day</th>
			<th style="width: 20%; text-align: center;"></th>`;
	} else {
		th=`<th style="width: 3%;">ID</th>
			<th style="width: 10%; text-align: center;">Feed Type</th>
			<th style="width: 10%; text-align: center;">Feed Source</th>
			<th style="width: 20%; text-align: center;">Source Name</th>
			<th style="width: 10%; text-align: center;">Feed URL</th>
			<th style="width: 10%; text-align: center;">Feed Schedule</th>
			<th style="width: 10%; text-align: center;">Hour</th>
			<th style="width: 10%; text-align: center;">Day</th>
			<th style="width: 10%; text-align: center;"></th>`;		
	}

	document.getElementById("scheduletabheadings").innerHTML = th;

}

function doEditSource(id) {
	selectedID = id;
	$('#mySchedule').modal('hide');
	//get this record
	let aSrc;
	let sourceHTML="";
	for(i=0; scheduledata2.length; i++) {
		if(scheduledata2[i].id == id) {
			aSrc = scheduledata2[i];
			break;
		}
	}
	
// fmtype
	let fmtype = aSrc.fmtype;
	let typeopts = "";
		if(fmtype=="Social") { typeopts += '<option selected>Social</option>';		
		} else { typeopts += '<option >Social</option>'; }
		if(fmtype=="Websites") { typeopts += '<option  selected>Websites</option>';		
		} else { typeopts += '<option >Websites</option>'; }
		if(fmtype=="RSS") { typeopts += '<option  selected>RSS</option>';		
		} else { typeopts += '<option >RSS</option>'; }
		if(fmtype=="Forums") { typeopts += '<option  selected>Forums</option>';		
		} else { typeopts += '<option >Forums</option>'; }

// fmschedule
	let sched = aSrc.fmschedule;
	let tabopts = "";
		if(sched==langarr[27]) { tabopts += '<option selected>'+langarr[27]+'</option>';		
		} else { tabopts += '<option >'+langarr[27]+'</option>'; }
		if(sched==langarr[28]) { tabopts += '<option  selected>'+langarr[28]+'</option>';		
		} else { tabopts += '<option >'+langarr[28]+'</option>'; }
		if(sched==langarr[29]) { tabopts += '<option  selected>'+langarr[29]+'</option>';		
		} else { tabopts += '<option >'+langarr[29]+'</option>'; }

		let dayofweek = aSrc.fmday;
		let dayopts = "";
		for(i=1; i<8; i++) {
			if(dayofweek==i) {
				dayopts += '<option value="'+i+'" selected>'+langarr[i + 38]+'</option>';	
			} else {
				dayopts += '<option value="'+i+'" >'+langarr[i + 38]+'</option>';
			}
		}

	// make the edit form html
	sourceHTML=`<div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmtype2" style="min-width: 140px; padding: 5px; outline: transparent;">`+langarr[22]+`:</label>
						<select class="w10" id="fmtype2" required>`;		
	sourceHTML += typeopts;
	
	sourceHTML += `</select>
					  </div>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmsource2" style="min-width: 140px; padding: 5px;">`+langarr[23]+`:</label>
						<input class="w-20" type="text" class="form-control" id="fmsource2" required value="`+aSrc.fmsource+`">
					  </div>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmname2" style="min-width: 140px; padding: 5px;">`+langarr[24]+`:</label>
						<input class="w-20" type="text" class="form-control" id="fmname2" required value="`+aSrc.fmname+`">
					  </div>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmurl2" style="min-width: 140px; padding: 5px;">`+langarr[25]+`:</label>
						<input class="w-20" style="min-width: 400px;" type="text" class="form-control" id="fmurl2" required value="`+aSrc.fmurl+`">
					  </div>
					  <div style="display:flex; flex-direction: row; text-align: left">
						<label for="fmschedule2" style="min-width: 140px; padding: 5px;">`+langarr[26]+`:</label>
						<select class="w10" id="fmschedule2" required>1`;
						
	sourceHTML += tabopts;					
						  
	sourceHTML += `</select></div>`;

	sourceHTML += `<div style="display:flex; flex-direction: row; text-align: left">
		<label for="fmhour2" style="min-width: 140px; padding: 5px;">`+langarr[47]+`:</label>
			<select class="w10" id="fmhour2" >`;

	let hour = aSrc.fmhour;

	for(i=1; i<25; i++) {
		if(i<10) {
			if("0"+i == hour) {
				sourceHTML += `<option selected>0`+i+`</option>`;
			} else {
				sourceHTML += `<option>0`+i+`</option>`;
			}
		} else {
			if(i == hour) {
				sourceHTML += `<option selected>`+i+`</option>`;
			} else {
				sourceHTML += `<option>`+i+`</option>`;
			}
		}
	}

	sourceHTML += `</select></div>`;

	sourceHTML += `<div style="display:flex; flex-direction: row; text-align: left">
					<label for="fmday2" style="min-width: 140px; padding: 5px;">`+langarr[46]+`:</label>
					<select class="w10" id="fmday2" >`;

	sourceHTML += dayopts;
					
	sourceHTML += `</select>
				</div>`;

	sourceHTML += `<br><br><center>
					<button type="submit" class="btn btn-sm btn-secondary" onclick="doUpdateSource(`+aSrc.id+`);" style="min-width: 100px;">`+langarr[49]+`</button>
					<button type="submit" class="btn btn-sm btn-secondary" onclick="doConfirm(`+aSrc.id+`);" style="min-width: 100px;">`+langarr[48]+`</button>
					</center>`;

	document.getElementById("editsourceHTML").innerHTML = sourceHTML;
	$('#myEditSource').modal('show');

	
}

function makeSubCatDropdown() {
/*	sources=[];
	for(i=0; i<scheduledata.length; i++) {
		if(scheduledata[i].fmtargetid > "") {
			sources.push(scheduledata[i].fmtargetid+":"+scheduledata[i].fmsource);
		} else {
			sources.push("m"+scheduledata[i].id+"_"+scheduledata[i].fmtype);
		}
	}*/
	subcatHTML="";
	let optval="";
	if(scheduledata[0]==[]) {
		subcatHTML="";
	} else {
		for(i=0; i<scheduledata.length; i++) {
			if(scheduledata[i].fmtargetid > "") {
				optval = scheduledata[i].id+" "+scheduledata[i].fmname+" TargetID: "+scheduledata[i].fmtargetid;
			} else {
				optval = scheduledata[i].id+" "+scheduledata[i].fmname+" "+scheduledata[i].fmtype;
			}
			subcatHTML +='<option value="'+optval+'" style="background-color: #000; color: #fff;">'+optval+'</option>';
		}
	}
	document.getElementById("subcat").innerHTML = subcatHTML;
}

function setPieSeries(theData, chartname) {
	// get highest first so as to detach
	let tmpval=0;
	for(i=0; i<theData.length; i++) {
		if(theData[i].doc_count > tmpval) {
			tmpval = theData[i].doc_count;
		}		
	}
	if(chartname=="chart1") {
		let apps=0;
		let devarr=[];
		for(i=0; i<theData.length; i++) {
			tmptext = theData[i].key;
			tmptext = tmptext.replace("Twitter for ", "");
			tmptext = tmptext.replace("Twitter ", "");
			tmptext = tmptext.replace("Natural", "Neutral");
			if(tmptext!=="Android" && tmptext!=="iPhone" && tmptext!=="iPad") {
				apps = apps+theData[i].doc_count;
			} else {
				devarr.push({key: theData[i].key, doc_count:theData[i].doc_count});
			}				
		}
		devarr.push({key: "Apps", doc_count: apps});
		theData = devarr;
	}

	let theseries = [];
	let legendHTML = '<table class="table"><tbody>';
	let palind = 0;
	for(i=0; i<theData.length; i++) {
		let arr = [];
		let tmp = {};
		let tmptext = "";
		let tmparr = [];

		if(chartname=="chart3") {
			if(isoLangs[theData[i].key]) { 
				tmptext = isoLangs[theData[i].key].name; 
			}
		} else {
			tmptext = theData[i].key;
			tmptext = tmptext.replace("Twitter for ", "");
			tmptext = tmptext.replace("Twitter ", "");
			tmptext = tmptext.replace("Natural", "Neutral");
		}

		
		arr.push(theData[i].doc_count);
		
		thecolor = "";
		
		if(chartname=="chart2") {
			if(tmptext=="Neutral") {
				thecolor = "#40beeb";
			}
			if(tmptext=="Positive") {
				thecolor = "#71bf32";
			}
			if(tmptext=="Negative") {
				thecolor = "#c94d51";
			}
		}

		if(theData[i].doc_count == tmpval) {
			tmp = {values : arr, backgroundColor: thecolor, text: tmptext, detached: true}; 
		} else {
			tmp = {values : arr, backgroundColor: thecolor, text: tmptext, detached: false}; 
		}
		theseries.push(tmp);

		if(palind==theData.length) { palind=0; }
		let thiscolor = myTheme.palette.pie[palind++][2];
		let theicon="";

		if(chartname=="chart2") {
			if(tmptext=="Neutral") {
				thiscolor = "#40beeb";
				theicon=fa_neutral;
			}
			if(tmptext=="Positive") {
				thiscolor = "#71bf32";
				theicon=fa_positive;
			}
			if(tmptext=="Negative") {
				thiscolor = "#c94d51";
				theicon=fa_negative;
			}
		}

		let dotstyle='background: '+thiscolor+';';

		if(tmptext=="Android") { theicon=fa_android; } 
		if(tmptext=="iPhone") { theicon=fa_apple; } 
		if(tmptext=="iPad") { theicon=fa_apple; } 
		if(tmptext=="Apps") { theicon=fa_apps; } 
		if(tmptext=="Instagram") { theicon=fa_instagram; } 
		if(tmptext=="Twitter") { theicon=fa_twitter; } 
		if(tmptext=="Facebook") { theicon=fa_facebook; } 
		if(tmptext=="Telegram") { theicon=fa_telegram; } 
		if(tmptext=="Viber") { theicon=fa_viber; } 
		if(tmptext=="VKontakte") { theicon=fa_vk; } 
		if(tmptext=="RSS") { theicon=fa_rss; } 
		if(tmptext=="NewsContent") { theicon=fa_newscontent; } 
		if(tmptext=="WhatsApp") { theicon=fa_whatsapp; } 
		if(tmptext=="YouTube") { theicon=fa_youtube; } 

		if(chartname=="chart1") {
			legendHTML += '<tr data-toggle="tooltip" title="'+theData[i].doc_count+'" style="font-size: 12px;"><td class="square-social" style="'+dotstyle+'"></td><td>'+theicon+'</td><td>'+tmptext+'</td></tr>';
		} else if(chartname=="chart2") {
			legendHTML += '<tr data-toggle="tooltip" title="'+theData[i].doc_count+'" style="font-size: 12px;"><td class="square-social" style="'+dotstyle+'"></td><td>'+theicon+'</td></td><td>'+tmptext+'</td></tr>';
		} else if(chartname=="chart3" || chartname=="chart3") {
			legendHTML += '<tr data-toggle="tooltip" title="'+theData[i].doc_count+'" style="font-size: 12px;"><td class="square-social" style="'+dotstyle+'"></td><td>'+tmptext+'</td></tr>';
		} else if(chartname=="chart4") {															
			legendHTML += '<tr data-toggle="tooltip" title="'+theData[i].doc_count+'" style="font-size: 12px;"><td class="square-social" style="'+dotstyle+'"></td></td><td>'+theicon+'</td><td>'+tmptext+'</td></tr>';
		} 
	}

	legendHTML += '</tbody></table>';
	elname = chartname+"legend";
//	document.getElementById(elname).innerHTML = legendHTML;
	
	getPieConfig(theseries);
	
}

function getPieConfig(theseries) {	
mychartconfig = {
	 gui:{
		watermark:{
			position:"bl"
		}
	},
	graphset:[
		{
			type:"pie",
			backgroundColor:"transparent",
			borderColor:"transparent",
			borderWidth:0,
			width:"100%",
			height:"200px",
			plotarea:{
				marginTop:"2%",
				marginRight:"1%",
				marginLeft:"1%",
				marginBottom:"1%",
				x:"0",
				y:"0"
			},
			plot:{
				legendItem:{
					marginBottom:0,
					marginTop:0
				},
				valueBox:{
					fontSize:12,
					fontWeight:"900",
					placement:"out",
					text:"%t\n%npv%",
					offsetR:"0",
					connector:{
						visible:true
					}
				},
				borderWidth:0,
				borderColor:"#eee"
			},
			series: theseries
		}
	]
	}
}

function exportTable() {

	let mycsv = 'ID,Time,Type,Pic URL,Name and ID,Content,Tags,Engagements,Sentiment,Link'+"\n";
	for(i=0; i<rawdata.length; i++) {

//		rawdata[i].created_at = rawdata[i].created_at.replace(" ","\r\n");

		if(typeof rawdata[i].user_name !== 'undefined') {
			rawdata[i].user_name = rawdata[i].user_name+" ("+rawdata[i].user_id+")";
		} else {
			rawdata[i].user_name = "("+rawdata[i].user_id+")";			
		}
		
		tmpdesc = "";
		if(typeof rawdata[i].title !== 'undefined' && rawdata[i].title && rawdata[i].title>"") {
			tmpdesc += 'Title: '+rawdata[i].title+'\r\n';			
		}
		if(typeof rawdata[i].description !== 'undefined' && rawdata[i].description && rawdata[i].description>"") {
			tmpdesc += 'Content: '+rawdata[i].description.replace("â€","");
		}
		rawdata[i].description = tmpdesc;
		
		rawdata[i].engagements = "";
		if((typeof rawdata[i].like_count !== 'undefined') && rawdata[i].like_count>'0') {
			rawdata[i].engagements = 'Likes '+rawdata[i].like_count+' ';
		} 
		if((typeof rawdata[i].comment_count !== 'undefined') && rawdata[i].comment_count>'0') {
			rawdata[i].engagements += 'Comments '+rawdata[i].comment_count+' ';
		}
		rawdata[i].engagements += '\n';
		if((typeof rawdata[i].retweet_count !== 'undefined') && rawdata[i].retweet_count>'0') {
			rawdata[i].engagements += 'Retweets '+rawdata[i].retweet_count+' ';
		}
		if((typeof rawdata[i].shared_count !== 'undefined') && rawdata[i].shared_count>'0') {
			rawdata[i].engagements += 'Shared '+rawdata[i].shared_count;
		}

		let htags = "";
		let mention = false;
		if(typeof rawdata[i].text_entities_extra !== 'undefined') {
			let textentities = rawdata[i].text_entities_extra;
			for(j=0; j<textentities.length; j++) {
				if(textentities[j].type=="mention") {
					mention=true;
				} 
				if(textentities[j].type=="hashtag") {
					htags += textentities[j].text+" ";
				}
			}
			htags.trim();
		}
		rawdata[i].tags="";
		if(mention && htags>"") {
			let ht = htags.split(" ");
			for(k=0; k<ht.length; k++) {
				if(ht[k]!==" " && ht[k]!=="") rawdata[i].tags += ht[k]+' ';
			}
		} 
		let tabcnt = i+1;

		if(!rawdata[i].sentiment || rawdata[i].sentiment=='undefined') {
			rawdata[i].sentiment="Neutral";
		}

		if(rawdata[i].description) {
			rawdata[i].description = rawdata[i].description.replace(/\r\n|\n|\r/g, " ");
		}

		mycsv += '"'+tabcnt+'","'+rawdata[i].created_at+'","'+rawdata[i].social_network+'","'+rawdata[i].pic_url+'","'+rawdata[i].user_name+'","'+rawdata[i].description+'","'+rawdata[i].tags+'","'+rawdata[i].engagements+'","'+rawdata[i].sentiment.replace("Natural","Neutral")+'","'+rawdata[i].marker_url+'"'+"\n";
	}
	
    downloadCSV(mycsv, "FeedMonitor.csv");

}

function downloadCSV(csv, filename) {
    var csvFile;
    var downloadLink;

    // CSV file
    csvFile = new Blob(['\uFEFF', csv], {type: "text/csv"});

    // Download link
    downloadLink = document.createElement("a");

    // File name
    downloadLink.download = filename;

    // Create a link to the file
    downloadLink.href = window.URL.createObjectURL(csvFile);

    // Hide download link
    downloadLink.style.display = "none";

    // Add the link to DOM
    document.body.appendChild(downloadLink);

    // Click download link
    downloadLink.click();
}
