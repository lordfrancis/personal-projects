<?php

//ONLINE DB
// $servername = "45.62.239.237";
// $username = "ccs_630_user";
// $password = "12345678x";
// $dbname = "ccs_630_test";

//LOCALHOST
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ccs_630_test";


function addCustomer(){

	global $servername, $username, $password, $dbname;

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

	$fname = $_POST['fname'];
	$lname = $_POST['lname'];
	$mname = $_POST['mname'];
	$street = $_POST['street'];
	$city = $_POST['city'];
	$country = $_POST['country'];
	$postcode = $_POST['postcode'];
	$pnum = $_POST['pnum'];
	$jobtitle = $_POST['jobtitle'];

	$sql = "INSERT INTO customers (first_name, last_name, middle_name, street_name, city, country, postcode, phone_number, job_title)
		VALUES ('$fname','$lname','$mname', '$street', '$city','$country', '$postcode', '$pnum', '$jobtitle')";


	if ($conn->query($sql) === TRUE) {
	  echo "<script> alert('New record created successfully')</script>";
	} else {
	  echo "Error: " . $sql . "<br>" . $conn->error;
	}

	$conn->close();

	header("Location: index.php");

}

if(isset($_POST['addCustomer'])){
	addCustomer();
}

?>