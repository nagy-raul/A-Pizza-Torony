<?php
declare(strict_types=1);

// Include environment
require_once("./environment.php");

// Set SQL command
$query= "SELECT `id`, 
								`type`, 
								`first_name`, 
								`last_name`, 
								`middle_name`, 
								`born`, 
								`gender`, 
								`country`, 
								`country_code`, 
								`phone`, 
								`city`, 
								`postcode`, 
								`address`, 
								`email`, 
								`year`, 
								`profession`, 
								`class`, 
								`valid` 
					 FROM `users`;";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query);

// Close connection
$db = null;

// Ser response
Util::setResponse($result);