<?php

require_once '../vendor/autoload.php';
require_once '../secrets.php';

\Stripe\Stripe::setApiKey($stripeSecretKey);
header('Content-Type: text/html');

$actual_link = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

// $YOUR_DOMAIN = 'http://localhost:82';
$YOUR_DOMAIN = 'http://afl-pools.com';
$price = "20";

if (isset($_POST)) {
  // echo var_dump($_POST);
  $qty = $_POST['qty'];
}
$checkout_session = \Stripe\Checkout\Session::create([
  'line_items' => [[
    # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
    'price' => 'price_1OgRECDol7H5bJPd5e7zpHaj',
    'quantity' => $qty,
  ]],
  'mode' => 'payment',
  'success_url' => $YOUR_DOMAIN . '/afl?deposit=ok',
  'cancel_url' => $YOUR_DOMAIN . '/afl?deposit=cancelled',
]);

header("HTTP/1.1 303 See Other");
header("Location: " . $checkout_session->url);
