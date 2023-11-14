<?php
require 'database.php';

$username = $_POST['username'];
$password = $_POST['password'];

login($username, $password, $pdo);

header('Location: adverts.php');
