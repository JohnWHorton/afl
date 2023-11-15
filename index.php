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
    <meta name="viewport" content="width=device-width">
    <title>AFL Pools</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <!-- should always be last-->
    <link rel="stylesheet" href="./css/aflpools.css" type="text/css">
    <!------ Include the above in your HEAD tag ---------->
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <span style="font-size: 1.5rem; margin-right: 1rem;">HerdNerd</span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <!-- <li class="nav-item active">
                    <a class="nav-link" href="#">
                        Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li> -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        My account
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" onclick="showPayPal()">Deposit funds</a>
                        <a class="dropdown-item" href="#">What's my balance</a>
                        <!-- <div class="dropdown-divider"></div> -->
                        <a class="dropdown-item" href="#">Withdraw funds</a>
                        <a class="dropdown-item" href="#">Show my history</a>
                    </div>
                </li>
                <!-- <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li> -->
            </ul>
            <text>
                <span style="margin-right: 1rem; font-size: 1rem;">Welcome to the game</span>
            </text>
            <button type="button" class="btn btn-primary loginbtn" onclick="showHideLoginbox()">Login</button>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4">
                <img src="./images/aflstadium.png" class="center-block" style="height:9rem; margin-top: 10px; border-radius: 50%; ">
            </div>
            <div class="col-sm-4" style="text-align:center; margin: auto; font-style: italic; ">
                <h1>
                    Community Footie
                    Pools
                </h1>
            </div>
            <div class="col-sm-4">
                <img src="./images/aflstadium.png" class="center-block" style="height:9rem; margin-top: 10px; border-radius: 50%; ">
            </div>
        </div>
    </div>

    <div id="loginbox" class="container logincontainer modal modal-content" style="display: none; border-radius: 10%; margin-left: 40%;margin-top: 2rem;">
        <form style="padding: 10px;">
            <div class="form-group">
                <label for="emailaddress">Email address</label>
                <input type="email" class="form-control" id="lemail" aria-describedby="emailHelp" placeholder="Enter email">
                <small id="emailHelp" class="form-text text-muted">
                    We'll never share your
                    email with anyone
                    else.
                </small>
            </div>
            <div class="form-group">
                <label for="current-password">Password</label>
                <input type="password" class="form-control" id="lpassword" placeholder="Enter Password">
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
                    <a onclick="$('#loginbox').hide(); $('#registerbox').show();" href="#" style="color: white;">
                        Don't have an account? Register
                    </a>
                </center>
            </div>
        </form>
    </div>
    <!-- <form action="action_page.php"> -->
    <div id="registerbox" class="container registercontainer modal modal-content" style="display: none; border-radius: 10%;margin-left: 40%;margin-top: 2rem;">
        <form style="padding: 10px;">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="text" class="form-control" id="remail" placeholder="Enter Email" required>
            </div>
            <div class="form-group">
                <label for="rpassword">Password</label>
                <input type="password" class="form-control" id="rpassword" placeholder="Enter Password" required>
            </div>
            <div class="form-group">
                <label for="rrpassword">Repeat Password</label>
                <input type="password" class="form-control" id="rrpassword" placeholder="Repeat Password" required>
            </div>
            <p>
                By creating an account you agree to our
                <a href="#">
                    Terms
                    & Privacy
                </a>
                .
            </p>
            <center>
                <button type="button" class="btn btn-primary buttonlogin" onclick="registerEvent()">Register</button>
                <br>
                <a onclick="doLogin()" href="#" style="color: white;">
                    Already have an account? Sign in
                </a>
            </center>
    </div>
    </form>
    </div>
    <div id="afldata">
        <center>
            <div class="colcontainer">
                <div class="row" style="width: 100%!important;">
                    <div>
                        <div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Select 6 games</th>
                                        <th>Home Team</th>
                                        <th></th>
                                        <th>Away Team</th>
                                        <th>Select Winner</th>
                                    </tr>
                                </thead>
                                <tbody id="tableleft"></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-1"></div>
                    <div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Select 6 games</th>
                                    <th>Home Team</th>
                                    <th></th>
                                    <th>Away Team</th>
                                    <th>Select Winner</th>
                                </tr>
                            </thead>
                            <tbody id="tableright"></tbody>
                        </table>
                    </div>
                    <div class="col-3" style="min-width: 30%; max-width: 30%;">
                        <pre>
                            <span id="info"></span>
                        </pre>
                    </div>
                </div>
            </div>
        </center>
    </div>
    </div>

    <div id="pp" class="paypalcontainer panel modal modal-content" style="display: none; border-radius: 10%; margin-left: 40%;margin-top: 2rem;">

        <div class="overlay hidden">
            <div class="overlay-content"><img src="css/loading.gif" alt="Processing..." /></div>
        </div>
        <div class="form-group">
            <label for="amt" style="color: #000000; font-size: 18px; font-weight: 700;">Deposit amount (min $20)
                <span style="font-weight: 700; margin-left: 230px; font-size: 22px;" onclick="$('.paypalcontainer').hide();">
                    X
                </span>
            </label>
            <input type="number" class="form-control" id="amt" name="amt" value=20 onchange="depositing()">
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
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./js/popper.min.js"></script>
    <script type="text/javascript" src="./js/aflpools.js"></script>
    <script type="text/javascript" src="./js/bootstrapv4.3.1.min.js"></script>

    <script src="https://www.paypal.com/sdk/js?client-id=<?php echo PAYPAL_SANDBOX ? PAYPAL_SANDBOX_CLIENT_ID : PAYPAL_PROD_CLIENT_ID; ?>&currency=<?php echo $currency; ?>"></script>
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
                                // window.location.href = "paypal_standard_checkout_in_php/payment-status.php?checkout_ref_id=" + result.ref_id;
                            } else {
                                const messageContainer = document.querySelector("#paymentResponse");
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
    </script>
</body>