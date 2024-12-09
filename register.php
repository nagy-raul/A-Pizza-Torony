<?php
declare(strict_types=1);

// Include environment
require_once("./environment.php");

// Get arguments
$args = Util::getArgs();

// Set SQL command
$squery = "INSERT INTO `users` (`id`, `type`, `first_name`, `last_name`, `middle_name`, `gender`, `email`, `password`, `valid`) 
           VALUES ('?, ?, ?, ?, ?, ?, ?')";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query, array($args['id'], $args['type'], $args['first_name'],$args['last_name'],$args['middle_name'],$args['gender'],$args['email'],$args['password'],$args['valid']));

// Close connection
$db = null;

// Check result
if (is_null($result))
	Util::setError("Hibás adatott adott meg!");

// Simplifying the result
$result = $result[0];

// Remove password property
unset($result['password']);

// Ser response
Util::setResponse($result);