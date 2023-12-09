<?php
// Include the configuration file
require_once './paypal_standard_checkout_in_php/config.php';
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AFL Pools</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <!-- should always be last-->
    <link rel="stylesheet" href="./css/aflpools.css" type="text/css">
    <!------ Include the above in your HEAD tag ---------->
</head>

<body>

    <nav class="navbar navbar-custom navbar-expand-sm navbar-dark sticky-top">

        <span style="font-size: 1.5rem; margin-right: 1rem;">AFL Pools</span>

        <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="collapse_target">

            <ul class="navbar-nav" style="width: 100%; justify-content: flex-end; gap: 5px;">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-target="dropdown_target" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #c3e1fb;">
                        My account
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdown_target">
                        <a class="dropdown-item" onclick="showHideDepositbox()">Deposit funds</a>
                        <a class="dropdown-item" onclick="getResults()">My results</a>
                        <a class="dropdown-item" onclick="getPredictions()">My predictions</a>
                        <!-- <div class="dropdown-divider"></div> -->
                        <a class="dropdown-item" onclick="showHideWithdrawbox()">Withdraw funds</a>
                        <a class="dropdown-item" onclick="getTransactionhistory()">Show my transactions</a>
                    </div>
                </li>
                <li class="form-inline">
                    <label style="color: #c3e1fb;">Round</label> &nbsp;
                    <input class="form-control " type="text" id="selectround" onchange="getRound()">
                </li>
                <li class="nav-item">
                    <a id="funds" class="nav-link" href="#"></a>
                </li>
                <li class="nav-item">
                    <a id="welcome" class="nav-link" href="#">Welcome to the game</a>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-primary btnlogin" onclick="$('.navbar .collapse').collapse('hide');showHideLoginbox()">Login</button>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid" style="width: 100%!important; margin-top: 0; background-color: rgba(0,0,0,0.3); overflow: auto;">
        <div class="row">
            <div class="col-sm-12">

                <div style="text-align: center; margin-top: 20px; font-style: italic;">
                    <h3>Community Footie Pools</h3>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="msg" style="text-align: center; display: none;">
                </div>
            </div>
        </div>

        <div id="afldata" class="main-content">
            <div class="colcontainer">
                <div class="row" style="width: 100%!important;">
                    <div class="col-sm-1 col-md-4"></div>
                    <div class="col-sm-12" style="text-align: center; margin-left: 1rem; margin-right: -0.9rem; margin-top: 2rem; background-color: rgba(0,0,0,0.7); overflow: auto;">
                        <br />
                        <h4 style="text-align: center;"><b>What this site is and how to participate</b></h4>
                        <span style="font-size: 16px;">
                            This site is not a gambling site.<br />
                            Rather it is a platform for members to compete against each other. This involves members
                            contributing to a Prize Pool, and the most skilled predictions sharing the pool at the end
                            of each round.
                            <br /><br />
                            Members compete in activities that require strategy, intelligence, creativity, or other
                            skills.<br /><br />

                            Select any 6 games and make a prediction for the Winner of each game.</br>
                            Each prediction will contribute $20 AUD into the pool.</br></br>
                            The pool accumulates from the number of predictions and will form the <span style="color:Yellow">PRIZE POOL</span> and
                            this will be shared equally by the Best Predictions.</br>
                            If there are no Winners, the pool will be carried forward to the next round.</br></br>

                        </span>
                        <h4 style="text-align: center; color: gold;">Think hard!</h4>
                    </div>
                    <div class="col-sm-12"></div>
                </div>
            </div>
            <center>
                <div class="colcontainer">
                    <div class="row" style="width: 100%;">
                        <!-- <div class="col-md-4"></div> -->
                        <div class="col-sm-12" style="background-color: rgba(0,0,0,0.7); overflow: auto;">
                            <div id="spinner" class="spinner-border text-danger" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                            <div id="roundname"></div>
                            <table class="table">
                                <tbody id="tableleft">
                                </tbody>
                            </table>
                            <div id="predictnow" style="display: none;">
                                <center>
                                    <button class="btn predictionnowbtn" onclick="makeprediction()">Contribute</button>
                                </center>
                            </div>
                        </div>
                        <!-- <div class="col-sm-12"></div> -->
                    </div>
            </center>

        </div>
        <div id="loginbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;">

            <div class="close">
                <span aria-hidden="true" onclick="$('#loginbox').hide();">&times;</span>
            </div>
            <form style="padding: 10px;" autocomplete="off">
                <div class="form-group">
                    <label for="emailaddress">Email address</label>
                    <input type="email" class="form-control" id="loginEmail" aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">
                        We'll never share your
                        email with anyone
                        else.
                    </small>
                </div>
                <div class="form-group">
                    <label for="current-password">Password</label>
                    <input type="password" class="form-control" id="loginPassword" value="" placeholder="Enter Password">
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value id="defaultCheck1">
                    <label class="form-check-label" for="defaultCheck1">
                        Remember me
                    </label>
                </div>
                <div style="justify-content: center">
                    <center>
                        <button type="button" class="btn btn-primary buttonlogin" onclick="loginEvent()">
                            Login
                        </button>
                        <br>
                        <a onclick="$('#loginbox').hide(); $('#registerbox').show();" href="#" style="color: black;">
                            Don't have an account? Register
                        </a>
                        <a onclick="forgotPassword()" href="#" style="color: black;">
                            Forgot password? Click here
                        </a>
                    </center>
                </div>
            </form>
        </div>
        <!-- <form action="action_page.php"> -->
        <div id="registerbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;">
            <div class="close">
                <span aria-hidden="true" onclick="$('#registerbox').hide();">&times;</span>
            </div>
            <form style="padding: 10px;">
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" id="remail" placeholder="Enter Email" required>
                </div>
                <div class="form-group">
                    <label for="rpassword">Password</label>
                    <input type="password" class="form-control" id="rpassword" placeholder="Enter Password" value="" required>
                </div>
                <div class="form-group">
                    <label for="rrpassword">Repeat Password</label>
                    <input type="password" class="form-control" id="rrpassword" placeholder="Repeat Password" value="" required>
                </div>
                <p>
                    By creating an account you agree to our
                    <a href="#" style="color: black;">
                        Terms
                        & Privacy
                    </a>
                    .
                </p>
                <center>
                    <button type="button" class="btn btn-primary buttonlogin" onclick="registerEvent()">Register</button>
                    <br>
                    <a onclick="$('#registerbox').hide(); showHideLoginbox()" href="#" style="color: black;">
                        Already have an account? Sign in
                    </a>
                </center>
        </div>

        <div id="forgotbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;">
            <div class="close">
                <span aria-hidden="true" onclick="$('#forgotbox').hide();">&times;</span>
            </div>
            <form style="padding: 10px;">
                <div id="valEmail" class="form-group"></div>
                <div id="vc" class="form-group">
                    <label for="valcode">Enter validation code</label>
                    <input type="text" class="form-control" id="valcode" required onchange="chkValCode()">
                </div>
                <div id="newpassword" style="display: none;">
                    <div class="form-group">
                        <label for="newpword">Password</label>
                        <input type="password" class="form-control" id="newpword" placeholder="Enter Password" value="" required>
                    </div>
                    <div class="form-group">
                        <label for="rnewpword">Repeat Password</label>
                        <input type="password" class="form-control" id="rnewpword" placeholder="Repeat Password" value="" required>
                    </div>
                    <center>
                        <button type="button" class="btn btn-primary buttonlogin" onclick="resetPassword()">Reset</button>
                    </center>
                </div>
                <div id="chkemailmsg">
                    <center>
                        <button type="button" class="btn btn-primary buttonlogin" onclick="chkValCode()">Send</button>
                        <div>
                            <p>Check your email for the validation code</p>
                            <p>Check your spam folder if no email recieved</p>
                        </div>
                    </center>
                </div>
            </form>
        </div>

        <div id="depositbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;">

            <div class="close">
                <span aria-hidden="true" onclick="$('#depositbox').hide();">&times;</span>
            </div>
            <form style="padding: 10px;" autocomplete="off">
                <div class="form-group">
                    <label for="depositamount">Deposit amount (min $20 AUD)</label>
                    <input type="depositamount" class="form-control" id="depositamount" placeholder="amount">
                </div>

                <div style="justify-content: center">
                    <center>
                        <button type="button" class="btn btn-primary buttonlogin" onclick="depositEvent()">
                            Deposit
                        </button>
                        <br>
                    </center>
                </div>
            </form>
        </div>
        <!-- make a comment -->
        <div id="withdrawbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;">

            <div class="close">
                <span aria-hidden="true" onclick="$('#withdrawbox').hide();">&times;</span>
            </div>
            <form style="padding: 10px;" autocomplete="off">
                <div class="form-group">
                    <label for="withdrawamount">Withdraw amount</label>
                    <input type="withdrawamount" class="form-control" id="withdrawamount" placeholder="amount">
                </div>

                <div style="justify-content: center">
                    <center>
                        <button type="button" class="btn btn-primary buttonlogin" onclick="withdrawEvent()">
                            Withdraw
                        </button>
                        <br>
                    </center>
                </div>
            </form>
        </div>


        <div id="historybox" class="container historycontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;">

            <div class="close">
                <span aria-hidden="true" onclick="$('#historybox').hide();">&times;</span>
            </div>

            <div class="container transtable">
                <!-- <h2 class="sticky-top">Transactions</h2> -->
                <!-- <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p> -->
                <table class="table sticky-top">
                    <thead>
                        <tr class="transtablehead sticky-top">
                            <th>Date</th>
                            <th>Transaction type</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody id="historybody">

                    </tbody>
                </table>
            </div>

        </div>

        <div id="predictionsbox" class="container predictionscontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;">

            <div class="close">
                <span aria-hidden="true" onclick="$('#predictionsbox').hide();">&times;</span>
            </div>

            <div class="container">
                <!-- <h2 class="sticky-top">Predictions</h2> -->
                <!-- <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p> -->
                <table class="table ">
                    <thead>
                        <tr class="sticky-top" style="background-color: black !important;">

                            <th>Game</th>
                            <th>Home team</th>
                            <th>Away team</th>
                            <th>Predicted winner</th>
                        </tr>
                    </thead>
                    <tbody id="predictionsbody">

                    </tbody>
                </table>
            </div>

        </div>
        <div id="resultsbox" class="container resultscontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;">

            <div class="close">
                <span aria-hidden="true" onclick="$('#resultsbox').hide();">&times;</span>
            </div>

            <div class="container">
                <!-- <h2 class="sticky-top">Results</h2> -->
                <!-- <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p> -->
                <table class="table transtable">
                    <thead>
                        <tr class="sticky-top" style="background-color: black !important;">
                            <th></th>
                            <th>Game ID</th>
                            <th>Teams</th>
                            <th>Winner</th>
                            <th>Predicted</th>
                            <th>Outcome</th>
                        </tr>
                    </thead>
                    <tbody id="resultsbody">

                    </tbody>
                </table>
            </div>

        </div>

        <div id="pp" class="paypalcontainer panel modal modal-content" style="display: none; border-radius: 10%; margin-left: 40%;margin-top: 5rem;">

            <div class="overlay hidden">
                <div class="overlay-content"><img src="css/loading.gif" alt="Processing..." /></div>
            </div>
            <div class="form-group">
                <label for="amt" style="color: #000000; font-size: 18px; font-weight: 700;">Deposit amount (min $20)
                    <span style="font-weight: 700; margin-left: 230px; font-size: 22px;" onclick="$('.paypalcontainer').hide();">
                        X
                    </span>
                </label>
                <input type="number" class="form-control" id="amt" name="amt" value=20 onchange="deposit()">
            </div>

            <div class="panel-heading">
                <h5 id="pt" class="panel-title">
                </h5>

                <!-- Product Info -->
                <p id="pt2">
                </p>
                <p id="pt3">

                </p>

                <div class="panel-body">
                    <!-- Display status message -->
                    <div id="paymentResponse" class="hidden"></div>

                    <!-- Set up a container element for the button -->
                    <div id="paypal-button-container"></div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="./js/smtp.js"></script>
        <script type="text/javascript" src="./js/jquery.min.js"></script>
        <script type="text/javascript" src="./js/popper.min.js"></script>
        <script type="text/javascript" src="./js/aflpools.js"></script>
        <script type="text/javascript" src="./js/bootstrapv4.3.1.min.js"></script>


        <script src="https://www.paypal.com/sdk/js?client-id=<?php echo PAYPAL_SANDBOX ? PAYPAL_SANDBOX_CLIENT_ID : PAYPAL_PROD_CLIENT_ID; ?>&currency=<?php echo $currency; ?>">
        </script>
        <script>
            paypal.Buttons({
                // Sets up the transaction when a payment button is clicked
                createOrder: (data, actions) => {
                    return actions.order.create({
                        "purchase_units": [{
                            "custom_id": `${itemNumber}`,
                            "description": `${itemName}`,
                            "amount": {
                                "currency_code": `${currency}`,
                                "value": `${itemPrice}`,
                                "breakdown": {
                                    "item_total": {
                                        "currency_code": `${currency}`,
                                        "value": `${itemPrice}`
                                    }
                                }
                            },
                            "items": [{
                                "name": `${itemName}`,
                                "description": `${itemName}`,
                                "unit_amount": {
                                    "currency_code": `${currency}`,
                                    "value": `${itemPrice}`
                                },
                                "quantity": "1",
                                "category": "DIGITAL_GOODS"
                            }, ]
                        }],
                        application_context: {
                            shipping_preference: 'NO_SHIPPING'
                        }
                    });
                },
                // Finalize the transaction after payer approval
                onApprove: (data, actions) => {
                    return actions.order.capture().then(function(orderData) {
                        setProcessing(true);

                        var postData = {
                            paypal_order_check: 1,
                            order_id: orderData.id
                        };
                        fetch('paypal_standard_checkout_in_php/paypal_checkout_validate.php', {
                                method: 'POST',
                                headers: {
                                    'Accept': 'application/json'
                                },
                                body: encodeFormData(postData)
                            })
                            .then((response) => response.json())
                            .then((result) => {
                                console.log("paypal_checkout_validate result", result);
                                if (result.status == 1) {
                                    alert("Payment SUCCESS!");
                                    console.log("ref_id", result.ref_id);
                                    updateDeposit(result.ref_id);
                                    // window.location.href = "paypal_standard_checkout_in_php/payment-status.php?checkout_ref_id=" + result.ref_id;
                                } else {
                                    const messageContainer = document.querySelector(
                                        "#paymentResponse");
                                    messageContainer.classList.remove("hidden");
                                    messageContainer.textContent = result.msg;

                                    setTimeout(function() {
                                        messageContainer.classList.add("hidden");
                                        messageText.textContent = "";
                                    }, 5000);
                                }
                                setProcessing(false);
                            })
                            .catch(error => console.log(error));
                    });
                }
            }).render('#paypal-button-container');

            const encodeFormData = (data) => {
                var form_data = new FormData();

                for (var key in data) {
                    form_data.append(key, data[key]);
                }
                return form_data;
            }

            // Show a loader on payment form processing
            const setProcessing = (isProcessing) => {
                if (isProcessing) {
                    document.querySelector(".overlay").classList.remove("hidden");
                } else {
                    document.querySelector(".overlay").classList.add("hidden");
                }
            }

            // <div id="mybalance" class="mybalancecontainer panel modal modal-content"
            // style="display: none; border-radius: 0%; margin-top: 5rem;">

            //     <div class="overlay hidden">
            //         <div class="overlay-content"></div>
            //         <h1>$200</h1>
            //     </div>
        </script>
</body>