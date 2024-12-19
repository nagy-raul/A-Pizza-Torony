<?php

declare(strict_types=1);

// Include environment
require_once("./environment.php");

$db = new Database();

$result = $db->execute("SELECT * FROM `pizza`");

$db = null;

Util::setResponse($result);