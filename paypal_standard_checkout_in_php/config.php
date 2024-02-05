<?php 
 
// Product Details 
$itemNumber = "Ticket"; 
$itemName = "Enter Pool"; 
$itemPrice = 20;  
$currency = "AUD";

/* PayPal REST API configuration 
 * You can generate API credentials from the PayPal developer panel. 
 * See your keys here: https://developer.paypal.com/dashboard/ 
 */
define('PAYPAL_ID', 'john.horton86@gmail.com'); //Real ID

define('PAYPAL_SANDBOX', FALSE); //TRUE=Sandbox | FALSE=Production 
define('PAYPAL_SANDBOX_CLIENT_ID', 'AdqP5SMZsMBx8kiJsiUlUnfBoJSrk18wnCwim1oVOvvLjMWQup8z3rEpDPLMPb-4pjwvU_gQHkZZ_Ak7'); 
define('PAYPAL_SANDBOX_CLIENT_SECRET', 'EDr5aIFQBMEPsjC8aE9oTz0u9vJhuFUa58o0Om628x8jjHQq7Wti6kCBpy9gRXP7odmXXbXea-38VNOd'); 
define('PAYPAL_PROD_CLIENT_ID', 'Aczoz-VmxG-gYeA0F6uv0P0RboZn2ZMTY_NLyW5jqu-JPdeGGIgrW7yEsvPOJKdC4Vp7f8WT_Ehm65JJ'); 
define('PAYPAL_PROD_CLIENT_SECRET', 'EJ8Uabe2rn3KcX8hhE13q6yMluH1sGAD3DnJm0BskkPNXNIKmso-tA2D7Z8BW2oqsER71cdeYcn5Ju04'); 
  
// Database configuration  
define('DB_HOST', '13.49.223.11');  
define('DB_USERNAME', 'aflpools');  
define('DB_PASSWORD', 'V4513john');  
define('DB_NAME', 'afl');
