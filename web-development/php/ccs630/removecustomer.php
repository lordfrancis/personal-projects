<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "ccs_630_test";

	$custId = $_POST['id'];

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

	$sql = "DELETE FROM customers WHERE customer_id = $custId";

	if ($conn->query($sql) === TRUE) {
	  echo "User deleted successfully";
	} else {
	  echo "Error deleting record: " . $conn->error;
	}

	$conn->close();
?>