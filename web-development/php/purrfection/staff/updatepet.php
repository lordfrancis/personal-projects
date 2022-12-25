<?php

	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "purrfectiondb";


	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

	$id = $_POST['userId'];
	$name = $_POST['name'];
	$type = $_POST['type'];
	$breed = $_POST['breed'];


	$sql = "UPDATE pets SET name='$name',pet_type='$type', breed='$breed' WHERE pet_id = $id";

	if ($conn->query($sql) === TRUE) {
	   echo "record updated successfully";
	 } else {
	   echo "Error: " . $sql . "<br>" . $conn->error;
	 }

	$conn->close();
	header("Location: staff_userpets.php?id=".$id);
?>