<?php
declare(strict_types=1);

// Database connection settings
$host = 'localhost';
$dbname = 'pizza_etterem';
$username = 'root';
$password = '';

try {
    // Connect to MySQL server using PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    // Get arguments from POST request
    $args = [
        'name' => $_POST['name'] ?? '',
        'email' => $_POST['email'] ?? '',
        'countryCode' => $_POST['countryCode'] ?? '',
        'phone' => $_POST['phone'] ?? '',
        'targy' => $_POST['targy'] ?? '',
        'uzenet' => $_POST['uzenet'] ?? ''
    ];

    // Validate required fields
    if (empty($args['name']) || empty($args['email']) || empty($args['uzenet'])) {
        echo json_encode(['success' => false, 'message' => 'Missing required fields']);
        exit;
    }

    // Prepare SQL command
    $query = "INSERT INTO `rendelesek` (`nev`, `email`, `orszagkod`, `telszam`, `targy`, `uzenet`) 
              VALUES (:name, :email, :countryCode, :phone, :targy, :uzenet)";
    
    // Execute SQL command
    $stmt = $pdo->prepare($query);
    $success = $stmt->execute($args);

    // Send JSON response
    echo json_encode(['success' => $success]);

} catch (PDOException $e) {
    // Handle errors
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}