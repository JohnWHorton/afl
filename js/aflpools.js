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
var regemail = "";
var regpwrd = "";
var repregpword = "";
var modal = document.getElementById("loginbox");
var modal2 = document.getElementById("loginbox");

const rounds = {
  matches: [
    {
      id: 4787,
      providerId: "CD_M20230140101",
      compSeason: {
        id: 52,
        providerId: "CD_S2023014",
        name: "2023 Toyota AFL Premiership",
        shortName: "Premiership",
        currentRoundNumber: 28,
      },
      round: {
        id: 758,
        providerId: "CD_R202301401",
        abbreviation: "Rd 1",
        name: "Round 1",
        roundNumber: 1,
        byes: [],
      },
      home: {
        team: {
          id: 16,
          providerId: "CD_T120",
          name: "Richmond",
          abbreviation: "RICH",
          nickname: "Tigers",
          club: {
            id: 22,
            providerId: "CD_O25",
            name: "Richmond",
            abbreviation: "Tigers",
            nickname: "Tigers",
          },
          teamType: "MEN",
        },
        score: {
          goals: 8,
          behinds: 10,
          totalScore: 58,
          superGoals: 0,
        },
      },
      away: {
        team: {
          id: 5,
          providerId: "CD_T30",
          name: "Carlton",
          abbreviation: "CARL",
          nickname: "Blues",
          club: {
            id: 1,
            providerId: "CD_O5",
            name: "Carlton",
            abbreviation: "Blues",
            nickname: "Blues",
          },
          teamType: "MEN",
        },
        score: {
          goals: 8,
          behinds: 10,
          totalScore: 58,
          superGoals: 0,
        },
      },
      venue: {
        id: 13,
        providerId: "CD_V40",
        name: "MCG",
        abbreviation: "MCG",
        location: "Melbourne",
        state: "VIC",
        timezone: "Australia/Melbourne",
        landOwner: "Wurundjeri",
      },
      utcStartTime: "2023-03-16T08:20:00.000+0000",
      status: "CONCLUDED",
      metadata: {
        ticket_link:
          "https://premier.ticketek.com.au/shows/show.aspx?sh=RICHM0123",
      },
    },
    {
      id: 4786,
      providerId: "CD_M20230140102",
      compSeason: {
        id: 52,
        providerId: "CD_S2023014",
        name: "2023 Toyota AFL Premiership",
        shortName: "Premiership",
        currentRoundNumber: 28,
      },
      round: {
        id: 758,
        providerId: "CD_R202301401",
        abbreviation: "Rd 1",
        name: "Round 1",
        roundNumber: 1,
        byes: [],
      },
      home: {
        team: {
          id: 10,
          providerId: "CD_T70",
          name: "Geelong Cats",
          abbreviation: "GEEL",
          nickname: "Cats",
          club: {
            id: 15,
            providerId: "CD_O11",
            name: "Geelong Cats",
            abbreviation: "Cats",
            nickname: "Cats",
          },
          teamType: "MEN",
        },
        score: {
          goals: 16,
          behinds: 7,
          totalScore: 103,
          superGoals: 0,
        },
      },
      away: {
        team: {
          id: 3,
          providerId: "CD_T40",
          name: "Collingwood",
          abbreviation: "COLL",
          nickname: "Magpies",
          club: {
            id: 12,
            providerId: "CD_O6",
            name: "Collingwood",
            abbreviation: "Magpies",
            nickname: "Magpies",
          },
          teamType: "MEN",
        },
        score: {
          goals: 19,
          behinds: 11,
          totalScore: 125,
          superGoals: 0,
        },
      },
      venue: {
        id: 13,
        providerId: "CD_V40",
        name: "MCG",
        abbreviation: "MCG",
        location: "Melbourne",
        state: "VIC",
        timezone: "Australia/Melbourne",
        landOwner: "Wurundjeri",
      },
      utcStartTime: "2023-03-17T08:40:00.000+0000",
      status: "CONCLUDED",
      metadata: {
        ticket_link:
          "https://premier.ticketek.com.au/shows/show.aspx?sh=GEELO0123",
      },
    },
    {
      id: 4785,
      providerId: "CD_M20230140103",
      compSeason: {
        id: 52,
        providerId: "CD_S2023014",
        name: "2023 Toyota AFL Premiership",
        shortName: "Premiership",
        currentRoundNumber: 28,
      },
      round: {
        id: 758,
        providerId: "CD_R202301401",
        abbreviation: "Rd 1",
        name: "Round 1",
        roundNumber: 1,
        byes: [],
      },
      home: {
        team: {
          id: 6,
          providerId: "CD_T100",
          name: "North Melbourne",
          abbreviation: "NMFC",
          nickname: "Kangaroos",
          club: {
            id: 20,
            providerId: "CD_O20",
            name: "North Melbourne",
            abbreviation: "Kangaroos",
            nickname: "Kangaroos",
          },
          teamType: "MEN",
        },
        score: {
          goals: 12,
          behinds: 15,
          totalScore: 87,
          superGoals: 0,
        },
      },
      away: {
        team: {
          id: 18,
          providerId: "CD_T150",
          name: "West Coast Eagles",
          abbreviation: "WCE",
          nickname: "Eagles",
          club: {
            id: 23,
            providerId: "CD_O30",
            name: "West Coast Eagles",
            abbreviation: "Eagles",
            nickname: "Eagles",
          },
          teamType: "MEN",
        },
        score: {
          goals: 12,
          behinds: 10,
          totalScore: 82,
          superGoals: 0,
        },
      },
      venue: {
        id: 3,
        providerId: "CD_V190",
        name: "Marvel Stadium",
        abbreviation: "MRVL",
        location: "Melbourne",
        state: "VIC",
        timezone: "Australia/Melbourne",
        landOwner: "Wurundjeri",
      },
      utcStartTime: "2023-03-18T02:45:00.000+0000",
      status: "CONCLUDED",
      metadata: {
        ticket_link:
          "https://www.ticketmaster.com.au/north-melbourne-v-west-coast-eagles-docklands-18-03-2023/event/25005E4F9795186B",
      },
    },
    {
      id: 4788,
      providerId: "CD_M20230140104",
      compSeason: {
        id: 52,
        providerId: "CD_S2023014",
        name: "2023 Toyota AFL Premiership",
        shortName: "Premiership",
        currentRoundNumber: 28,
      },
      round: {
        id: 758,
        providerId: "CD_R202301401",
        abbreviation: "Rd 1",
        name: "Round 1",
        roundNumber: 1,
        byes: [],
      },
      home: {
        team: {
          id: 7,
          providerId: "CD_T110",
          name: "Port Adelaide",
          abbreviation: "PORT",
          nickname: "Power",
          club: {
            id: 19,
            providerId: "CD_O24",
            name: "Port Adelaide",
            abbreviation: "Power",
            nickname: "Power",
          },
          teamType: "MEN",
        },
        score: {
          goals: 18,
          behinds: 18,
          totalScore: 126,
          superGoals: 0,
        },
      },
      away: {
        team: {
          id: 2,
          providerId: "CD_T20",
          name: "Brisbane Lions",
          abbreviation: "BL",
          nickname: "Lions",
          club: {
            id: 13,
            providerId: "CD_O3",
            name: "Brisbane Lions",
            abbreviation: "Lions",
            nickname: "Lions",
          },
          teamType: "MEN",
        },
        score: {
          goals: 11,
          behinds: 6,
          totalScore: 72,
          superGoals: 0,
        },
      },
      venue: {
        id: 31,
        providerId: "CD_V6",
        name: "Adelaide Oval",
        abbreviation: "AO",
        location: "Adelaide",
        state: "SA",
        timezone: "Australia/Adelaide",
        landOwner: "Kaurna",
      },
      utcStartTime: "2023-03-18T05:35:00.000+0000",
      status: "CONCLUDED",
      metadata: {
        ticket_link:
          "https://premier.ticketek.com.au/shows/Show.aspx?sh=PORTA0123",
      },
    },
    {
      id: 4791,
      providerId: "CD_M20230140105",
      compSeason: {
        id: 52,
        providerId: "CD_S2023014",
        name: "2023 Toyota AFL Premiership",
        shortName: "Premiership",
        currentRoundNumber: 28,
      },
      round: {
        id: 758,
        providerId: "CD_R202301401",
        abbreviation: "Rd 1",
        name: "Round 1",
        roundNumber: 1,
        byes: [],
      },
      home: {
        team: {
          id: 17,
          providerId: "CD_T90",
          name: "Melbourne",
          abbreviation: "MELB",
          nickname: "Demons",
          club: {
            id: 14,
            providerId: "CD_O18",
            name: "Melbourne",
            abbreviation: "Demons",
            nickname: "Demons",
          },
          teamType: "MEN",
        },
        score: {
          goals: 17,
          behinds: 13,
          totalScore: 115,
          superGoals: 0,
        },
      },
      away: {
        team: {
          id: 8,
          providerId: "CD_T140",
          name: "Western Bulldogs",
          abbreviation: "WB",
          nickname: "Bulldogs",
          club: {
            id: 25,
            providerId: "CD_O31",
            name: "Western Bulldogs",
            abbreviation: "Bulldogs",
            nickname: "Bulldogs",
          },
          teamType: "MEN",
        },
        score: {
          goals: 9,
          behinds: 11,
          totalScore: 65,
          superGoals: 0,
        },
      },
      venue: {
        id: 13,
        providerId: "CD_V40",
        name: "MCG",
        abbreviation: "MCG",
        location: "Melbourne",
        state: "VIC",
        timezone: "Australia/Melbourne",
        landOwner: "Wurundjeri",
      },
      utcStartTime: "2023-03-18T08:25:00.000+0000",
      status: "CONCLUDED",
      metadata: {
        ticket_link:
          "https://premier.ticketek.com.au/shows/show.aspx?sh=MELBO0123",
      },
    },
    {
      id: 4789,
      providerId: "CD_M20230140106",
      compSeason: {
        id: 52,
        providerId: "CD_S2023014",
        name: "2023 Toyota AFL Premiership",
        shortName: "Premiership",
        currentRoundNumber: 28,
      },
      round: {
        id: 758,
        providerId: "CD_R202301401",
        abbreviation: "Rd 1",
        name: "Round 1",
        roundNumber: 1,
        byes: [],
      },
      home: {
        team: {
          id: 4,
          providerId: "CD_T1000",
          name: "Gold Coast Suns",
          abbreviation: "GCFC",
          nickname: "Suns",
          club: {
            id: 9,
            providerId: "CD_O14",
            name: "Gold Coast Suns",
            abbreviation: "Suns",
            nickname: "Suns",
          },
          teamType: "MEN",
        },
        score: {
          goals: 9,
          behinds: 7,
          totalScore: 61,
          superGoals: 0,
        },
      },
      away: {
        team: {
          id: 13,
          providerId: "CD_T160",
          name: "Sydney Swans",
          abbreviation: "SYD",
          nickname: "Swans",
          club: {
            id: 24,
            providerId: "CD_O28",
            name: "Sydney Swans",
            abbreviation: "Swans",
            nickname: "Swans",
          },
          teamType: "MEN",
        },
        score: {
          goals: 16,
          behinds: 14,
          totalScore: 110,
          superGoals: 0,
        },
      },
      venue: {
        id: 11,
        providerId: "CD_V81",
        name: "Heritage Bank Stadium",
        abbreviation: "HBS",
        location: "Gold Coast",
        state: "QLD",
        timezone: "Australia/Brisbane",
        landOwner: "Yugambeh ",
      },
      utcStartTime: "2023-03-18T09:00:00.000+0000",
      status: "CONCLUDED",
      metadata: {
        ticket_link:
          "https://hotshow4.ticketek.com.au/shows/show.aspx?sh=SUNS0123",
      },
    },
    {
      id: 4790,
      providerId: "CD_M20230140107",
      compSeason: {
        id: 52,
        providerId: "CD_S2023014",
        name: "2023 Toyota AFL Premiership",
        shortName: "Premiership",
        currentRoundNumber: 28,
      },
      round: {
        id: 758,
        providerId: "CD_R202301401",
        abbreviation: "Rd 1",
        name: "Round 1",
        roundNumber: 1,
        byes: [],
      },
      home: {
        team: {
          id: 15,
          providerId: "CD_T1010",
          name: "GWS Giants",
          abbreviation: "GWS",
          nickname: "Giants",
          club: {
            id: 5,
            providerId: "CD_O16",
            name: "GWS Giants",
            abbreviation: "Giants",
            nickname: "Giants",
          },
          teamType: "MEN",
        },
        score: {
          goals: 15,
          behinds: 16,
          totalScore: 106,
          superGoals: 0,
        },
      },
      away: {
        team: {
          id: 1,
          providerId: "CD_T10",
          name: "Adelaide Crows",
          abbreviation: "ADEL",
          nickname: "Crows",
          club: {
            id: 3,
            providerId: "CD_O1",
            name: "Adelaide Crows",
            abbreviation: "Crows",
            nickname: "Crows",
          },
          teamType: "MEN",
        },
        score: {
          goals: 12,
          behinds: 18,
          totalScore: 90,
          superGoals: 0,
        },
      },
      venue: {
        id: 8,
        providerId: "CD_V43",
        name: "GIANTS Stadium",
        abbreviation: "GS",
        location: "Sydney",
        state: "NSW",
        timezone: "Australia/Sydney",
        landOwner: "Wann-gal",
      },
      utcStartTime: "2023-03-19T02:10:00.000+0000",
      status: "CONCLUDED",
      metadata: {
        ticket_link:
          "https://www.ticketmaster.com.au/gws-giants-v-adelaide-crows-olympic-park-19-03-2023/event/13005E48A51E4A2F",
      },
    },
    {
      id: 4792,
      providerId: "CD_M20230140108",
      compSeason: {
        id: 52,
        providerId: "CD_S2023014",
        name: "2023 Toyota AFL Premiership",
        shortName: "Premiership",
        currentRoundNumber: 28,
      },
      round: {
        id: 758,
        providerId: "CD_R202301401",
        abbreviation: "Rd 1",
        name: "Round 1",
        roundNumber: 1,
        byes: [],
      },
      home: {
        team: {
          id: 9,
          providerId: "CD_T80",
          name: "Hawthorn",
          abbreviation: "HAW",
          nickname: "Hawks",
          club: {
            id: 16,
            providerId: "CD_O17",
            name: "Hawthorn",
            abbreviation: "Hawks",
            nickname: "Hawks",
          },
          teamType: "MEN",
        },
        score: {
          goals: 9,
          behinds: 11,
          totalScore: 65,
          superGoals: 0,
        },
      },
      away: {
        team: {
          id: 12,
          providerId: "CD_T50",
          name: "Essendon",
          abbreviation: "ESS",
          nickname: "Bombers",
          club: {
            id: 10,
            providerId: "CD_O9",
            name: "Essendon",
            abbreviation: "Bombers",
            nickname: "Bombers",
          },
          teamType: "MEN",
        },
        score: {
          goals: 19,
          behinds: 10,
          totalScore: 124,
          superGoals: 0,
        },
      },
      venue: {
        id: 13,
        providerId: "CD_V40",
        name: "MCG",
        abbreviation: "MCG",
        location: "Melbourne",
        state: "VIC",
        timezone: "Australia/Melbourne",
        landOwner: "Wurundjeri",
      },
      utcStartTime: "2023-03-19T04:20:00.000+0000",
      status: "CONCLUDED",
      metadata: {
        ticket_link:
          "https://premier.ticketek.com.au/shows/show.aspx?sh=HAWTH0123",
      },
    },
    {
      id: 4793,
      providerId: "CD_M20230140109",
      compSeason: {
        id: 52,
        providerId: "CD_S2023014",
        name: "2023 Toyota AFL Premiership",
        shortName: "Premiership",
        currentRoundNumber: 28,
      },
      round: {
        id: 758,
        providerId: "CD_R202301401",
        abbreviation: "Rd 1",
        name: "Round 1",
        roundNumber: 1,
        byes: [],
      },
      home: {
        team: {
          id: 11,
          providerId: "CD_T130",
          name: "St Kilda",
          abbreviation: "STK",
          nickname: "Saints",
          club: {
            id: 21,
            providerId: "CD_O27",
            name: "St Kilda",
            abbreviation: "Saints",
            nickname: "Saints",
          },
          teamType: "MEN",
        },
        score: {
          goals: 10,
          behinds: 7,
          totalScore: 67,
          superGoals: 0,
        },
      },
      away: {
        team: {
          id: 14,
          providerId: "CD_T60",
          name: "Fremantle",
          abbreviation: "FRE",
          nickname: "Dockers",
          club: {
            id: 6,
            providerId: "CD_O10",
            name: "Fremantle",
            abbreviation: "Dockers",
            nickname: "Dockers",
          },
          teamType: "MEN",
        },
        score: {
          goals: 7,
          behinds: 10,
          totalScore: 52,
          superGoals: 0,
        },
      },
      venue: {
        id: 3,
        providerId: "CD_V190",
        name: "Marvel Stadium",
        abbreviation: "MRVL",
        location: "Melbourne",
        state: "VIC",
        timezone: "Australia/Melbourne",
        landOwner: "Wurundjeri",
      },
      utcStartTime: "2023-03-19T05:40:00.000+0000",
      status: "CONCLUDED",
      metadata: {
        ticket_link:
          "https://www.ticketmaster.com.au/st-kilda-v-fremantle-docklands-19-03-2023/event/25005E4F9B1F1BDB",
      },
    },
  ],
};

// var results;

$(document).ready(function () {
  // temp testing
 setLocalStorage();
 
  //end test
  for (i = 0; i < rounds.matches.length; i++) {
    if (i < 5) {
      tableleft +=
        `
    <tr>
    <td>
      <div>
        
          <input class="agame" id="` +
        rounds.matches[i].id.toString() +
        `" 
            onchange="gameSelected('${rounds.matches[i].id.toString()}')" 
            type="checkbox" class="form-check-input" value="">Game ${game++}
       
        </div>
    </td>
    <td><img src="./images/` +
        rounds.matches[i].home.team.name.replaceAll(" ", "") +
        `.svg" alt="` +
        rounds.matches[i].home.team.name +
        `" width="100"
      height="100"></td>
    <td style="font-size: 2rem;font-weight: 700;">VS</td>
    <td><img src="./images/` +
        rounds.matches[i].away.team.name.replaceAll(" ", "") +
        `.svg" alt="` +
        rounds.matches[i].away.team.name +
        `" width="100"
      height="100"></td>
    <td>
      <div class="form-check">
        <label class="form-check-label">
          <input id=${rounds.matches[i].id}-${rounds.matches[i].home.team.name.replaceAll(" ", "-")} 
          type="radio" class="form-check-input" name="optradio${radiogrp}" style="font-size: 20px;">` +
        rounds.matches[i].home.team.name +
        `
        </label>
        </div>
        <div class="form-check">
        <label class="form-check-label">
        <input id=${rounds.matches[i].id}-${rounds.matches[i].away.team.name.replaceAll(" ", "-")} 
        type="radio" class="form-check-input" name="optradio${radiogrp++}" style="font-size: 20px;">` +
        rounds.matches[i].away.team.name +
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
        rounds.matches[i].id.toString() +
        `"  
        onchange="gameSelected('${rounds.matches[i].id.toString()}')"
        type="checkbox" class="form-check-input" value="">
              <span style="padding-top: 15px;">Game ${game++}</span>
            </label>
            </div>
        </td>
        <td><img src="./images/` +
        rounds.matches[i].home.team.name.replaceAll(" ", "") +
        `.svg" alt="` +
        rounds.matches[i].home.team.name +
        `" width="100"
          height="100"></td>
        <td style="font-size: 2rem;font-weight: 700;">VS</td>
        <td><img src="./images/` +
        rounds.matches[i].away.team.name.replaceAll(" ", "") +
        `.svg" alt="` +
        rounds.matches[i].away.team.name +
        `" width="100"
          height="100"></td>
        <td>
          <div class="form-check">
            <label class="form-check-label">
              <input id=${rounds.matches[i].id}-${rounds.matches[i].home.team.name.replaceAll(" ", "-")} 
              type="radio" class="form-check-input" name="optradio${radiogrp}" style="font-size: 20px;">` +
        rounds.matches[i].home.team.name +
        `
            </label>
            </div>
            <div class="form-check">
            <label class="form-check-label">
              <input id=${rounds.matches[i].id}-${rounds.matches[i].away.team.name.replaceAll(" ", "-")} 
              type="radio" class="form-check-input" name="optradio${radiogrp++}" style="font-size: 20px;">` +
        rounds.matches[i].away.team.name +
        `
            </label>
            </div>
        </td>
      </tr> `;
    }
  }
  // console.log("tableright", tableright);
  document.getElementById("tableleft").innerHTML = tableleft;
  document.getElementById("tableright").innerHTML = tableright;
  
  let file = "fetch_info.txt"
  fetch(file)
    .then(x => x.text())
    .then(y => document.getElementById("info").innerHTML = y);
  
});
function showHideLoginbox() {
  if($('#loginbox').is(':visible')) {
    $('#loginbox').hide();
  } else {
    $('#loginbox').show(); 
    $('#registerbox').hide();
  } 
}
function setLocalStorage(userdata) {
  localStorage.setItem('aflemail', 'Obaseki Nosa');
  localStorage.setItem('aflpassword', 'abcdefgh');
}

function loginEvent() {
  // e.preventDefault();
  
  logemail=$("#lemail").val();
  logpword=$("#lpassword").val();

  if ($("#defaultCheck1").is(":checked")){
    chkbox=true;
  } else {
    chkbox=false;
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
      if(response.length==0) {
        alert("Login is incorrect. Try again");
      } else {
      $('#loginbox').hide();
      }
    },
    error: function () {
      alert("Error!");
    },
  });

}
function registerEvent() {
  // loginemail=document.getElementById("emailaddress").value;
  regemail=$("#remail").val();
  regpword=$("#rpassword").val();
  repregpword=$("#rrpassword").val();
  
  console.log(regemail)
  console.log(regpword)
  console.log(repregpword)

  var parms = { operation: "addUser", email: regemail, pswd: regpword };

  $.ajax({
    type: "POST",
    url: "./php/afldb.php",
    contentType: "application/json; charset=UTF-8",
    dataType: "json",
    data: JSON.stringify(parms),
    success: function (response) { 
      $('#loginbox').hide();
      $('#registerbox').hide();
    },
    error: function () {
      alert("Error!");
    },
  });

}
function showPayPal() {
  $itemPrice=123.99;
  $('#pp').show();
}

function matchClicked(match, homeaway) {
  // alert(match+" - "+homeaway);
  console.log(match + " - " + homeaway);
}
function gameSelected(game) {
  console.log("game", game);
  var x = document.getElementById(`${game}`).checked;
  console.log("checked", x);

  if (x == true) {
    if (!selectedgames.includes(game)) {
      selectedgames.push(game);
    }
  } else {
    if (selectedgames.includes(game)) {
      for(var i=0; i<selectedgames.length; i++) {
        if(selectedgames[i]==game) {
          selectedgames.splice(i, 1);
          break;
        }
      }
    }
  }
  console.log("selected games count", selectedgames.length);
  console.log("rounds.matches", rounds.matches);
  console.log("selected games", selectedgames);
  if(selectedgames.length==6) {
    
    for(var j=0; j<rounds.matches.length; j++) {
      
      if(!selectedgames.includes(rounds.matches[j].id.toString())) {
        $("#"+rounds.matches[j].id.toString()).attr("disabled", true);
        $("#"+rounds.matches[j].id.toString()+"-"+rounds.matches[j].home.team.name.replaceAll(" ", "-")).attr("disabled", true);
        $("#"+rounds.matches[j].id.toString()+"-"+rounds.matches[j].away.team.name.replaceAll(" ", "-")).attr("disabled", true);
      }

    }
  }
  if(selectedgames.length!=6) {
    
    for(var j=0; j<rounds.matches.length; j++) {
      
      if(!selectedgames.includes(rounds.matches[j].id.toString())) {
        $("#"+rounds.matches[j].id.toString()).attr("disabled", false);
        $("#"+rounds.matches[j].id.toString()+"-"+rounds.matches[j].home.team.name.replaceAll(" ", "-")).attr("disabled", false);
        $("#"+rounds.matches[j].id.toString()+"-"+rounds.matches[j].away.team.name.replaceAll(" ", "-")).attr("disabled", false);
      }

    }
  }
}
