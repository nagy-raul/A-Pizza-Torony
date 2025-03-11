<?php
declare(strict_types=1);

// Include environment
require_once("../../common/php/environment.php");


// Get arguments
$args = Util::getArgs();

/*
$args = array(
       'id' => 1
);
*/

var_dump($args);

// Set SQL command
$query ="SELECT `felhasznaloID` AS `id`, 
                `nev`           AS `name`, 
                `email`         AS `email`, 
                `orszagkod`     AS `countryCode`, 
                `telszam`       AS `phone`, 
                `lakcim`        AS `address`
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

// Set response
Util::setResponse($result);