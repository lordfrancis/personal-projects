<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "purrfectiondb";

	$petId = $_POST['id'];

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

	$sql = "DELETE FROM pets WHERE pet_id = $petId";

	if ($conn->query($sql) === TRUE) {
	  echo "Record deleted successfully";
	} else {
	  echo "Error deleting record: " . $conn->error;
	}

	$conn->close();
?>