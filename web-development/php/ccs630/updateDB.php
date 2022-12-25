<?php

	 $servername = "localhost";
     $username = "root";
     $password = "";
     $dbname = "ccs_630_test";


	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

	$id = $_POST['custId'];
	$fname = $_POST['fname'];
	$mname = $_POST['mname'];
	$lname = $_POST['lname'];
	$street = $_POST['street'];
	$city = $_POST['city'];
	$country = $_POST['country'];
	$postcode = $_POST['postcode'];
	$pnum= $_POST['pnum'];
	$jtitle = $_POST['jobtitle'];


	$sql = "UPDATE customers SET first_name='$fname',middle_name='$mname',last_name='$lname',street_name='$street',city='$city',country='$country',postcode='$postcode',phone_number='$pnum',job_title='$jtitle' WHERE customer_id = $id";

	if ($conn->query($sql) === TRUE) {
	   echo "record updated successfully";
	 } else {
	   echo "Error: " . $sql . "<br>" . $conn->error;
	 }

	$conn->close();
	header("Location: index.php");
?>