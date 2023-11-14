<?php
require 'database.php';

$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];

register($username, $password, $email, $pdo);

header('Location: adverts.php');
