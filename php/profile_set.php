<?php
declare(strict_types=1);

// Database connection settings
$host = 'localhost';
$dbname = 'pizza_etterem';
$username = 'root';
$password = '';

// Function to get arguments from request
function getArgs(): array {
    return json_decode(file_get_contents("php://input"), true) ?? [];
}

// Function to send response
function setResponse(bool $success): void {
    header("Content-Type: application/json");
    echo json_encode(["success" => $success]);
    exit;
}

// Get arguments
$args = getArgs();

try {
    // Connect to MySQL server
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ]);

    // Set SQL command
    $query = "UPDATE `felhasznalok` 
               SET `nev`= :name,
                   `email`= :email,
                   `orszagkod`= :countryCode,
                   `telszam`= :phone,
                   `lakcim`= :address
               WHERE `felhasznaloID` = :id;";

    // Prepare and execute SQL command
    $stmt = $pdo->prepare($query);
    $result = $stmt->execute([
        ":name" => $args["name"] ?? null,
        ":email" => $args["email"] ?? null,
        ":countryCode" => $args["countryCode"] ?? null,
        ":phone" => $args["phone"] ?? null,
        ":address" => $args["address"] ?? null,
        ":id" => $args["id"] ?? null,
    ]);

    // Send response
    setResponse($result);
} catch (PDOException $e) {
    error_log("Database error: " . $e->getMessage());
    setResponse(false);
}