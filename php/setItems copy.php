<?php

header('Content-Type: application/json');

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pizza_etterem";

$conn = new mysqli($servername, $username, $password, $dbname);

// Get incoming data (JSON expected)
$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['cart']) || !isset($data['rendelesID'])) {
    die(json_encode(["status" => "error", "message" => "Missing cart or rendelesID"]));
}

$cart = $data['cart'];
$rendelesID = intval($data['rendelesID']);

// Insert each item into database
foreach ($cart as $item) {

    $termekID = isset($item['termekID']) ? intval($item['termekID']) : 0;
    $darab = intval($item['db']);
    $price = intval($item['price']);

    $stmt = $conn->prepare("INSERT INTO rendeles_elemei (rendelesID, termekID, darab, termekAr) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("iiii", $rendelesID, $termekID, $darab, $item['price']);

    $stmt->execute();
    $stmt->close();
}

echo json_encode(["status" => "success", "message" => "Cart uploaded successfully."]);

$conn->close();
?>