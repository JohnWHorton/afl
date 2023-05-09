/*
var weblang="en";
var enarray = ["Hourly","Daily","Weekly","Hour","Day","","","","","","",""] ;
var frarray = ["Horaire","Quotidien","Hebdomadaire","","","","","","","","",""];
var langarr;
*/
var winlocpath;
var hostname = "";

var scheduledata = [];
var scheduledata2 = [];
var scname = "";
var scperiod = "";
var schour = "";
var scday = "";
var scminute = "00";
var scnode_ip = "127.0.0.1";
var scdata = {};

var schedtable = "";

var addsrctext = "";
var fmoperation = "getall";
var results;

var initdate = true;
var today = new Date();
var dd = String(today.getDate()).padStart(2, "0");
var mm = String(today.getMonth() + 1).padStart(2, "0"); //January is 0!
var yyyy = today.getFullYear();
today = yyyy + "-" + mm + "-" + dd;
var todate = today;
var initfromdate = new Date();
initfromdate.setDate(initfromdate.getDate() - 60);
dd = String(initfromdate.getDate()).padStart(2, "0");
mm = String(initfromdate.getMonth() + 1).padStart(2, "0");
yyyy = initfromdate.getFullYear();
var fromdate = yyyy + "-" + mm + "-" + dd;

$.ajax({
  type: 'GET',
  url: '../../api.php',
  dataType: 'json',
  contentType: false,
  cache: false,
  xhrFields: {
    withCredentials: true
  },

  complete: function (xhr) {
    console.log("complete xhr", xhr.status)
    if (xhr.status == 401) {
      window.open("https://login.rogueeye.systems/login.php.", "_self");
    }
  }
})

$(document).ready(function () {
  getData();
});

function updateSchedule(id, newSchedule) {
  var parms = { operation: "updateSchedule", id: id, newSchedule: newSchedule };

  $.ajax({
    type: "POST",
    url: "../php/feedsource.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) { },
    error: function () {
      alert("Error!");
    },
  });
}
function getData() {
  $("#myspinner").show();

  var settings = {
    url: "http://195.154.17.15:9045/api/v1/jobs",
    method: "GET",
    timeout: 0,
  };

  $.ajax(settings).done(function (response) {
    console.log(response);

    scheduledata = response;
    scheduledata2 = [...scheduledata];
    makeScheduleTable();
  });

  $("#myspinner").hide();
}
function showEditSource(id) {
  $(".alertText").html("");
  $("#mySchedule").modal("hide");
  $("#myEditSource").modal({ backdrop: "static", keyboard: false });
  $("#myEditSource").modal("show");
  //	doEditSource(id);
}
function showConfirm() {
  $(".alertText").html("");
  $("#myConfirm").modal({ backdrop: "static", keyboard: false });
  $("#myConfirm").modal("show");
  //	makeViewDropdown(saveddata);
}
function showSchedule() {
  $(".alertText").html("");
  $("#mySchedule").modal({ backdrop: "static", keyboard: false });
  $("#mySchedule").modal("show");
  schedtable = $("#scheduletable").DataTable();
  $("#scheduletable").css("display", "block");
  schedtable.columns.adjust().draw();
}
function doGoBtn() {
  if ($("#subcat").val() != null) {
    getSelectedSources();
  } else {
    getAllSources();
  }
}
function getAllSources() {
  if ($("#subcat").val() != null) {
    subcat = $("#subcat").val();
  } else {
    subcat = [];
  }

  var parms = { operation: "getall", fldtypes: fldtypes, subcat: subcat };

  $.ajax({
    type: "POST",
    url: "../php/feedsource.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      // scheduledata = response.sources;
      scheduledata2 = [...scheduledata];
      sources = [];
      maxlastrun = "";
      //			scheduledata2=[];
      for (i = 0; i < scheduledata.length; i++) {
        scheduledata2.push(scheduledata[i]);
        if (scheduledata[i].fmtargetid > "") {
          sources.push(
            scheduledata[i].fmtargetid + ":" + scheduledata[i].fmsource
          );
        } else {
          sources.push("m" + scheduledata[i].id + "_" + scheduledata[i].name);
        }
        if (
          scheduledata[i].date_last_run !== null &&
          scheduledata[i].date_last_run > maxlastrun
        ) {
          // maxlastrun = scheduledata[i].date_last_run;
        }
      }
      // document.getElementById("maxlastrun").innerHTML = maxlastrun;
      // saveddata = response.saved;
      // document.getElementById("moncnt").innerHTML = scheduledata.length;
      //			console.log(scheduledata);
      //			console.log(saveddata);
      // makeSubCatDropdown();
      // makeScheduleTable();
      // getData();
    },
    error: function () {
      alert("Error!");
    },
  });
}
function compareNetworkColumn(a, b) {
  if (a[2] === b[2]) {
    return 0;
  } else {
    return a[2] < b[2] ? -1 : 1;
  }
}
function sortByDate(a, b) {
  if (a[0] === b[0]) {
    return 0;
  } else {
    return a[0] < b[0] ? -1 : 1;
  }
}
function doConfirm() {
  $("#myConfirm").modal("show");
}
function doDeleteScedule() {
  id = selectedID;
  var parms = { operation: "deleteSource", id: id };

  $.ajax({
    type: "POST",
    url: "../php/feedsource.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      if (response[0] == "success") {
        $("#myConfirm").modal("hide");
        if (winlocpath.includes("/fr")) {
          $(".alertText").html("La source a été supprimée!");
        } else {
          $(".alertText").html("Source has been deleted!");
        }
        getAllSources();
      } else {
        if (winlocpath.includes("/fr")) {
          $(".alertText").html("La source n'a pas pu être supprimée!");
        } else {
          $(".alertText").html("Source could not be deleted!");
        }
      }
    },
    error: function () {
      alert("Error!");
    },
  });
}
function doUpdateSource(id) {
  // if ($("#name2").val() != null) {
  scname = $("#scname").val();
  // } else {
  // scname = "";
  // }
  // if ($("#fmname2").val() != null) {
  //   fmname = $("#fmname2").val();
  // } else {
  //   fmname = "";
  // }
  // if ($("#fmurl2").val() != null) {
  //   fmurl = $("#fmurl2").val();
  // } else {
  //   fmurl = "";
  // }
  // if ($("#fmschedule2").val() != null) {
  scperiod = $("#scperiod").val();
  // } else {
  //   fmschedule = "";
  // }
  // if ($("#fmhour2").val() != null) {
  schour = $("#schour").val();
  // } else {
  //   fmhour = "";
  // }
  // if ($("#fmday2").val() != null) {
  scday = $("#scday").val();
  // } else {
  //   fmday = "";
  // }

  var parms = {
    name: scname,
    period: scperiod,
    hour: schour,
    day: scday,
    minute: scminute,
    node_ip: scnode_ip,
    data: scdata,
  };

  $.ajax({
    type: "PUT",
    url: "http://195.154.17.15:9045/api/v1/update/" + id,
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify({
      "name": "DgheF",
      "period": "weekly",
      "hour": "21",
      "day": "5",
      "minute": "55",
      "node_ip": "127.0.0.1",
      "data": {
        "spider_id": "www.anime-planet.com",
        "project_id": "6GHJ66",
        "target_id": "666",
        "port": "9001",
        "sample_id": "DSD",
        "operator_id": "21",
        "scrape_url": "kokos.com"
      }
    }),
    success: function (response) {
      scheduledata = response;
      scheduledata2 = [...scheduledata];
      // makeScheduleTable();
    },
    error: function () {
      alert("Error!");
    },
  });

  console.log("hello");
}
function makeScheduleTable() {
  // 	maxlastrun="";
  for (i = 0; i < scheduledata2.length; i++) {
    // if (
    //   scheduledata2[i].date_last_run !== null &&
    //   scheduledata2[i].date_last_run > maxlastrun
    // ) {
    //   maxlastrun = "";  //scheduledata2[i].date_last_run;
    // }
    let tabopts =
      '<select class="w10 fmschedule" id="' + scheduledata2[i].id + '">';
    let targetid = scheduledata2[i].fmschedule;
    // if(targetid==frarray[0] || targetid==enarray[0]) {
    // 	tabopts += '<option value="1" selected>'+langarr[0]+'</option>';
    // } else {
    tabopts += '<option value="1" >' + langarr[0] + "</option>";
    // }
    // if(targetid==frarray[1] || targetid==enarray[1]) {
    // 	tabopts += '<option  value="2" selected>'+langarr[1]+'</option>';
    // } else {
    tabopts += '<option value="2" >' + langarr[1] + "</option>";
    // }
    // if(targetid==frarray[2] || targetid==enarray[2]) {
    // 	tabopts += '<option  value="3" selected>'+langarr[2]+'</option>';
    // } else {
    tabopts += '<option value="3" >' + langarr[2] + "</option>";
    // }

    tabopts += "</select>";
    scheduledata[i].fmscheduleopts = tabopts;

    scheduledata[i].editbtn =
      '<button id="btn-edit' +
      scheduledata[i].id +
      '" onclick="doEditSource(' +
      scheduledata[i].id +
      ');"><i class="far fa-edit"></i></button>';
  }

  // document.getElementById("maxlastrun").innerHTML = maxlastrun;

  if (schedtable !== "") {
    schedtable.clear().rows.add(scheduledata).draw();
  } else {
    schedtable = $("#scheduletable").DataTable({
      paging: true,
      pagingType: "simple_numbers",
      language: {
        paginate: {
          previous: "&lt;&lt;",
          next: "&gt;&gt;",
        },
      },
      ordering: false,
      info: true,
      bLengthChange: false,
      pageLength: 10,
      stripeClasses: [],
      data: scheduledata,
      columns: [
        { width: "3%", data: "id" },
        { width: "5%", data: "name" },
        { width: "4%", data: "target_id" },
        // { width: "10%", data: "schedule" },
        // { width: "10%", data: "next_run", className: "padleft" },
        { width: "20%", data: "scrape_url", className: "padleft" },
        { width: "10%", data: "period", className: "colcenter" },
        { width: "5%", data: "hour", className: "colcenter" },
        { width: "5%", data: "day", className: "colcenter" },
        { width: "5%", data: "minute", className: "colcenter" },
        { width: "5%", data: "is_active", className: "colcenter" },
        { width: "5%", data: "editbtn" },
      ],
    });
  }

  let th = "";
  // if(winlocpath.includes("/fr")) {
  // 	th=`<th style="width: 3%;">ID</th>
  // 		<th style="width: 10%; text-align: center;">Type de flux</th>
  // 		<th style="width: 10%; text-align: center;">Source de flux</th>
  // 		<th style="width: 20%; text-align: center;">Nom de la source</th>
  // 		<th style="width: 10%; text-align: center;">URL de flux</th>
  // 		<th style="width: 10%; text-align: center;">Programme de flux</th>
  // 		<th style="width: 10%; text-align: center;">Hour</th>
  // 		<th style="width: 10%; text-align: center;">Day</th>
  // 		<th style="width: 20%; text-align: center;"></th>`;
  // } else {
  th = `<th style="width: 3%;">ID</th>
			<th style="width: 10%; text-align: center;">name</th>
			<th style="width: 10%; text-align: center;">target id</th>
			<th style="width: 20%; text-align: center;">scrape url</th>
			<th style="width: 10%; text-align: center;">period</th>
			<th style="width: 10%; text-align: center;">hour</th>
			<th style="width: 10%; text-align: center;">day</th>
			<th style="width: 10%; text-align: center;">minute</th>
			<th style="width: 10%; text-align: center;">is active</th>
			<th style="width: 10%; text-align: center;"></th>`;
  // }

  document.getElementById("scheduletabheadings").innerHTML = th;
}
function doEditSource(id) {
  selectedID = id;
  $("#mySchedule").modal("hide");
  //get this record
  let aSrc;
  let sourceHTML = "";
  for (i = 0; scheduledata2.length; i++) {
    if (scheduledata2[i].id == id) {
      aSrc = scheduledata2[i];
      break;
    }
  }

  scname = aSrc.name;
  target_id = aSrc.target_id;
  scday = aSrc.day;
  scperiod = aSrc.period;
  schour = aSrc.hour;

  let dayopts = "";
  for (i = 1; i < 8; i++) {
    if (scday == i) {
      dayopts +=
        '<option value="' + i + '" selected>' + langarr[i + 38] + "</option>";
    } else {
      dayopts += '<option value="' + i + '" >' + langarr[i + 38] + "</option>";
    }
  }
  let sched = aSrc.period;
  let tabopts = "";
  if (sched == langarr[27]) {
    tabopts += "<option selected>" + langarr[27] + "</option>";
  } else {
    tabopts += "<option >" + langarr[27] + "</option>";
  }
  if (sched == langarr[28]) {
    tabopts += "<option  selected>" + langarr[28] + "</option>";
  } else {
    tabopts += "<option >" + langarr[28] + "</option>";
  }
  if (sched == langarr[29]) {
    tabopts += "<option  selected>" + langarr[29] + "</option>";
  } else {
    tabopts += "<option >" + langarr[29] + "</option>";
  }

  // make the edit form html
  sourceHTML =
    `<div style="display:flex; flex-direction: row; text-align: left">
		<label for="scname" style="min-width: 140px; padding: 5px; outline: transparent;">Name:</label>
		<input class="w10" id="scname" readonly value=` +
    scname +
    `>
	</div>
	<div style="display:flex; flex-direction: row; text-align: left">
		<label for="target_id" style="min-width: 140px; padding: 5px; outline: transparent;">` +
    `Target ID:` +
    `</label>
		<input class="w10" id="target_id" readonly value=` +
    target_id +
    `>
	</div>`;

  sourceHTML +=
    `<div style="display:flex; flex-direction: row; text-align: left">
		<label for="scperiod" style="min-width: 140px; padding: 5px;">` +
    `Schedule Period: </label>
		<select class="w10" id="scperiod" required>`;
  sourceHTML += tabopts;

  sourceHTML += `</select></div>`;

  sourceHTML +=
    `<div style="display:flex; flex-direction: row; text-align: left">
		<label for="schour" style="min-width: 140px; padding: 5px;">` +
    langarr[47] +
    `:</label>
			<select class="w10" id="schour" >`;

  // let hour = aSrc.hour;

  for (i = 0; i < 24; i++) {
    if (i < 10) {
      if ("0" + i == schour) {
        sourceHTML += `<option selected>0` + i + `</option>`;
      } else {
        sourceHTML += `<option>0` + i + `</option>`;
      }
    } else {
      if (i == schour) {
        sourceHTML += `<option selected>` + i + `</option>`;
      } else {
        sourceHTML += `<option>` + i + `</option>`;
      }
    }
  }

  sourceHTML += `</select></div>`;

  sourceHTML +=
    `<div style="display:flex; flex-direction: row; text-align: left">
					<label for="scday" style="min-width: 140px; padding: 5px;">` +
    langarr[46] +
    `:</label>
					<select class="w10" id="scday" >`;

  sourceHTML += dayopts;

  sourceHTML += `</select>
				</div>`;

  sourceHTML +=
    `<br><br><center>
					<button class="btn btn-sm btn-secondary" onclick="doUpdateSource(` +
    aSrc.id +
    `);" style="min-width: 100px;">` +
    langarr[49] +
    `</button>
					<button class="btn btn-sm btn-secondary" onclick="doConfirm(` +
    aSrc.id +
    `);" style="min-width: 100px;">` +
    langarr[48] +
    `</button>
					</center>`;

  document.getElementById("editsourceHTML").innerHTML = sourceHTML;
  $("#myEditSource").modal("show");
}
