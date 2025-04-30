<?php
declare(strict_types=1);

// Környezet betöltése
require_once("../../common/php/environment.php");

// Argumentumok lekérése
$args = Util::getArgs();

// Csatlakozás a MySQL szerverhez
$db = new Database();

$query = "INSERT INTO `rendelesek`(`nev`, `email`, `szalcim`, `fizform`, `kartyaNev`, `kartyaSzam`, `lejarat`, `cvv`, `vegossz`) 
          VALUES" . "('" . $args['name'] . "', '" . $args['email'] . "', '" . $args['address'] . "', '" . $args['paymentMethod'] . "', '" . $args['cardName'] . "', '" . $args['cardNumber'] . "', '" . $args['cardExpiry'] . "', '" . $args['cardCVV'] . "', " . $args['osszeg'] . ");";

// SQL parancs végrehajtása
$result = $db->execute($query);

// Kapcsolat lezárása
$db = null;

// Válasz beállítása
Util::setResponse($result);