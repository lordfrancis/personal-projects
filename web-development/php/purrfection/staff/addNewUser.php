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

	$fname = $_POST['fname'];
	$mname = $_POST['mname'];
	$lname = $_POST['lname'];
	$email = $_POST['email'];
	$cnum = $_POST['cnum'];
	$uname = $_POST['username'];
	$pword = $_POST['password'];


	$sql = "INSERT INTO users (fname,mname,lname,email,cnum,type,username,password)
		 VALUES ('$fname', '$mname', '$lname','$email', '$cnum', 'c', '$uname', '$pword')";

	if ($conn->query($sql) === TRUE) {
	   echo "New record created successfully";
	 } else {
	   echo "Error: " . $sql . "<br>" . $conn->error;
	 }

	$conn->close();
	header("Location: staff_users.html");
?>