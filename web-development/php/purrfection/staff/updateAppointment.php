<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "purrfectiondb";

	$appId = $_POST['id'];

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

	$sql = "UPDATE appointments SET status='cancelled' WHERE appointment_id = $appId";

	if ($conn->query($sql) === TRUE) {
	  echo "Appointment Cancelled Successfully";
	} else {
	  echo "Error deleting record: " . $conn->error;
	}

	$conn->close();
?>