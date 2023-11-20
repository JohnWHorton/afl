// var winlocpath;
// var hostname = "";
var tableleft = "";
var tableright = "";
var game = 1;
var radiogrp = 1;
var selectedgames = [];
var logemail = "";
var logpword = "";
var chkbox = false;
var loggedin = false;
var regemail = "";
var regpwrd = "";
var repregpword = "";
var modal = document.getElementById("loginbox");
var modal2 = document.getElementById("loginbox");

var itemNumber = "BET20";
var itemName = "Pool ticket";
var itemPrice = "30";
var currency = "AUD";
var depamt = "0";
var depcurr = "AUD";
var rndvalcode = 0;
var checkedcnt = 0;

var games = [
  {
    gameid: "4787",
    homename: "Richmond",
    homeimg: "Richmond.svg",
    awayname: "Carlton",
    awayimg: "Carlton.svg",
  },
  {
    gameid: "4786",
    homename: "Geelong Cats",
    homeimg: "GeelongCats.svg",
    awayname: "Collingwood",
    awayimg: "Collingwood.svg",
  },
  {
    gameid: "4785",
    homename: "North Melbourne",
    homeimg: "NorthMelbourne.svg",
    awayname: "West Coast Eagles",
    awayimg: "WestCoastEagles.svg",
  },
  {
    gameid: "4788",
    homename: "Port Adelaide",
    homeimg: "PortAdelaide.svg",
    awayname: "Brisbane Lions",
    awayimg: "BrisbaneLions.svg",
  },
  {
    gameid: "4791",
    homename: "Melbourne",
    homeimg: "Melbourne.svg",
    awayname: "Western Bulldogs",
    awayimg: "WesternBulldogs.svg",
  },
  {
    gameid: "4789",
    homename: "Gold Coast Suns",
    homeimg: "GoldCoastSuns.svg",
    awayname: "Sydney Swans",
    awayimg: "SydneySwans.svg",
  },
  {
    gameid: "4790",
    homename: "GWS Giants",
    homeimg: "GWSGiants.svg",
    awayname: "Adelaide Crows",
    awayimg: "AdelaideCrows.svg",
  },
  {
    gameid: "4792",
    homename: "Hawthorn",
    homeimg: "Hawthorn.svg",
    awayname: "Essendon",
    awayimg: "Essendon.svg",
  },
  {
    gameid: "4793",
    homename: "St Kilda",
    homeimg: "StKilda.svg",
    awayname: "Fremantle",
    awayimg: "Fremantle.svg",
  },
];

$(document).ready(function () {
  setLocalStorage();

  document.getElementById("welcome").innerHTML = "Welcome to the game";

  for (i = 0; i < games.length; i++) {
    let gameid = games[i].gameid;
    let homename = games[i].homename;
    let homeimg = games[i].homeimg;
    let awayname = games[i].awayname;
    let awayimg = games[i].awayimg;
    if (i < 5) {
      tableleft +=
        `
    <tr>
    <td>
      <div>        
          <input class="agame" id="` +
        gameid +
        `" 
            onchange="gameSelected('${gameid}')" 
            type="checkbox" class="form-check-input" value="">Game ${game++}       
        </div>
    </td>
    <td><img src="./images/` +
        homeimg +
        `" alt="` +
        homename +
        `" width="100" height="100"></td>
    <td style="font-size: 2rem;font-weight: 700;">VS</td>
    <td><img src="./images/` +
        awayimg +
        `" alt="` +
        awayname +
        `" width="100" height="100"></td>
    <td>
      <div class="form-check">
        <label class="form-check-label">
          <input id=${homename.replaceAll(" ","")}
          type="radio" class="form-check-input" name="optradio${radiogrp}"
          onclick="setWinner('${gameid}', '${homename}')"
          style="font-size: 20px;">` +
        homename +
        `
        </label>
        </div>
        <div class="form-check">
        <label class="form-check-label">
        <input id=${awayname.replaceAll(" ","")} 
        type="radio" class="form-check-input" name="optradio${radiogrp++}"         
        onclick="setWinner('${gameid}', '${awayname}')"
        style="font-size: 20px;">` +
        awayname +
        `
        </label>
      </div>
    </td>
    </tr>
   `;
    } else {
      tableright +=
        `
      <tr>
      <td>
        <div class="form-check">
            <label class="form-check-label">
              <input class="agame" id="` +
        gameid +
        `"  
        onchange="gameSelected('${gameid}')"
        type="checkbox" class="form-check-input" value="">
              <span style="padding-top: 15px;">Game ${game++}</span>
            </label>
            </div>
        </td>
        <td><img src="./images/` +
        homeimg +
        `" alt="` +
        homename +
        `" width="100"
          height="100"></td>
        <td style="font-size: 2rem;font-weight: 700;">VS</td>
        <td><img src="./images/` +
        awayimg +
        `" alt="` +
        awayname +
        `" width="100"
          height="100"></td>
        <td>
          <div class="form-check">
            <label class="form-check-label">
              <input id=${homename.replaceAll(" ","")} 
              type="radio" class="form-check-input" name="optradio${radiogrp}" 
              onclick="setWinner('${gameid}', '${homename}')"
              style="font-size: 20px;">` +
        homename +
        `
            </label>
            </div>
            <div class="form-check">
            <label class="form-check-label">
              <input id=${awayname.replaceAll(" ","")} 
              type="radio" class="form-check-input" name="optradio${radiogrp++}"               
              onclick="setWinner('${gameid}', '${awayname}')"
              style="font-size: 20px;">` +
        awayname +
        `
            </label>
            </div>
        </td>
      </tr> `;
    }
    games.checked = false;
    games.winner = "";
  }
  console.log("games", games);
  // console.log("tableright", tableright);
  document.getElementById("tableleft").innerHTML = tableleft;
  document.getElementById("tableright").innerHTML = tableright;

  let file = "fetch_info.txt";
  fetch(file)
    .then((x) => x.text())
    .then((y) => (document.getElementById("info").innerHTML = y));
});

function showHideLoginbox() {
  if ($("#loginbox").is(":visible")) {
    $("#loginbox").hide();
  } else {
    $("#loginbox").show();
    $("#registerbox").hide();
  }
}
function setLocalStorage(userdata) {
  localStorage.setItem("aflemail", "Obaseki Nosa");
  localStorage.setItem("aflpassword", "abcdefgh");
}

function loginEvent() {
  // e.preventDefault();

  logemail = $("#lemail").val();
  logpword = $("#lpassword").val();

  if ($("#defaultCheck1").is(":checked")) {
    chkbox = true;
  } else {
    chkbox = false;
  }

  console.log(logemail);
  console.log(logpword);
  console.log(chkbox);

  var parms = { operation: "loginUser", email: logemail, pswd: logpword };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      if (response.length == 0) {
        $(".msg").html("Login is incorrect. Try again");
        $(".msgcontainer").show();
        logemail = "";
        logpword = "";
        loggedin = false;
      } else {
        $("#loginbox").hide();
        document.getElementById("welcome").innerHTML = `Welcome ${logemail}`;
        loggedin = true;
      }
    },
    error: function () {
      $(".msg").html("Error");
      $(".msgcontainer").show();
    },
  });
}
function registerEvent() {
  // loginemail=document.getElementById("emailaddress").value;
  regemail = $("#remail").val();
  regpwrd = $("#rpassword").val();
  repregpword = $("#rrpassword").val();

  console.log(regemail);
  console.log(regpwrd);
  console.log(repregpword);

  if ((regpwrd > "") & (regpwrd == repregpword)) {
    var parms = { operation: "addUser", email: regemail, pswd: regpwrd };

    $.ajax({
      type: "POST",
      url: "./php/afldb.php",
      contentType: "application/json; charset=UTF-8",
      dataType: "json",
      data: JSON.stringify(parms),
      success: function (response) {
        if (response[1] == "exists") {
          console.log("response", response);
          $(".msg").html("User already exists, please login");
          $(".msgcontainer").show();
          $("#loginbox").show();
          $("#registerbox").hide();
        }
        if (response[0] == "success") {
          $("#loginbox").hide();
          $("#registerbox").hide();
          logemail = regemail;
          document.getElementById("welcome").innerHTML = `Welcome ${logemail}`;
          loggedin = true;
        }
      },
      error: function (xhr, textStatus, error) {
        console.log(xhr.statusText);
        console.log(textStatus);
        console.log(error);
      },
    });
  } else {
    $(".msg").html("Invalid password or passwords do not match");
    $(".msgcontainer").show();
  }
}
function resetPassword() {
  regemail = $("#remail").val();
  regpwrd = $("#newpword").val();
  repregpword = $("#rnewpword").val();

  console.log(regemail);
  console.log(regpwrd);
  console.log(repregpword);

  if ((regpwrd > "") & (regpwrd == repregpword)) {
    var parms = { operation: "resetPassword", email: regemail, pswd: regpwrd };

    $.ajax({
      type: "POST",
      url: "./php/afldb.php",
      contentType: "application/json; charset=UTF-8",
      dataType: "json",
      data: JSON.stringify(parms),
      success: function (response) {
        if (response[0] == "success") {
          $("#forgotbox").hide();
          $("#registerbox").hide();
          $("#loginbox").show();
        } else {
          console.log("reset error", response[1]);

          $(".msgcontainer").show();
          $(".msg").html("reset failed. see log");
          $(".msgcontainer").show();
        }
      },
      error: function () {
        $(".msg").html("Error");
        $(".msgcontainer").show();
      },
    });
  } else {
    $(".msg").html("Invalid password or passwords do not match");
    $(".msgcontainer").show();
  }
}
function forgotPassword() {
  rndvalcode = Math.trunc(Math.random() * (999999 - 111111) + 111111);
  let toemail = $("#lemail").val();
  console.log("toemail", toemail);
  let dummyobj = {
    SecureToken: "e897669f-4158-4aa8-9ec9-b427bb86a779",
    To: "" + toemail,
    From: "aflpools@gmail.com",
    Subject: "AFL Pools password reset",
    Body: "Enter the verification code below" + "\r\n" + rndvalcode.toString(),
  };
  console.log("dummyobj", dummyobj);

  Email.send(dummyobj).then(function (message) {
    $(".msg").html("Email successfully sent");
    $(".msgcontainer").show();
  });

  document.getElementById("valEmail").innerHTML =
    document.getElementById("lemail").value;
  console.log("generated code", rndvalcode);
  $("#loginbox").hide();
  $("#forgotbox").show();
}
function chkValCode() {
  let vc = $("#valcode").val();
  console.log("vc", vc);
  if (vc == rndvalcode.toString()) {
    $("#vc").hide();
    $("#chkemailmsg").hide();
    $("#newpassword").show();
  }
}
function showPayPal() {
  if (loggedin) {
    $("#pp").show();
  } else {
    $("#loginbox").show();
  }

  // document.getElementById("pt2").innerHTML = `<b>Item Name:</b> ${itemName}`;
  // document.getElementById("pt3").innerHTML = "";
}
function updateDeposit(refid) {
  var parms = { operation: "updateDeposit", email: logemail, refid: refid };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      if (response.length == 0) {
        $(".msg").html("Login is incorrect. Try again");
        $(".msgcontainer").show();
        logemail = "";
        logpword = "";
        loggedin = false;
      } else {
        $("#loginbox").hide();
        document.getElementById("welcome").innerHTML = `Welcome ${logemail}`;
        loggedin = true;
      }
    },
    error: function () {
      $(".msg").html("Error");
      $(".msgcontainer").show();
    },
  });
}

function depositing() {
  itemPrice = $("#amt").val();
  document.getElementById(
    "pt"
  ).innerHTML = `Depositing  $${itemPrice} ${currency} to my account`;
}

function setWinner(gid, win) {
  for (let i = 0; i < games.length; i++) {
    if (games[i].gameid == gid) {
      games[i].winname = win;
      console.log("setWinner", games[i]);
      break;
    }
  }

  betcnt();
}

function gameSelected(gid) {
  console.log("games", games);
  console.log("game", game);

  for (let i = 0; i < games.length; i++) {
    if (games[i].gameid == gid) {
      games[i].checked = !games[i].checked;
    }
    if(!games[i].checked) {
      $(`#${games[i].homename.replaceAll(" ","")}`).attr("checked", false);
      $(`#${games[i].awayname.replaceAll(" ","")}`).attr("checked", false);
    }
  }

  checkedcnt = 0;
  for (let i = 0; i < games.length; i++) {
    if (games[i].checked) {
      checkedcnt++;
      console.log("gamesSelected", games[i].gameid);
    } 
  }

  console.log("checkedcnt", checkedcnt);

  if (checkedcnt == 6) {
    for (let i = 0; i < games.length; i++) {
      if (!games[i].checked) {
        $(`#${games[i].gameid}`).attr("disabled", true);
        $(`#${games[i].homename.replaceAll(" ","")}`).attr("disabled", true);
        $(`#${games[i].awayname.replaceAll(" ","")}`).attr("disabled", true);
        $(`#${games[i].homename.replaceAll(" ","")}`).attr("checked", false);
        $(`#${games[i].awayname.replaceAll(" ","")}`).attr("checked", false);
        games[i].winname="";
      }
    }
  } else {
    for (let i = 0; i < games.length; i++) {
      $(`#${games[i].gameid}`).attr("disabled", false);
      $(`#${games[i].homename.replaceAll(" ","")}`).attr("disabled", false);
      $(`#${games[i].awayname.replaceAll(" ","")}`).attr("disabled", false);
    }
  }
  betcnt();
}

function betcnt() {
  let betcnt = 0;
  for (let i = 0; i < games.length; i++) {
    if (games[i].checked && games[i].winname > "") {
      betcnt++;
      console.log("betcnt", betcnt);
    }
  }
  if (betcnt == 6) {
    $("#betnow").show();
  } else {
    $("#betnow").hide();
  }
}
function makebet() {
  console.log("make bet");
}
