<?php
declare(strict_types=1);

// Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query = "INSERT INTO `asztalfoglalasok` 
                     (`nev`, 
                      `email`, 
                      `orszagkod`, 
                      `telszam`, 
                      `datum`, 
                      `ido`, 
                      `orak`, 
                      `vendegek`, 
                      `megjegyzes`, 
                      `igeny`)
               VALUES (:name, 
                       :email, 
                       :countryCode, 
                       :phone, 
                       :datum, 
                       :ido, 
                       :orak, 
                       :vendegek, 
                       :megjegyzes, 
                       :igeny)";

// Execute SQL command
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Set response
Util::setResponse($result);