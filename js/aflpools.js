var tableleft = "";
var tableright = "";
var game = 1;
var radiogrp = 1;
var selectedgames = [];
var logemail = "";
var logpword = "";
var chkbox = false;
var loggedin = false;
var loggedInUser = "";
var regemail = "";
var regpwrd = "";
var repregpword = "";
var modal = document.getElementById("loginbox");
var itemNumber = "BET20";
var itemName = "Pool ticket";
var itemPrice = "30";
var currency = "AUD";
var depamt = "0";
var depcurr = "AUD";
var rndvalcode = 0;
var checkedcnt = 0;
const myemail = "";
var roundnumber = 1;
var games = [];
var hist = [];

$(document).ready(function () {

  document.getElementById("selectround").value = roundnumber.toString();
  document.getElementById("welcome").innerHTML = "Welcome to the game";

  const myemail = localStorage.getItem("myEmail");
  $("#lemail").val(myemail);
  loggedInUser.email = myemail;
  getGames();
});

function getRound(e) {
  // e.preventDefault();
  document.getElementById("tableleft").innerHTML = "";
  roundnumber = parseInt($("#selectround").val());
  getGames();
}
function getGames() {
  $("#spinner").show();
  games = [];
  var parms = { operation: "games", roundnumber: roundnumber };

  $.ajax({
    type: "POST",
    async: false,
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      games = response;
      // }
    },
    error: function (xhr, textStatus, error) {
      console.log(xhr.statusText);
      console.log(textStatus);
      console.log(error);
    },
  });
  console.log("games", games);
  tableleft = "";

  for (i = 0; i < games.length; i++) {
    let gameid = games[i].gameid;
    let hometeamname = games[i].hometeamname;
    let homeimg = games[i].hometeamname.replaceAll(" ", "") + ".svg";
    let awayteamname = games[i].awayteamname;
    let awayimg = games[i].awayteamname.replaceAll(" ", "") + ".svg";
    let checked = false;
    let winname = "";
    document.getElementById("roundname").innerHTML = `Round ${roundnumber}`;

    tableleft +=
      `
    <tr>
    <td class="col-sm-1" >
      <div>        
          <input class="agame" id="` +
      gameid +
      `" 
            onchange="gameSelected('${gameid}')" 
            type="checkbox" class="form-check-input" value="">
        </div>
    </td>
    <td class="col-sm-1">
    <img src="./images/` +
      homeimg +
      `" alt="` +
      hometeamname +
      `" width="50" height="50"></td>
    <td class="col-sm-1" style="text-align: center!important; font-size: 1rem;font-weight: 600; background-color: black;">VS</td>
    <td class="col-sm-1" >
    <img src="./images/` +
      awayimg +
      `" alt="` +
      awayteamname +
      `" width="50" height="50"></td>
    <td class="col-sm-1">
      <div class="form-check">
        <label class="form-check-label">
          <input id=${hometeamname.replaceAll(" ", "")}
          type="radio" class="form-check-input" name="optradio${radiogrp}"
          onclick="setWinner('${gameid}', '${hometeamname}')"
          style="font-size: 20px;">` +
      hometeamname +
      `
        </label>
        </div>
        <div class="form-check">
        <label class="form-check-label">
        <input id=${awayteamname.replaceAll(" ", "")} 
        type="radio" class="form-check-input" name="optradio${radiogrp++}"         
        onclick="setWinner('${gameid}', '${awayteamname}')"
        style="font-size: 20px;">` +
      awayteamname +
      `
        </label>
      </div>
    </td>
    </tr>
   `;
  }
  // console.log("games", games);
  $("#spinner").hide();
  document.getElementById("tableleft").innerHTML = tableleft;
}

function showHistory() {
  let historytable = "";
  for (let i = 0; i < hist.length; i++) {
    historytable += `<tr>`;
    historytable += `
    <td>${hist[i].deposit_amt}</td>
    `;
    historytable += `
    <td>${hist[i].request_amt}</td>
    `;
    historytable += `
    <td>${hist[i].completed_amt}</td>
    `;
    historytable += `
    <td>${hist[i].datecreated}</td>
    `;
    historytable += `</tr>`;
    console.log(historytable);
  }
  document.getElementById("historybody").innerHTML = historytable;
}
function showHideLoginbox() {
  if ($("#loginbox").is(":visible")) {
    $("#loginbox").hide();
  } else {
    $("#loginbox").show();
    $("#registerbox").hide();
  }
}
function showHideDepositbox() {
  if (!loggedin) {
    $("#loginbox").show();
  } else {
    $("#loginbox").hide();
    $("#depositbox").show();
  }
}
function showMsg(m) {
  $(".msg").html(m);
  $(".msg").show();

  setTimeout(hideMsg, 5000);
}
function hideMsg() {
  $(".msg").hide();
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
      if (response.length == 0 || response[0]=="error") {
        showMsg("Login is incorrect. Try again");
        logemail = "";
        logpword = "";
        loggedin = false;
      } else {
        response[0].pswd = "";
        loggedInUser = response[0];
        if (response[1]) {
          loggedInUser.funds = response[1].balance;
        } else {          
          loggedInUser.funds = 0;
        }
        localStorage.setItem("myEmail", loggedInUser.email);
        $("#loginbox").hide();
        document.getElementById("welcome").innerHTML = `${loggedInUser.email}`;
        document.getElementById("funds").innerHTML = `Available Funds $ ${loggedInUser.funds} AUD`;
        loggedin = true;
        console.log("User", loggedInUser);
      }
    },
    error: function () {
      showMsg("Error");
    },
  });
}
function registerEvent() {
  // loginemail=document.getElementById("emailaddress").value;
  regemail = $("#lemail").val();
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
          showMsg("User already exists, please login");
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
    showMsg("Invalid password or passwords do not match");
  }
}
function resetPassword() {
  regemail = $("#lemail").val();
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

          showMsg("reset failed. see log");
          showMsg("Invalid password or passwords do not match");
        }
      },
      error: function () {
        showMsg("Error");
      },
    });
  } else {
    showMsg("Invalid password or passwords do not match");
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
    showMsg("Email successfully sent");
  });

  document.getElementById("valEmail").innerHTML =
    document.getElementById("lemail").value;
  console.log("generated code", rndvalcode);
  $("#loginbox").hide();
  $("#forgotbox").show();
}
function depositEvent() {
  amt = $("#depositamount").val();
  // validation here
  var parms = { operation: "deposit", email: loggedInUser.email, amount: amt };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      console.log("response", response);
      showMsg("Deposit successful");
      $("#depositbox").hide();
    },
    error: function (xhr, textStatus, error) {
      console.log(xhr.statusText);
      console.log(textStatus);
      console.log(error);
    },
  });
}

function showHideWithdrawbox() {
  if (!loggedin) {
    $("#loginbox").show();
  } else {
    $("#loginbox").hide();
    $("#withdrawbox").show();
  }
}
//comment
function showMsg(m) {
  $(".msg").html(m);
  $(".msg").show();

  setTimeout(hideMsg, 5000);
}
function hideMsg() {
  $(".msg").hide();
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
function getTransactionhistory() {
  var parms = { operation: "transactionhistory", email: loggedInUser.email };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      hist = response;
      console.log("hist", hist);
      showHistory();
      $("#historybox").show();
    },
    error: function () {
      showMsg("Error");
    },
  });
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
function deposit(refid) {
  var parms = { operation: "deposit", email: loggedInUser.email, refid: refid };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      if (response.length == 0) {
        showMsg("Login is incorrect. Try again");

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
      showMsg("Error");
    },
  });
}

function withdrawEvent() {
  amt = $("#withdrawamount").val();
  // validation here
  var parms = { operation: "withdrawalrequest", email: loggedInUser.email, amount: amt };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      console.log("response", response);
      showMsg("Withdraw successful");
      $("#withdrawbox").hide();
    },
    error: function (xhr, textStatus, error) {
      console.log(xhr.statusText);
      console.log(textStatus);
      console.log(error);
    },
  });
}

function setWinner(gid, win) {
  if (!loggedin) {
    $("#loginbox").show();
    return;
  }
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
  // console.log("games", games);
  console.log("game", game);
  if (!loggedin) {
    $(`#${gid}`).prop("checked", false);
    $("#loginbox").show();
    return;
  }

  for (let i = 0; i < games.length; i++) {
    if (games[i].gameid == gid) {
      games[i].checked = !games[i].checked;
    }
    if (!games[i].checked) {
      $(`#${games[i].hometeamname.replaceAll(" ", "")}`).attr("checked", false);
      $(`#${games[i].awayteamname.replaceAll(" ", "")}`).attr("checked", false);
      games[i].winname = "";
    }
  }
  console.log("games", games);
  checkedcnt = 0;
  for (let i = 0; i < games.length; i++) {
    if (games[i].checked) {
      checkedcnt++;
      // console.log("gamesSelected", games[i].gameid);
    }
  }

  // console.log("checkedcnt", checkedcnt);

  if (checkedcnt == 6) {
    for (let i = 0; i < games.length; i++) {
      if (!games[i].checked) {
        $(`#${games[i].gameid}`).attr("disabled", true);
        $(`#${games[i].hometeamname.replaceAll(" ", "")}`).attr(
          "disabled",
          true
        );
        $(`#${games[i].awayteamname.replaceAll(" ", "")}`).attr(
          "disabled",
          true
        );
        $(`#${games[i].hometeamname.replaceAll(" ", "")}`).attr(
          "checked",
          false
        );
        $(`#${games[i].awayteamname.replaceAll(" ", "")}`).attr(
          "checked",
          false
        );
        games[i].winname = "";
      }
    }
  } else {
    for (let i = 0; i < games.length; i++) {
      $(`#${games[i].gameid}`).attr("disabled", false);
      $(`#${games[i].hometeamname.replaceAll(" ", "")}`).attr(
        "disabled",
        false
      );
      $(`#${games[i].awayteamname.replaceAll(" ", "")}`).attr(
        "disabled",
        false
      );
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
    // document.getElementById("betnow").focus();
    window.scrollTo(0, document.body.scrollHeight);
  } else {
    $("#betnow").hide();
  }
}
function makebet() {
  // check funds =>$20
  for (let i = 0; i < games.length; i++) {
    if (games[i].checked) {
      console.log("make bet", games[i]);
    }
  }

  let betthis = games.filter((games) => games.checked === true);
  let betthisjson = JSON.stringify(betthis);
  console.log("betthisjson", betthisjson);

  var parms = {
    operation: "makebet",
    email: loggedInUser.email,
    betthisjson: betthisjson,
  };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      console.log("Bet made", parms);
      //reduce funds by $20
      // display bet with ticket number
    },
    error: function () {
      showMsg("Error");
    },
  });
}
function withdrawalrequest(refid) {
  var parms = {
    operation: "withdrawalrequest",
    email: loggedInUser.email,
    amount: amount,
  };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      if (response.length == 0) {
        showMsg("Login is incorrect. Try again");

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
      showMsg("Error");
    },
  });
}
