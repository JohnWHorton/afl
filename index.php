<?php
// Include the configuration file
// require_once './paypal_standard_checkout_in_php/config.php';
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="description" content="Fans of AFL can make predictions forthe winners of each round, with the best predictions sharing a Prize pool. Free membership." />
    <meta name="keywords" content="afl aussie rules footie prediction prize pool " />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AFL Pools</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <!-- should always be last-->
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/aflpools.css" type="text/css">
    <link rel="manifest" href="./manifest.webmanifest">

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
                <li class="nav-item" style="padding-top: 8px; cursor: pointer;">
                    <a class="nav-item" onclick="hideAllBoxes();showStripe()">Deposit funds</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-target="dropdown_target" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #ffffff;">
                        My account
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdown_target">
                        <!-- <a class="dropdown-item" onclick="hideAllBoxes();showHideDepositbox()">Deposit funds</a> -->
                        <a class="dropdown-item" onclick="hideAllBoxes();showStripe()">Deposit funds</a>
                        <a class="dropdown-item" onclick="hideAllBoxes();showHideWithdrawbox()">Redeem tokens</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" onclick="hideAllBoxes();getResults()">My results</a>
                        <a class="dropdown-item" onclick="hideAllBoxes();getPredictions()">My predictions</a>
                        <a class="dropdown-item" onclick="hideAllBoxes();getTransactionhistory()">Show my
                            transactions</a>
                        <a class="dropdown-item" onclick="hideAllBoxes();showDemoVideo()">Watch demo video</a>
                    </div>
                </li>
                <li class="form-inline">
                    <label style="color: #ffffff; margin: 0;">Round</label> &nbsp;
                    <!-- <input class="form-control " type="text" id="selectround" oninput="getRound()"> -->
                    <select id="selectround" onchange="getRound()">
                    </select>
                </li>
                <li class="nav-item">
                    <a id="funds" class="nav-link" href="#"></a>
                </li>
                <li class="nav-item">
                    <a id="welcome" class="nav-link" href="#">Welcome to the game</a>
                </li>
                <li id="loginout" class="nav-item">
                    <button type="button" class="btn btn-primary btnlogin" onclick="$('.navbar .collapse').collapse('hide');hideAllBoxes();showHideLoginbox()">Login</button>
                </li>
                <li class="nav-item">
                    <button id="joinup" type="button" class="btn btn-secondary btnlogin" onclick="$('.navbar .collapse').collapse('hide');hideAllBoxes();$('#registerbox').show();">Join</button>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid" style="width: 100%!important; margin-top: 0; background-color: rgba(0,0,0,0.3); overflow: auto;">
        <!-- <div class="row">
            <video muted loop id="myVideo">
                <source src="videos/afl3.mp4" type="video/mp4">
            </video>
            <div class="col-sm-12">

                <div style="text-align: center; margin-top: 20px; font-style: italic;">
                    <h3>Community Footie Pools</h3>
                </div>
            </div>
            <button id="btnSound" onclick="toggleSound()"><img src="images/soundbtn.png"></button>
            <button id="btnPlay" onclick="togglePlay()"><img src="images/playbtn.png"></button>
            <button id="btnStop" onclick="closeVideo()"><img src="images/stopbtn.png"></button>

        </div> -->

        <div class="row">
            <div id="predictnow" style="display: none; z-index: 3;">
                <button class="btn predictionnowbtn" onclick="makeprediction()">Save my Prediction</button>
            </div>
            <div class="col-sm-12" style="min-height: 60px; max-height: 60px;">
                <div class="msg" style="text-align: center; display: none;">
                </div>
            </div>
        </div>

        <div id="afldata" class="main-content">

            <div id="prizepool" class="colcontainer" style="min-height: 65px">
                <img src="./images/saco.svg" width=60 height=60 style="display: block; margin: auto;" />
                <div id="prizepoolamt" style="color: yellow; font-size: 28px; font-style:italic; margin: auto; z-index: 3;"></div>
            </div>

            <div id="whytext" class="colcontainer">
                <div class="row" style="width: 100%!important;">
                    <div class="col-sm-12" style="text-align: center; margin-left: 1rem; margin-right: -0.9rem; background-color: rgba(0,0,0,0.7); overflow: auto;">
                        <br />
                        <h4 style="text-align: center; color: gold; cursor: pointer;" onclick="$('.how-it-works').show();">Click here to see how this works</h4>
                        <section class="section how-it-works" style="display: none;">
                            <div class="grid-container">
                                <div class="grid-x grid-padding-x">
                                    <div class="small-12 cell">
                                        <div class="close">
                                            <span aria-hidden="true" onclick="$('.how-it-works').hide(); ">
                                                x
                                            </span>
                                        </div>
                                        <h3>HOW IT WORKS</h3>
                                        <div class="how-it-works__items">
                                            <div class="how-it-works__item"><img class=" lazyloaded" data-src="images/number-1.png" alt="" src="images/number-1.png">
                                                <div class="how-it-works__item-inner">
                                                    <h4>JOIN AFL Pools Club</h4>
                                                    <p>Sign up! and verify your identity, it's easy and takes less than
                                                        2 minutes</p>
                                                </div>
                                            </div>
                                            <div class="how-it-works__item"><img class=" lazyloaded" data-src="images/number-2.png" alt="" src="images/number-2.png">
                                                <div class="how-it-works__item-inner">
                                                    <h4>BUY YOUR PLAYING TOKENS</h4>
                                                    <p>Fund your account with $20 AUD+</p>
                                                </div>
                                            </div>
                                            <div class="how-it-works__item"><img class=" lazyloaded" data-src="images/number-3.png" alt="" src="images/number-3.png">
                                                <div class="how-it-works__item-inner">
                                                    <h4>Make a prediction for the next Round</h4>
                                                    <p>Correct predictions will earn additional tokens<br />
                                                        Redeem your tokens at the end of the season.</p><br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h4 style="text-align: center;"><b>What this site is and how to participate</b></h4>
                            <div style="font-size: 16px; padding: 15px 20px 5px 20px;">
                                This site is not a gambling site.<br />
                                Rather it is a platform for members to compete against each other. This involves members
                                contributing to a Prize Pool, and the most skilled predictions sharing the pool at the
                                end
                                of each round.
                                <br /><br />
                                At no time does this site collect or 'rake' any part of the prize pool. Instead we
                                charge a
                                $5 AUD membership fee. (FREE for 2024 season)
                                <br /><br />
                                Members compete in activities that require strategy, intelligence, creativity, or other
                                skills.<br /><br />

                                Select any 6 games and make a prediction for the Winner of each game.</br>
                                Each set of 6 predictions will contribute $20 AUD into the pool.</br></br>
                                The pool accumulates from the number of predictions and will form the <span style="color:Yellow">PRIZE POOL</span> and
                                this will be shared equally by the Best Predictions for each round.</br>
                                If there are no Winners, the pool will be carried forward to the next round.</br></br>

                            </div>
                        </section>
                    </div>
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
                            <div id="roundname" style="font-size: 24px; color: red;"></div>
                            <div id="select6"></div>
                            <table class="table">
                                <tbody id="tableleft">
                                </tbody>
                            </table>

                        </div>
                        <!-- <div class="col-sm-12"></div> -->
                    </div>
            </center>

        </div>
        <div id="stripebox" class="container stripecontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; padding: 0; height:auto; z-index: 4; margin-top: 200px; position: fixed; height: 100%; overflow-y: scroll;">
            <div id="checkout">
                <!-- Checkout will insert the payment form here -->
            </div>
            <button onclick="cancelDeposit();" style="width: 100%;">Cancel Deposit</button>
        </div>
        <div id="loginbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; z-index: 4; position: fixed;">

            <div class="close">
                <span aria-hidden="true" onclick="hideAllBoxes();"> x </span>
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
                    <input type="password" name="loginPassword" autocomplete="on" class="form-control" id="loginPassword" value="" placeholder="Enter Password">
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value checked id="rememberme">
                    <label class="form-check-label" for="rememberme">
                        Remember me
                    </label>
                </div>
                <div style="justify-content: center">
                    <center>
                        <button type="button" class="btn btn-primary buttonlogin" onclick="loginEvent($('#loginEmail').val(), $('#loginPassword').val(), $('#rememberme').is(':checked'))">
                            Login
                        </button>
                        <br>
                        <a onclick="hideAllBoxes(); $('#registerbox').show();" href="#" style="color: black;">
                            Not a member yet ? Join now
                        </a>
                        <a onclick="forgotPassword()" href="#" style="color: black;">
                            Forgot password? Click here
                        </a>
                    </center>
                </div>
            </form>
        </div>
        <!-- <form action="action_page.php"> -->
        <div id="registerbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; z-index: 4;position: fixed;">

            <div class="close">
                <span aria-hidden="true" onclick="hideAllBoxes();"> x </span>
            </div>

            <form style="padding: 10px;">
                <div>
                    <h4>Join the club</h4>
                </div>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" id="remail" value="" placeholder="Enter Email" required>
                </div>
                <div class="form-group">
                    <label for="rpassword">Password (min 6 chars including at least 1 letter and 1 number)</label>
                    <input type="password" name="rpassword" autocomplete="on" class="form-control" id="rpassword" placeholder="Enter Password" value="" required>
                </div>
                <div class="form-group">
                    <label for="rrpassword">Repeat Password</label>
                    <input type="password" name="rrpassword" autocomplete="on" class="form-control" id="rrpassword" placeholder="Repeat Password" value="" required>
                </div>
                <p>
                    By creating an account you agree to our
                    <a href="#" style="color: black;">
                        Terms, Privacy & Conditions
                    </a>
                    .
                </p>
                <center>
                    <button type="button" class="btn btn-primary buttonlogin" onclick="verifyRegisterEmail()">Join</button>
                    <br>
                    <a onclick="hideAllBoxes(); showHideLoginbox()" href="#" style="color: black;">
                        Already a member? Sign in
                    </a>
                </center>
        </div>

        <div id="validatebox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; z-index: 4;position: fixed;">
            <div class="close">
                <span aria-hidden="true" onclick="hideAllBoxes();"> x </span>
            </div>
            <form style="padding: 10px;">
                <div id="valEmail" class="form-group"></div>
                <div id="vc" class="form-group">
                    <p>Check you emails (including spam folder)</p>
                    <label for="regvalcode">Enter validation code</label>
                    <input type="text" class="form-control" id="regvalcode" required onchange="chkRegValCode()">
                </div>
                <center>
                    <button type="button" class="btn btn-primary buttonlogin" onclick="registerEvent()">Send</button>
                </center>
            </form>
        </div>

        <div id="forgotbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; z-index: 4;position: fixed;">
            <div class="close">
                <span aria-hidden="true" onclick="hideAllBoxes();"> x </span>
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
                        <input type="password" name="newpword" autocomplete="on" class="form-control" id="newpword" placeholder="Enter Password" value="" required>
                    </div>
                    <div class="form-group">
                        <label for="rnewpword">Repeat Password</label>
                        <input type="password" name="rnewpword" autocomplete="on" class="form-control" id="rnewpword" placeholder="Repeat Password" value="" required>
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

        <div id="depositbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; z-index: 4;position: fixed;">

            <div class="close">
                <span aria-hidden="true" onclick="hideAllBoxes();"> x </span>
            </div>
            <form style="padding: 10px;" autocomplete="off">
                <div class="form-group">
                    <label for="depositamount">Deposit amount (min $20 AUD)</label>
                    <input type="depositamount" class="form-control" id="depositamount" placeholder="amount">
                </div>

                <div style="justify-content: center">
                    <center>
                        <!-- <button type="button" class="btn btn-primary buttonlogin" onclick="depositEvent()"> -->
                        <button type="button" class="btn btn-primary buttonlogin" onclick="showPayPal()">
                            Deposit
                        </button>
                        <br>
                    </center>
                </div>
            </form>
        </div>
        <!-- make a comment -->
        <div id="withdrawbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;position: fixed;">

            <div class="close">
                <span aria-hidden="true" onclick="hideAllBoxes();"> x </span>
            </div>
            <form style="padding: 10px;" autocomplete="off">
                <div class="form-group">
                    <p id="showBalance" style="font-size: 18px;"></p>
                    <!-- <label for="withdrawamount">Withdraw amount</label>
                    <input type="withdrawamount" class="form-control" id="withdrawamount" placeholder="amount"> -->
                    <p>Tokens can be redeemed at the end of the season</p>
                </div>

                <!-- <div style="justify-content: center">
                    <center>
                        <button type="button" class="btn btn-primary buttonlogin" onclick="withdrawEvent()">
                            Withdraw
                        </button>
                        <br>
                    </center>
                </div> -->
            </form>
        </div>

        <div id="historybox" class="container historycontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; z-index: 4;position: fixed;">

            <div class="container">

                <table class="table table-striped transtable">
                    <thead class="sticky-top">
                        <tr style="background-color: black !important;">
                            <th>Date</th>
                            <th>Transaction type</th>
                            <th>Amount</th>
                            <th><span class="close" aria-hidden="true" onclick="hideAllBoxes();"> x </span></th>
                        </tr>
                    </thead>
                    <tbody id="historybody">

                    </tbody>
                </table>
            </div>
        </div>

        <div id="predictionsbox" class="container predictionscontainer modal modal-content" style="position: fixed;">

            <div class="container">
                <!-- <h2 class="sticky-top">Predictions</h2> -->
                <!-- <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p> -->
                <table class="table table-striped transtable">
                    <thead class="sticky-top">
                        <tr style="background-color: black !important;">

                            <th>Game</th>
                            <th>Home team</th>
                            <th>Away team</th>
                            <th>Predicted winner</th>
                            <th><span class="close" aria-hidden="true" onclick="hideAllBoxes();"> x </span></th>
                        </tr>
                    </thead>
                    <tbody id="predictionsbody">

                    </tbody>
                </table>
            </div>

        </div>
        <div id="resultsbox" class="container resultscontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem;position: fixed;">

            <div class="container">
                <!-- <h2 class="sticky-top">Results</h2> -->
                <!-- <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p> -->
                <table class="table table-striped transtable ">
                    <thead class="sticky-top">
                        <tr style="background-color: black !important;">
                            <th></th>
                            <th>Game ID</th>
                            <th>Teams</th>
                            <th>Winner</th>
                            <th>Predicted</th>
                            <th>Outcome</th>
                            <th><span class="close" aria-hidden="true" onclick="hideAllBoxes();"> x </span></th>
                        </tr>
                    </thead>

                    <tbody id="resultsbody">

                    </tbody>
                </table>
            </div>

        </div>

        <div id="contactbox" class="container contactcontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; z-index: 4;">
            <div class="close">
                <span aria-hidden="true" onclick="hideAllBoxes();"> x </span>
            </div>
            <div id="contact-form">
                <div class="controls">
                    <div class="row">
                        <div class="col-sm-12">
                            <h4>Contact us</h4>
                            <p>Please be as specific as you can with your enquiry, so that we may be as helpful as
                                possible.</p>
                            <br /><br />
                            <div class="form-group">
                                <label for="form_name">Subject *</label>
                                <input id="form_name" type="text" name="subject" class="form-control" required="required">

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="form_message">Message *</label>
                                <textarea id="form_message" name="message" class="form-control" required="required" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <button class="btn btn-primary btn-send" onclick="sendEmail();">Send message</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <p class="text-muted" style="margin-top: 20px;"><strong>*</strong> These fields are
                                required.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="tcbox" class="container tccontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; z-index: 4;">
            <div class="close">
                <span aria-hidden="true" onclick="hideAllBoxes();"> x </span>
            </div>
            <div class="row">
                <pre>
                <div id="tc" class="col-md-12"></div>
                </pre>
            </div>
        </div>

        <div id="videobox" class="container videocontainer modal modal-content" style="display: none; border-radius: 0%; margin-top: 5rem; background: transparent; max-width: 40%; overflow-y:  hidden;">
        </div>
    </div>

    <script type="text/javascript" src="./js/smtp.js"></script>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./js/popper.min.js"></script>
    <script type="text/javascript" src="./js/aflpools.js"></script>
    <script type="text/javascript" src="./js/moment.js"></script>
    <script type="text/javascript" src="./js/bootstrapv4.3.1.min.js">
    </script>
    <script src="https://kit.fontawesome.com/278fed373f.js" crossorigin="anonymous"></script>
    <script src="https://js.stripe.com/v3/"></script>
    <!-- <script src="./js/checkout.js" defer></script> -->
    <!-- <script src="./js/return.js"></script> -->


    <!--  -->
    <!-- <script>
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
        </script> -->
    <!-- Footer -->
    <footer class="page-footer font-small blue pt-4" style="position: relative; z-index: 3; color:#000000; background-color: #000000;">

        <!-- Footer Links -->
        <div class="container-fluid text-center">

            <!-- Grid row -->
            <div class="row footerrow" style="margin-left: 20%; margin-right: 20%;">
                <!-- Grid column -->
                <div class="col mt-3"><a href="#!" onclick="hideAllBoxes(); getPrivacy();">Privacy and Security</a>
                </div>
                <div class="col mt-3"><a href="#!" onclick="hideAllBoxes(); getTCs();">Terms and Conditions</a>
                </div>
                <div class="col mt-3"><a href="#" onclick="hideAllBoxes(); $('#contactbox').show();">Contact Us</a>
                </div>
                <!-- Links -->
            </div>
            <!-- Grid row -->
        </div>

        <!-- Copyright -->

        <div class="footer-copyright text-center py-3" style="color: #ffffff!important;">© 2024 Copyright:
            <a href="/"> AFL-pools.com</a>
        </div>
    </footer>
    <!-- Footer -->
</body>