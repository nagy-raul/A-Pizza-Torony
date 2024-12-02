<?php
declare(strict_types=1);

// Include environment
require_once("./environment.php");

// Get arguments
$args = Util::getArgs();

// Set SQL command
$query = "SELECT 	`id`,
									`type`,
									`first_name`,
									`middle_name`,
									`last_name`,
									`gender`,
									`password` 
						 FROM `users` 
						WHERE `email` = ? AND
									`valid` = 1
						LIMIT 1";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query, array($args['email']));

// Close connection
$db = null;

// Check result
if (is_null($result))
	Util::setError("Felhasználó nem létezik ezen az e-mail címen!");

// Simplifying the result
$result = $result[0];

// Check password
if ($result['password'] !== $args['password'])
	Util::setError("Helytelen jelszó!");

// Remove password property
unset($result['password']);

// Ser response
Util::setResponse($result);