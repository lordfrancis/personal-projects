<?php
	session_start();

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

	$appDate = date('Y-m-d', strtotime($_POST['appDate'])); 
	$appType = $_POST['appType'];
	$id = $_SESSION['user_id'];
	$startTime;
	$endTime;


	// echo $appDate;
	// echo $appType;

	if($_POST['appTime'] == "910"){
		$startTime = "9:00";
		$endTime = "10:00";
	}else if($_POST['appTime'] == "1011"){
		$startTime = "10:00";
		$endTime = "11:00";
	}else if($_POST['appTime'] == "1112"){
		$startTime = "11:00";
		$endTime = "12:00";
	}else if($_POST['appTime'] == "12"){
		$startTime = "13:00";
		$endTime = "14:00";
	}else if($_POST['appTime'] == "23"){
		$startTime = "14:00";
		$endTime = "15:00";
	}else if($_POST['appTime'] == "34"){
		$startTime = "15:00";
		$endTime = "16:00";
	}else if($_POST['appTime'] == "45"){
		$startTime = "16:00";
		$endTime = "17:00";
	}else{
		echo "error";
	}


	$sql = "INSERT INTO appointments (date, start_time, end_time, type, status, id)
		 VALUES ('$appDate', '$startTime','$endTime','$appType', 'current', '$id')";

	if ($conn->query($sql) === TRUE) {
	   echo "<script>alert('New record created successfully')</script>";
	 } else {
	   echo "Error: " . $sql . "<br>" . $conn->error;
	 }

	$conn->close();
	header("Location: customer_appointments.php");
?>