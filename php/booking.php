<?php
declare(strict_types=1);

// Database connection settings
$host = 'localhost';
$dbname = 'pizza_etterem';
$username = 'root';
$password = '';

try {
    // Connect to MySQL server
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get arguments from request
    $args = json_decode(file_get_contents("php://input"), true);

    if (!$args) {
        echo json_encode(["success" => false, "message" => "Invalid input"]);
        exit;
    }

    // Prepare SQL command
    $query = "INSERT INTO `asztalfoglalasok`(`nev`, `email`, `orszagkod`, `telszam`, `datum`, `ido`, `orak`, `vendegek`, `megjegyzes`, `igeny`)
              VALUES (:name, :email, :countryCode, :phone, :datum, :ido, :orak, :vendegek, :megjegyzes, :igeny)";
    
    // Execute SQL command
    $stmt = $pdo->prepare($query);
    $result = $stmt->execute([
        ':name' => $args['name'] ?? null,
        ':email' => $args['email'] ?? null,
        ':countryCode' => $args['countryCode'] ?? null,
        ':phone' => $args['phone'] ?? null,
        ':datum' => $args['datum'] ?? null,
        ':ido' => $args['ido'] ?? null,
        ':orak' => $args['orak'] ?? null,
        ':vendegek' => $args['vendegek'] ?? null,
        ':megjegyzes' => $args['megjegyzes'] ?? null,
        ':igeny' => $args['igeny'] ?? null
    ]);

    // Close connection
    $pdo = null;

    // Set response
    echo json_encode(["success" => $result]);
} catch (PDOException $e) {
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}