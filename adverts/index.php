<!DOCTYPE html>
<html>
<head>
    <title>Регистрация и Вход</title>
</head>
<body>
    <h2>Регистрация</h2>
    <form action="register.php" method="post">
        <label for="username">Имя пользователя:</label><br>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Пароль:</label><br>
        <input type="password" id="password" name="password" required><br>
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br>
        <input type="submit" value="Зарегистрироваться">
    </form>

    <h2>Вход</h2>
    <form action="login.php" method="post">
        <label for="login_username">Имя пользователя:</label><br>
        <input type="text" id="login_username" name="username" required><br>
        <label for="login_password">Пароль:</label><br>
        <input type="password" id="login_password" name="password" required><br>
        <input type="submit" value="Войти">
    </form>

    
</body>

</html>