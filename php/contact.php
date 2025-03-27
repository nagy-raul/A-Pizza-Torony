<?php
declare(strict_types=1);

// Database connection settings
$host = 'localhost';
$dbname = 'pizza_etterem';
$username = 'root';
$password = '';

try {
    // Connect to MySQL using PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    // Get input arguments safely
    $input = json_decode(file_get_contents('php://input'), true);

    if (!$input) {
        throw new Exception("Invalid input data.");
    }

    // Prepare SQL command
    $query = "INSERT INTO `kapcsolat`(`nev`, `email`, `orszagkod`, `telszam`, `targy`, `uzenet`) 
              VALUES (:name, :email, :countryCode, :phone, :targy, :uzenet)";

    $stmt = $pdo->prepare($query);

    // Execute query with sanitized inputs
    $result = $stmt->execute([
        ':name' => $input['name'] ?? null,
        ':email' => $input['email'] ?? null,
        ':countryCode' => $input['countryCode'] ?? null,
        ':phone' => $input['phone'] ?? null,
        ':targy' => $input['targy'] ?? null,
        ':uzenet' => $input['uzenet'] ?? null
    ]);

    // Close connection
    $pdo = null;

    // Set response
    echo json_encode(['success' => $result]);

} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>