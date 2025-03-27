<?php
declare(strict_types=1);

// Database connection settings
$host = 'localhost';
$dbname = 'pizza_etterem';
$username = 'root';
$password = '';

try {
    // Connect to MySQL server using PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    die(json_encode(['error' => 'Database connection failed: ' . $e->getMessage()]));
}

// Get arguments from request
$args = json_decode(file_get_contents("php://input"), true);

if (!$args || !isset($args['email'])) {
    die(json_encode(['error' => 'Missing required parameters.']));
}

// Check if email already exists
$query = "SELECT `felhasznaloID` FROM `felhasznalok` WHERE `email` = ? LIMIT 1";
$stmt = $pdo->prepare($query);
$stmt->execute([$args['email']]);

if ($stmt->fetch()) {
    die(json_encode(['error' => 'Felhasználó már létezik ezen az e-mail címen!']));
}

// Hash the password before storing it
$args['password'] = password_hash($args['password'], PASSWORD_DEFAULT);

// Insert new user
$query = "INSERT INTO `felhasznalok` (`nev`, `email`, `orszagkod`, `telszam`, `lakcim`, `jelszo`) 
          VALUES (:name, :email, :countryCode, :phone, :address, :password)";
$stmt = $pdo->prepare($query);
$success = $stmt->execute([
    'name' => $args['nev'],
    'email' => $args['email'],
    'countryCode' => $args['orszagkod'],
    'phone' => $args['telszam'],
    'address' => $args['lakcim'],
    'password' => $args['password']
]);

// Close connection
$pdo = null;

// Return response
echo json_encode(['success' => $success]);
