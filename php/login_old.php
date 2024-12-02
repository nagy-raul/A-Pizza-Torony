<?php

if (!isset($args)) {
	$args = file_get_contents("php://input");
}
$args = json_decode($args, true);

$result = array(
	"data"  => null,
	"error" => null
);

$conn = array(
	"host"    	=> "localhost",
	"dbname"  	=> "test",
	"user"    	=> "root",
	"password"	=> ""
);

$query = "SELECT 	`id`,
									`type`,
									`first_name`,
									`middle_name`,
									`last_name`,
									`password` 
						 FROM `users` 
						WHERE `email` = ? AND
									`valid` = 1
						LIMIT 1";

try {
	$dbHandle = new PDO("mysql:host={$conn['host']};
												dbname={$conn['dbname']};
												charset=utf8", 
												$conn['user'], 
												$conn['password']);
	$dbHandle->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES utf8");
	$dbHandle->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$dbHandle->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
	$stmt = $dbHandle->prepare($query);
	$stmt->execute(array($args['email']));
	$data	= $stmt->fetchAll();
	if (empty($data)) 
		$result["error"]	= "Felhasználó nem létezik ezen az e-mail címen!";
	elseif	($data[0]['password'] !== $args['password']) 
		$result["error"]	= "Helytelen jelszó!";
	else {
		$result["data"] = $data[0];
		unset($result["data"]['password']);
	}
} catch (Exception $e) {
	$result["error"] = $e->getMessage();
}

$result = json_encode($result);
echo $result;