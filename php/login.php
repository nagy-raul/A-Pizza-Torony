<?php
declare(strict_types=1);

// Include environment
require_once("./environment.php");

// Get arguments
$args = Util::getArgs();

// Set SQL command
$query =  "SELECT `felhasznaloID`, 
                 	`nev`, 
				 					/*`email`, */
				 					`orszagkod`, 
				 					`telszam`, 
				 					`lakcim`, 
				 					`jelszo`, 
				 					`letrehozas` 
          	 FROM `felhasznalok`
		  		 	WHERE `email` = ?
		  		 	LIMIT 1";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query, array($args['email']));

// Close connection
$db = null;

// Check result
if (is_null($result))
	Util::setError("A felhasználó nem létezik ezen az e-mail címen!");

// Simplifying the result
$result = $result[0];

// Check password
if ($result['jelszo'] !== $args['password'])
	Util::setError("Helytelen jelszó!");

// Remove password property
unset($result['jelszo']);

// Ser response
Util::setResponse($result);