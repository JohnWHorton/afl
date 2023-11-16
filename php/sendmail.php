<?php
require 'vendor/autoload.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$mail = new PHPMailer();


$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$operation = isset($request->operation) ? $request->operation : "forgotPswd";
$email = isset($request->email) ? $request->email : "john_horton54@outlook.com";

$resparr = array();

if ($operation == "forgotPswd") {
    $resparr = forgotPswd($mail, $email);
}
// if ($operation == "loginUser") {
//     $resparr = loginUser($conn, $email, $pswd);
// }

// var_dump($resparr);
echo json_encode($resparr);

function forgotPswd($mail, $email)
{
    try {
        $mail->SMTPDebug = 2;
        $mail->isSMTP();
        $mail->Host       = 'smtp.gmail.com;';
        $mail->SMTPAuth   = true;
        $mail->Username   = 'john.horton86@gmail.com';
        $mail->Password   = 'Ashleigh2!';
        $mail->SMTPSecure = 'tls';
        $mail->Port       = 587;

        $mail->setFrom('john.horton86@gmail.com', 'John');
        $mail->addAddress($email);
        // $mail->addAddress('receiver2@gmail.com', 'Name');

        $mail->isHTML(true);
        $mail->Subject = 'Subject';
        $mail->Body    = 'HTML message body in <b>bold</b> ';
        $mail->AltBody = 'Body in plain text for non-HTML mail clients';
        $mail->send();
        echo "Mail has been sent successfully!";
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }

    array_push($resparr, 'OK', '123456');

    return $resparr;
}
