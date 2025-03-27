<?php

declare(strict_types=1);

// Database connection settings
$host = 'localhost';
$dbname = 'pizza_etterem';
$username = 'root';
$password = '';

try {
    // Create a new database connection
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Execute the query
    $stmt = $pdo->query("SELECT * FROM `pizza`");

    // Fetch all results as an associative array
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Close connection
    $pdo = null;

    // Return JSON response
    header('Content-Type: application/json');
    echo json_encode($result);
} catch (PDOException $e) {
    // Handle errors
    http_response_code(500);
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}