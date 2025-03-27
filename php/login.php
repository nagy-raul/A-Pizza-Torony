<?php
declare(strict_types=1);

// Database connection settings
$host = 'localhost';
$dbname = 'pizza_etterem';
$username = 'root';
$password = '';

// Get arguments from request
$args = json_decode(file_get_contents('php://input'), true);

if (!isset($args['email']) || !isset($args['password'])) {
    http_response_code(400);
    echo json_encode(["error" => "Missing email or password."]);
    exit;
}

// Set SQL command
$query = "SELECT `felhasznaloID`, `nev`, `email`, `orszagkod`, `telszam`, `lakcim`, `jelszo` 
          FROM `felhasznalok` 
          WHERE `email` = ? 
          LIMIT 1";

try {
    // Connect to MySQL server
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    $stmt = $pdo->prepare($query);
    $stmt->execute([$args['email']]);
    $result = $stmt->fetch();

    if (!$result) {
        http_response_code(404);
        echo json_encode(["error" => "A felhasználó nem létezik ezen az e-mail címen!"]);
        exit;
    }

    // Check password
    if (!password_verify($args['password'], $result['jelszo'])) {
        http_response_code(401);
        echo json_encode(["error" => "Helytelen jelszó!"]);
        exit;
    }

    // Remove password property
    unset($result['jelszo']);

    // Send response
    echo json_encode($result);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    exit;
}