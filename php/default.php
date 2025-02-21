<?php
declare(strict_types=1);

// Include environment
require_once("./environment.php");

/**
 * Get arguments (data)
 * Only needed, when client side sends data to server
 */
$args = Util::getArgs();

/**
 * Connect to MySQL server
 * Alternative: 
 * 		$db = new Database('dbname');
 */
$db = new Database(); 

/**
 * Set query
 * Set arguments (cannot be mixed): 
 * 		- ? 
 * 		-	:key
 */
$query = "";

/**
 * Execute SQL command
 */ 
$result = $db->execute($query, $args);

// Close connection
$db = null;

/**
 * Check response (result)
 * 
 * Util::setError('Error message!');
 */ 

// Set response
Util::setResponse($result);