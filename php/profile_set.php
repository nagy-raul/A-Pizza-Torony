<?php
declare(strict_types=1);

// Környezet betöltése
require_once("../../common/php/environment.php");

// Paraméterek lekérése
$args = Util::getArgs();

// Csatlakozás MySQL szerverhez
$db = new Database();

// SQL parancs beállítása
$query  = "UPDATE `felhasznalok` 
           SET `nev`= :name,
               `email`= :email,
               `orszagkod`= :countryCode,
               `telszam`= :phone,
               `lakcim`= :address
         WHERE `felhasznaloID` = :id;";

// SQL parancs végrehajtása
$result = $db->execute($query, $args);

// Csatlakozás lezárása
$db = null;

// Válasz beállítása
Util::setResponse($result);