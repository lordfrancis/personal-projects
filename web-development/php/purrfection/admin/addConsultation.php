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

	$findings = $_POST['findings'];
	$remarks = $_POST['remarks'];
	$id = $_POST['petId'];


	$sql = "INSERT INTO consultation(findings, recommendations, pet_id)
		 VALUES ('$findings', '$remarks','$id')";

	if ($conn->query($sql) === TRUE) {
	   echo "New record created successfully";
	 } else {
	   echo "Error: " . $sql . "<br>" . $conn->error;
	 }

	$conn->close();
	 header("Location: admin_petInfo.php?id=".$id);
?>