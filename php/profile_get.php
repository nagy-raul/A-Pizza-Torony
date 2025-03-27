<?php
declare(strict_types=1);

// Database connection settings
$host = 'localhost';
$dbname = 'pizza_etterem';
$username = 'root';
$password = '';

// Get arguments from GET or POST
$id = $_GET['id'] ?? $_POST['id'] ?? null;

if (!$id) {
    http_response_code(400);
    echo json_encode(["error" => "Missing required parameter: id"]);
    exit;
}

try {
    // Connect to MySQL
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    // Set SQL command
    $query = "SELECT `felhasznaloID` AS `id`, 
                     `nev`           AS `name`, 
                     `email`         AS `email`, 
                     `orszagkod`     AS `countryCode`, 
                     `telszam`       AS `phone`, 
                     `lakcim`        AS `address`
              FROM `felhasznalok`
              WHERE `felhasznaloID` = :id
              LIMIT 1";

    // Execute SQL command
    $stmt = $pdo->prepare($query);
    $stmt->execute(['id' => $id]);
    $result = $stmt->fetch();

    // Close connection
    $pdo = null;

    // Check result
    if (!$result) {
        http_response_code(404);
        echo json_encode(["error" => "A felhasználó nem létezik!"]);
        exit;
    }

    // Send response as JSON
    echo json_encode($result);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    exit;
}
