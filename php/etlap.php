<?php

declare(strict_types=1);

// Töltsd be a környezetet
require_once("../../common/php/environment.php");

$db = new Database();  // Új adatbázis kapcsolat létrehozása

$result = $db->execute("SELECT * FROM `pizza`");  // Végrehajt egy lekérdezést az adatbázisban, hogy lekérje a 'pizza' táblát

$db = null;  // Az adatbázis kapcsolat lezárása

Util::setResponse($result);  // A lekérdezés eredményét válaszként beállítja