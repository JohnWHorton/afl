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
var predictionamount = 20;
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
var rounds = [];
var games = [];
var trans_history = [];
var predictions = [];
var results = [];

$(document).ready(function () {
  document.getElementById("selectround").value = roundnumber.toString();
  document.getElementById("welcome").innerHTML = "Welcome to the game";

  $("#funds").hide();
  getRounds();
  getGames();
});

function getRounds() {
  $("#spinner").show();
  rounds = [];
  var parms = { operation: "rounds" };

  $.ajax({
    type: "POST",
    async: false,
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      rounds = response;
      // }
    },
    error: function (xhr, textStatus, error) {
      console.log(xhr.statusText);
      console.log(textStatus);
      console.log(error);
    },
  });
  console.log("rounds", rounds);
}
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
    let utcStartTime = games[i].utcStartTime;
    // console.log("utcStartTime", utcStartTime);
    const utcDateWithoutMillis = utcStartTime.slice(0, -5) + "Z";
    // console.log("utcDateWithoutMillis", utcDateWithoutMillis);
    const utcDate = new Date(utcDateWithoutMillis);
    console.log("UTC Date:", utcDate.toISOString());
    const offsetMinutes = utcDate.getTimezoneOffset();
    console.log("Time Zone Offset(minutes) ", offsetMinutes);
    const localTime = new Date(utcDate.getTime() - offsetMinutes * 60 * 1000);
    console.log("Local Time: ", localTime.toISOString());

    let gameid = games[i].gameid;
    let hometeamname = games[i].hometeamname;
    let homeimg = games[i].hometeamname.replaceAll(" ", "") + ".svg";
    let awayteamname = games[i].awayteamname;
    let awayimg = games[i].awayteamname.replaceAll(" ", "") + ".svg";
    let checked = false;
    let winname = "";
    let completed = games[i].completed;
    let result = games[i].result;

    if (completed == true) {
      document.getElementById(
        "roundname"
      ).innerHTML = `Round ${roundnumber} Closed`;
    } else {
      document.getElementById("roundname").innerHTML = `Round ${roundnumber}`;
    }

    tableleft += `
    <tr>`;

    if (completed == true) {
      tableleft += `
    <td class="col-sm-1" style="max-width: 18%!important; font-size: 16px;">
      <div>        
          Closed
        </div>
    </td>`;
    } else {
      tableleft +=
        `
    <td class="col-sm-1" style="max-width: 18%!important; text-align: center!important;">
      <div>        
          <input class="agame" id="` +
        gameid +
        `"onchange="gameSelected('${gameid}')" 
            type="checkbox" class="form-check-input" value="">
        </div>
    </td>`;
    }

    tableleft +=
      `
    <td class="col-sm-1" style="max-width: 18%!important; text-align: center!important;">
    <img src="./images/` +
      homeimg +
      `" alt="` +
      hometeamname +
      `" width="50" height="50"></td>
    <td class="col-sm-1" style="max-width: 18%!important; text-align: center!important; font-size: 1rem;font-weight: 600; background-color: black;">VS</td>
    <td class="col-sm-1"  style="max-width: 18%!important;text-align: center!important;">
    <img src="./images/` +
      awayimg +
      `" alt="` +
      awayteamname +
      `" width="50" height="50"></td>`;

    if (completed == true) {
      tableleft += `
    <td class="col-sm-12 col-md-1" style="max-width: 18%!important; text-align: center!important;">
      Winner </br><h5>${result}</h5>
      </div>
    </td>`;
    } else {
      tableleft +=
        `
    <td class="col-sm-12 col-md-1" style="max-width: 18%!important;">
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
    </td>`;

      tableleft += `
    </tr>
   `;
    }
  }
  // console.log("games", games);
  $("#spinner").hide();
  document.getElementById("tableleft").innerHTML = tableleft;
}
function showHistory() {
  let historytable = "";
  for (let i = 0; i < trans_history.length; i++) {
    historytable += `<tr>`;
    historytable += `
    <td>${trans_history[i].date}</td>
    `;
    historytable += `
    <td>${trans_history[i].transtype}</td>
    `;
    historytable += `
    <td>$ ${trans_history[i].amount} AUD</td>
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
function calBal(x) {
  trans_history = x;
  let bal = 0;
  for (i = 0; i < x.length; i++) {
    if (x[i].transtype == "Deposit" || x[i].transtype == "Winnings") {
      bal = bal + parseFloat(x[i].amount);
    } else {
      bal = bal - parseFloat(x[i].amount);
    }
  }
  document.getElementById("funds").innerHTML = `Available Funds $ ${bal} AUD`;
  return bal;
}
function loginEvent() {
  // e.preventDefault();

  logemail = $("#loginEmail").val();
  logpword = $("#loginPassword").val();

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
      if (response.length == 0 || response[0] == "error") {
        showMsg("Login is incorrect. Try again");
        logemail = "";
        logpword = "";
        loggedin = false;
      } else {
        response[0].pswd = "";
        loggedInUser = response[0];
        if (response["trans-history"]) {
          let x = response["trans-history"];
          console.log("trans-history", x);
          loggedInUser.funds = calBal(x);
          // loggedInUser.funds = response[1].balance;
        } else {
          loggedInUser.funds = 0;
        }
        // localStorage.setItem("myEmail", loggedInUser.email);
        $("#loginbox").hide();

        document.getElementById("welcome").innerHTML = `${loggedInUser.email}`;
        // document.getElementById("funds").innerHTML = `Available Funds $ ${loggedInUser.funds} AUD`;
        $("#funds").show();
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
  regemail = $("#loginEmail").val();
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
  regemail = $("#loginEmail").val();
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
  let toemail = $("#loginEmail").val();
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
    document.getElementById("loginEmail").value;
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
      if (response["trans-history"]) {
        loggedInUser.funds = calBal(response["trans-history"]);
      } else {
        loggedInUser.funds = 0;
      }
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
  showHistory();
  $("#historybox").show();
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
  var parms = {
    operation: "withdrawalrequest",
    email: loggedInUser.email,
    amount: amt,
  };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      console.log("response", response);
      if (response["trans-history"]) {
        loggedInUser.funds = calBal(response["trans-history"]);
      } else {
        loggedInUser.funds = 0;
      }
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

  predictioncnt();
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
  predictioncnt();
}
function predictioncnt() {
  let predictioncnt = 0;
  for (let i = 0; i < games.length; i++) {
    if (games[i].checked && games[i].winname > "") {
      predictioncnt++;
      console.log("predictioncnt", predictioncnt);
    }
  }
  if (predictioncnt == 6) {
    $("#predictnow").show();
    window.scrollTo(0, document.body.scrollHeight);
  } else {
    $("#predictnow").hide();
  }
}
function makeprediction() {
  let predictthis = games.filter((games) => games.checked === true);
  let predictthisjson = JSON.stringify(predictthis);
  console.log("predictthisjson", predictthisjson);

  var parms = {
    operation: "makeprediction",
    email: loggedInUser.email,
    roundnumber: roundnumber,
    predictthisjson: predictthisjson,
    amount: predictionamount,
  };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      console.log("Prediction made", parms);
      if (response["trans-history"]) {
        loggedInUser.funds = calBal(response["trans-history"]);
      } else {
        loggedInUser.funds = 0;
      }
      // display bet with ticket number
    },
    error: function () {
      showMsg("Error");
    },
  });
}
function getPredictions() {
  $("#spinner").show();
  var parms = {
    operation: "getPredictions",
    email: loggedInUser.email,
    roundnumber: roundnumber,
  };

  $.ajax({
    type: "POST",
    async: false,
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      predictions = response;
      // }
    },
    error: function (xhr, textStatus, error) {
      console.log(xhr.statusText);
      console.log(textStatus);
      console.log(error);
    },
  });
  $("#spinner").hide();

  // test
  // console.log("predictions", predictions);
  for (j = 0; j < predictions.length; j++) {
    let tot = 0;
    console.log(`Prediction ${j + 1}`);
    p = JSON.parse(predictions[j].predictthisjson);
    for (k = 0; k < p.length; k++) {
      for (i = 0; i < games.length; i++) {
        if (games[i].gameid == p[k].gameid) {
          g = games[i];

          if (g.result == p[k].winname) {
            tot++;
            desc = "GREEN TICK";
          } else {
            desc = "RED CROSS";
          }

          let h1 = `Game ${g.gameid}  ${g.hometeamname} vs ${g.awayteamname} winner ${g.result}  predicted ${p[k].winname}  ${desc} ${tot}}`;
          console.log(h1);
          showPredictions();
          $("#predictionsbox").show();
        }
      }
    }

    console.log(`You got ${tot} wins out of 6`);
  }
  function showPredictions() {
    let predictionstable = "";
    for (let i = 0; i < predictions.length; i++) {
      predictionstable += `<tr>`;
      predictionstable += `
      <td>${predictions[i].date}</td>
      `;
      predictionstable += `
      <td>${predictions[i].transtype}</td>
      `;
      predictionstable += `
      <td>$ ${predictions[i].amount} AUD</td>
      `;
      predictionstable += `</tr>`;
      console.log(predictionstable);
    }
    document.getElementById("predictionsbody").innerHTML = predictionstable;
  }

  // end
}
function getResults() {
  $("#spinner").show();
  
  var parms = {
    operation: "getresults",
    email: loggedInUser.email,
    roundnumber: roundnumber,
  };

  $.ajax({
    type: "POST",
    async: false,
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) {
      results = response;
      console.log(results);
      // }
    },
    error: function (xhr, textStatus, error) {
      console.log(xhr.statusText);
      console.log(textStatus);
      console.log(error);
    },
  });
  $("#spinner").hide();

  
  // test 
  // console.log("predictions", predictions);
  for (j = 0; j < predictions.length; j++) {
    let tot = 0;
    console.log(`Prediction ${j + 1}`);
    p = JSON.parse(predictions[j].predictthisjson);
    for (k = 0; k < p.length; k++) {
      for (i = 0; i < games.length; i++) {
        if (games[i].gameid == p[k].gameid) {
          g = games[i];

          if (g.result == p[k].winname) {
            tot++;
            desc = "GREEN TICK";
          } else {
            desc = "RED CROSS";
          }

          let h1 = `Game ${g.gameid}  ${g.hometeamname} vs ${g.awayteamname} winner ${g.result}  predicted ${p[k].winname}  ${desc} ${tot}}`;
          console.log(h1);
        }
      }
    }
    console.log(`You got ${tot} wins out of 6`);
  }

  // end
}
function withdrawalcomplete(refid) {
  var parms = {
    operation: "withdrawalscompleted",
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
        showMsg("Withdrawal failed");
      } else {
        if (response["trans-history"]) {
          loggedInUser.funds = calBal(response["trans-history"]);
        } else {
          loggedInUser.funds = 0;
        }
        showMsg("Withdrawal completed");
      }
    },
    error: function () {
      showMsg("Error");
    },
  });
}
function winnings() {
  var parms = {
    operation: "winnings",
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
        showMsg("Winnings failed");
      } else {
        if (response["trans-history"]) {
          loggedInUser.funds = calBal(response["trans-history"]);
        } else {
          loggedInUser.funds = 0;
        }
        showMsg("Withdrawal completed");
      }
    },
    error: function () {
      showMsg("Error");
    },
  });
}
