<?php

require_once '../vendor/autoload.php';
require_once '../secrets.php';

$stripe = new \Stripe\StripeClient($stripeSecretKey);
header('Content-Type: application/json');

$YOUR_DOMAIN = 'http://localhost:4242';

$checkout_session = $stripe->checkout->sessions->create([
  'ui_mode' => 'embedded',
  'line_items' => [[
    # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
    'price' => 'price_1OgRECDol7H5bJPd5e7zpHaj',
    'quantity' => 1,
  ]],
  'mode' => 'payment',
  'return_url' => 'http://localhost:82/afl',
]);

  echo json_encode(array('clientSecret' => $checkout_session->client_secret));