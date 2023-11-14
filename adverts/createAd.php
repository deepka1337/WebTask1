<?php
require 'database.php';

$title = $_POST['title'];
$description = $_POST['description'];

createAd($title, $description, $pdo);

header('Location: adverts.php');
