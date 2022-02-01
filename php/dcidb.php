<?php

$host = '192.168.20.101';
$db   = 'feed_monitor';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$conn = new mysqli($host,$user,$pass,$db);

// Check connection
if ($conn -> connect_errno) {
  echo "Failed to connect to MySQL: " . $conn -> connect_error;
  exit();
}

?>