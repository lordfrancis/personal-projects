<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "purrfectiondb";

	$userId = $_POST['id'];

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

	$sql = "DELETE FROM users WHERE id = $userId";

	if ($conn->query($sql) === TRUE) {
	  echo "User deleted successfully";
	} else {
	  echo "Error deleting record: " . $conn->error;
	}

	$conn->close();
?>