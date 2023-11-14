<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <h2>Создать объявление</h2>
    <form action="createAd.php" method="post">
        <label for="title">Заголовок:</label><br>
        <input type="text" id="title" name="title" required><br>
        <label for="description">Описание:</label><br>
        <textarea id="description" name="description" required></textarea><br>
        <input type="submit" value="Создать объявление">
    </form>


        <h1>Объявления</h1>
        <?php
        require 'database.php';
        displayAds($pdo);
        ?>

</body>
</html>