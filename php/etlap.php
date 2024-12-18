<?php

// Using namespaces aliasing
use \Util\Util as Util;
use \Database\Database as Database;

require_once('../../common/php/environment.php');

$db = new Database();

$result = $db->execute("SELECT * FROM `pizza`");

$db = null;

Util::setResponse($result);