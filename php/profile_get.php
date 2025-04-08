<?php
declare(strict_types=1);

// Környezet betöltése
require_once("../../common/php/environment.php");

// Paraméterek lekérése
$args = Util::getArgs();

// SQL lekérdezés beállítása
$query ="SELECT `felhasznaloID` AS `id`, 
                `nev`           AS `name`, 
                `email`         AS `email`, 
                `orszagkod`     AS `countryCode`, 
                `telszam`       AS `phone`, 
                `lakcim`        AS `address`
         FROM   `felhasznalok`
         WHERE  `felhasznaloID` = :id
	     LIMIT   1";

// Kapcsolódás MySQL szerverhez
$db = new Database();

// SQL lekérdezés végrehajtása
$result = $db->execute($query, $args);

// Kapcsolat lezárása
$db = null;

// Eredmény ellenőrzése
if (is_null($result)){
    Util::setError("A felhasználó nem létezik!"); 
}

// Az eredmény egyszerűsítése
$result = $result[0];

// Válasz beállítása
Util::setResponse($result);