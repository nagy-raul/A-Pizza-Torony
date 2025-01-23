<?php
declare(strict_types=1);

// Include environment
require_once("./environment.php");

// Get arguments
$args = Util::getArgs();

// Set SQL command
$query ="SELECT `felhasznaloID`, 
                `nev`, 
                `email`, 
                `orszagkod`, 
                `telszam`, 
                `lakcim`, 
                `jelszo`, 
         FROM `felhasznalok`
		 WHERE `felhasznaloID` = :id
		 LIMIT 1";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Check result
if (is_null($result))
	Util::setError("A felhasználó nem létezik!");

// Simplifying the result
$result = $result[0];

// Ser response
Util::setResponse($result);