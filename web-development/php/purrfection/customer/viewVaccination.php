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

	$id = $_GET['id'];


	$sql = "SELECT date, type, remarks FROM vaccination where pet_id=".$id." ORDER BY date DESC";

	
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
	  echo "<table class='table'><tr><th>Date</th><th>Type</th><th>Remarks</th></tr>";
	  // output data of each row
	  while($row = $result->fetch_assoc()) {
	    echo "<tr><td>".$row["date"]."</td><td>".$row["type"]."</td><td>".$row["remarks"]."</td></tr>";
	  }
	  echo "</table>";
	} else {
	  echo "0 results";
	}
	$conn->close();
?>