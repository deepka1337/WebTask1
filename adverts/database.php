<?php
// Подключение к базе данных
$db_host = 'localhost';
$db_name = 'adverts';
$db_user = 'root';
$db_password = '';

// Процедура подключения к бд
try {
    $pdo = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_password);
    // Устанавливаем режим обработки ошибок PDO на исключение
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
// Функция регистрации
function register($username, $password, $email, $pdo)
{
    // Проверяем на повтор пользователя
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ? OR email = ?");
    $stmt->execute([$username, $email]);
    if ($stmt->rowCount() > 0) {
        return false;
    }
    // Хешируем пароль
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    // Добавляем нового пользователя
    $stmt = $pdo->prepare("INSERT INTO users (username, password, email) VALUES (?, ?, ?)");
    $stmt->execute([$username, $hashed_password, $email]);
    return true;
}



// Функция авторизации
function login($username, $password, $pdo)
{
    // Ищем пользователя с таким именем
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->execute([$username]);
    if ($stmt->rowCount() > 0) {
        $user = $stmt->fetch();
        // Сверяем введенный пароль с хешем в базе
        if (password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['id'];
            // Устанавливаем куки с идентификатором пользователя
            // Куки будет сохраняться на протяжении недели
            setcookie('user_id', $user['id'], time() + (7 * 24 * 60 * 60));
            return true;
        }
    }
}


// Функция создания объявлений
function createAd($title, $description, $pdo)
{
    // Проверяем, авторизован ли пользователь
    if (!isset($_SESSION['user_id']) && !isset($_COOKIE['user_id'])) {
        return false;
    }
    // Если пользователь авторизован через сессию
    if (isset($_SESSION['user_id'])) {
        $userId = $_SESSION['user_id'];
    }
    // Если пользователь авторизован через куки
    else if (isset($_COOKIE['user_id'])) {
        $userId = $_COOKIE['user_id'];
    }

    // Добавляем новое объявление
    $stmt = $pdo->prepare("INSERT INTO ads (user_id, title, description) VALUES (?, ?, ?)");
    $stmt->execute([$userId, $title, $description]);
    return true;
}

function displayAds($pdo)
{
    $stmt = $pdo->prepare("SELECT * FROM ads");
    $stmt->execute();

    while ($ad = $stmt->fetch()) {
        echo "<h2>{$ad['title']}</h2>";
        echo "<p>{$ad['description']}</p>";
        echo "<hr>";
    }
}