<?php
declare(strict_types=1);

// Környezet betöltése
require_once("../../common/php/environment.php");

// Argumentumok lekérése
$args = Util::getArgs();

// Csatlakozás a MySQL szerverhez
$db = new Database();

// SQL parancs beállítása
$query = "INSERT INTO `rendelesek` 
                     (`nev`, 
                      `email`, 
                      `orszagkod`, 
                      `telszam`, 
                      `targy`, 
                      `uzenet`) 
               VALUES (:name, 
                       :email, 
                       :countryCode, 
                       :phone, 
                       :targy, 
                       :uzenet)";

// SQL parancs végrehajtása
$result = $db->execute($query, $args);

// Kapcsolat lezárása
$db = null;

// Válasz beállítása
Util::setResponse($result);