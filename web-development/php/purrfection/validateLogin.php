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

	$uname = $_POST['username'];
	$pword = $_POST['password'];


	$sql = "SELECT * from users where username = '$uname' AND password = '$pword' ";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
	  // output data of each row
	  while($row = $result->fetch_assoc()) {
	   // echo "id: " . $row["id"];
	    $_SESSION['user_id'] = $row['id'];
	    $_SESSION['user_type'] = $row['type'];
	  }

	  echo $_SESSION['user_type'];

	   if($_SESSION['user_type'] == 'c'){
		  header("Location: customer/customer_dashboard.php");
	   }
	  else if($_SESSION['user_type'] == 's'){
	   	 header("Location: staff/staff_dashboard.html");
	  }
	   else{
	  	header("Location: admin/admin_dashboard.html");
	  }
	
	} else {
	  echo "Invalid Credentials";
	}

	$conn->close();


?>