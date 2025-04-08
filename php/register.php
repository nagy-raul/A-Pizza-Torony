<?php
declare(strict_types=1);

// Környezet betöltése
require_once("../../common/php/environment.php");

// Argumentumok lekérése
$args = Util::getArgs();

// SQL parancs beállítása
$query = "SELECT 	`felhasznaloID`
		  FROM `felhasznalok` 
		  WHERE `email` = ?
		  LIMIT 1";

// Kapcsolódás a MySQL szerverhez
$db = new Database();

// SQL parancs végrehajtása
$result = $db->execute($query, array($args['email']));

// Ellenőrizze, hogy létezik-e már felhasználó e-mail címmel
if (!is_null($result))
	Util::setError("Felhasználó már létezik ezen az e-mail címen!");

// SQL parancs beállítása
$query = "INSERT INTO `felhasznalok` 
					 (`nev`, 
					  `email`, 
					  `orszagkod`, 
					  `telszam`, 
					  `lakcim`, 
					  `jelszo`) 
		  	   VALUES (:name, 
			   		   :email, 
					   :countryCode, 
					   :phone, 
					   :address, 
					   :password);";

// SQL parancs végrehajtása
$result = $db->execute($query, $args);

// Kapcsolat lezárása
$db = null;

// Válasz beállítása
Util::setResponse($result);