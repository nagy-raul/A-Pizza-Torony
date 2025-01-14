<?php
declare(strict_types=1);

// Include environment
require_once("./environment.php");

// Get arguments
$args = Util::getArgs();

// Set SQL command
$query = "SELECT 	`felhasznaloID`
		  FROM `felhasznalok` 
		  WHERE `email` = ?
		  LIMIT 1";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query, array($args['email']));

// Check email exist
if (!is_null($result))
	Util::setError("Felhasználó már létezik ezen az e-mail címen!");

// Set SQL command
$query = $db->preparateInsert("felhasznalok", $args);

// Execute SQL command
$result = $db->execute($query, array_values($args));

// Close connection
$db = null;

// Ser response
Util::setResponse($result);