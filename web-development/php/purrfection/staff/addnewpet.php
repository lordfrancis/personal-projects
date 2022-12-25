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

	$name = $_POST['name'];
	$type = $_POST['type'];
	$breed = $_POST['breed'];
	$id = $_POST['userId'];


	$sql = "INSERT INTO pets(name,pet_type,breed,owner_id)
		 VALUES ('$name', '$type', '$breed','$id')";

	if ($conn->query($sql) === TRUE) {
	   echo "New record created successfully";
	 } else {
	   echo "Error: " . $sql . "<br>" . $conn->error;
	 }

	$conn->close();
	header("Location: staff_userpets.php?id=".$id);
?>