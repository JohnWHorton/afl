<?php 
 
// Product Details 
$itemNumber = "BET20"; 
$itemName = "Enter Pool"; 
$itemPrice = 20;  
$currency = "AUD"; 
 
/* PayPal REST API configuration 
 * You can generate API credentials from the PayPal developer panel. 
 * See your keys here: https://developer.paypal.com/dashboard/ 
 */ 
define('PAYPAL_SANDBOX', TRUE); //TRUE=Sandbox | FALSE=Production 
define('PAYPAL_SANDBOX_CLIENT_ID', 'AdqP5SMZsMBx8kiJsiUlUnfBoJSrk18wnCwim1oVOvvLjMWQup8z3rEpDPLMPb-4pjwvU_gQHkZZ_Ak7'); 
define('PAYPAL_SANDBOX_CLIENT_SECRET', 'EDr5aIFQBMEPsjC8aE9oTz0u9vJhuFUa58o0Om628x8jjHQq7Wti6kCBpy9gRXP7odmXXbXea-38VNOd'); 
define('PAYPAL_PROD_CLIENT_ID', 'Insert_Live_PayPal_Client_ID_Here'); 
define('PAYPAL_PROD_CLIENT_SECRET', 'Insert_Live_PayPal_Secret_Key_Here'); 
  
// Database configuration  
define('DB_HOST', 'localhost');  
define('DB_USERNAME', 'john');  
define('DB_PASSWORD', 'john');  
define('DB_NAME', 'afl'); 
 
?>