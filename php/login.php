<?php
declare(strict_types=1);

// Környezet betöltése
require_once("../../common/php/environment.php");

// Argumentumok lekérése
$args = Util::getArgs();

// SQL parancs beállítása
$query =  "SELECT `felhasznaloID`, 
				  `nev`, 
				  `email`, 
				  `orszagkod`, 
				  `telszam`, 
				  `lakcim`, 
				  `jelszo`
             FROM `felhasznalok`
		  	WHERE `email` = ?
		    LIMIT 1";

// Csatlakozás MySQL szerverhez
$db = new Database();

// SQL parancs végrehajtása
$result = $db->execute($query, array($args['email']));

// Kapcsolat lezárása
$db = null;

// Eredmény ellenőrzése
if (is_null($result))
	Util::setError("A felhasználó nem létezik ezen az e-mail címen!");

// Eredmény egyszerűsítése
$result = $result[0];

// Jelszó ellenőrzése
if ($result['jelszo'] !== $args['password'])
	Util::setError("Helytelen jelszó!");

// Jelszó tulajdonság eltávolítása
unset($result['jelszo']);

// Válasz küldése
Util::setResponse($result);