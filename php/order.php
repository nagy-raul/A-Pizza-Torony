<?php
declare(strict_types=1);

// Környezet betöltése
require_once("../../common/php/environment.php");

// Argumentumok lekérése
$args = Util::getArgs();

// Csatlakozás a MySQL szerverhez
$db = new Database();

// SQL parancs beállítása
$query = "INSERT INTO `rendelesek`(`nev`, `email`, `szalcim`, `fizform`, `kartyaNev`, `kartyaSzam`, `lejarat`, `cvv`, `vegossz`) 
          VALUES (:name, :email, :address, :paymentMethod, :cardName, :cardNumber, :cardExpiry, :cardCVV, :osszeg)";

// SQL parancs végrehajtása
$result = $db->execute($query, $args);

// Kapcsolat lezárása
$db = null;

// Válasz beállítása
Util::setResponse($result);