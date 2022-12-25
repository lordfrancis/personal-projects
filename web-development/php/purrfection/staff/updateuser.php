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
	$fname = $_POST['fname'];
	$mname = $_POST['mname'];
	$lname = $_POST['lname'];
	$email = $_POST['email'];
	$cnum = $_POST['cnum'];
	$uname = $_POST['username'];
	$pword = $_POST['password'];


	$sql = "UPDATE users SET fname='$fname',mname='$mname',lname='$lname',email='$email',cnum='$cnum',username='$uname',password='$pword' WHERE id = $id";

	if ($conn->query($sql) === TRUE) {
	   echo "record updated successfully";
	 } else {
	   echo "Error: " . $sql . "<br>" . $conn->error;
	 }

	$conn->close();
	header("Location: staff_users.html");
?>