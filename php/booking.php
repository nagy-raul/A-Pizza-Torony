<?php
declare(strict_types=1);

// Környezet betöltése
require_once("../../common/php/environment.php");

// Argumentumok lekérése
$args = Util::getArgs();

// Kapcsolódás a MySQL szerverhez
$db = new Database();

// SQL parancs beállítása
$query = "INSERT INTO `asztalfoglalasok` (`nev`, 
                                          `email`, 
                                          `orszagkod`, 
                                          `telszam`, 
                                          `datum`, 
                                          `ido`, 
                                          `orak`, 
                                          `vendegek`, 
                                          `igeny`)
          VALUES (:name, 
                  :email, 
                  :countryCode, 
                  :phone, 
                  :datum, 
                  :ido, 
                  :orak, 
                  :vendegek, 
                  :igeny)";

// SQL parancs végrehajtása
$result = $db->execute($query, $args);

// Kapcsolat bezárása
$db = null;

// Válasz beállítása
Util::setResponse($result);