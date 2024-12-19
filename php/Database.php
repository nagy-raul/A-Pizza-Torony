<?php
declare(strict_types=1);

class Database {

	// Set properties
	private $dbHandle = null,
					$conn 		= null;

	// Constructor
	public function __construct(?string $db=null) {

		// Set connection details
		$this->setConnection($db);

		// Connect to MySQL server
		$this->connect();
	}

	// Destructor
	public function __destruct() {
		$this->dbHandle = null;
	}

	// Set connection details
	private function setConnection(?string $db): void {

		// When configuration file exist, then get connection details
		$file = Env::searchForFile('db_config.ini', array('subFolder' => 'db'));
    if (!is_null($file))
          $conn = parse_ini_file($file, true);
    else  $conn = null;

		// Merge with default
    $this->conn = Util::objMerge(array(
      "host"		=> "localhost",
      "dbname"	=> "",
      "user"   	=> "root",
      "pass"		=> ""
    ), $conn, true);

		// Set database name if exist
		if ($db) $this->conn["dbname"] = $db;
	}

	// Connect to MySQL server
	private function connect(): void {
		try {
			$dsn = "mysql:host={$this->conn["host"]};
							dbname={$this->conn["dbname"]};charset=utf8";
			$this->dbHandle = new PDO($dsn, $this->conn["user"], $this->conn["pass"], array(
													PDO::MYSQL_ATTR_INIT_COMMAND       => "SET NAMES utf8",
													PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => false,
													PDO::ATTR_ERRMODE 						     => PDO::ERRMODE_EXCEPTION,
													PDO::ATTR_DEFAULT_FETCH_MODE       => PDO::FETCH_ASSOC,
													PDO::ATTR_ORACLE_NULLS				     => PDO::NULL_EMPTY_STRING,
													PDO::ATTR_EMULATE_PREPARES		     => false,
													PDO::ATTR_STRINGIFY_FETCHES        => false
												));
		} catch (Exception $e) {
			Util::setError("Unable to conect to MySQL server!");
		}
	}

	// Get query type
	private function get_type(string $query): string {
    $query = trim(preg_replace('!\s+!', ' ', $query));
		return strtoupper(strtok($query, " "));
	}

	// Preparate sql command INSERT
	public function preparateInsert(string $tblName, array $fields, int $count=1): ?string {
		if (!is_string($tblName) || 
						empty(($tblName = trim($tblName)))) return null;
		if (Util::isAssocArray($fields))
			$fields = array_keys($fields);
		if (!is_array($fields) || empty($fields)) return null;
		if (!is_int($count) || $count < 1) $$count = 1;
		$query 	= "(`". implode('`,`', $fields) . "`)";
		$values = str_repeat('?,', count($fields) - 1) . '?';
		$values = " VALUES " . str_repeat("($values),", $count - 1) . "($values);";
		$query 	= "INSERT INTO `$tblName` " . $query . $values;
		return $query;
	}

	// Preparate sql command UPDATE
	public function preparateUpdate(string $tblName, array $fields, $filter=null): ?string {
		if (!is_string($tblName) || 
						empty(($tblName = trim($tblName)))) return null;
		if (Util::isAssocArray($fields))
			$fields = array_keys($fields);
		if (!is_array($fields) || empty($fields)) return null;
		if (is_string($filter)) $filter = explode(";", $filter);
		if (Util::isAssocArray($filter))
			$filter = array_keys($filter);
		if (!is_array($filter)) $filter = array();
		$result = "";
		foreach($fields as $field) {
			if (!in_array($field, $filter)) 
				$result .= ("`" . $field . "` = :". $field . ", ");
			}
		$result = substr(trim($result), 0, -1);	
		$result = "UPDATE `" . $tblName . "` SET " . $result . " ";
		return $result;
	}

	// Execute
	public function execute(string $query, $params=null): ?array {

		// Set result
		$result = null;

		// Get query type
		$type = $this->get_type($query);

		// Check parameters
		if (!is_null($params) && 
			  !is_array($params))
			$params = array($params);

		try {

			// Prepare statement for execution and returns a statement object
			$stmt = $this->dbHandle->prepare($query);

			// Executes a prepared statement
			$stmt->execute($params);

			switch($type) {

				case "SELECT":

					// Get result
					$result = $stmt->fetchAll();

					// Check result
					if (empty($result)) $result = null;
					break;

				case "INSERT":
				case "UPDATE":
				case "DELETE":

					// Get affected rows
					$result["affectedRows"] = $stmt->rowCount();

					// When query type is insert and successfully inserted data
					if ($type === "INSERT" && $result["affectedRows"] > 0) {

						// Get last inserted identifier (when autoinvrement field exist)
						$lastId = $this->dbHandle->lastInsertId();

						// Check has value
						if ($lastId !== false) {

							// Calculate first/last inserted identifier
							$result["firsInsertId"] = intval($lastId);
							$result["lastInsertId"] = $result["affectedRows"] + $lastId - 1;
						}
					}
					break;
			}

			// Return result
			return $result;

		} catch (Exception $e) {
			Util::setError("Unable to execute query!");
		}
	}
}