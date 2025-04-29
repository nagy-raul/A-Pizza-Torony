<?php

declare(strict_types=1);

// Környezet betöltése
require_once("../../common/php/environment.php");

// Argumentumok lekérése
$args = Util::getArgs();

// Kapcsolódás a MySQL szerverhez
$db = new Database();

$cart = $args['items'];
$rendelesID = $args['orderID'];

// Insert each item into database
foreach ($cart as $item) {

    // SQL parancs beállítása
    $query = "INSERT INTO rendeles_elemei (rendelesID, termekID, darab, ar) 
              VALUES (". $rendelesID . ", " . $item['termekID'] . ", " . $item['db'] . ", " . $item['price'] . ");";

    // SQL parancs végrehajtása
    $result = $db->execute($query);
}

// Kapcsolat lezárása
$db = null;

// Válasz beállítása
Util::setResponse($result);