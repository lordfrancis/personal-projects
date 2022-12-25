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


	$sql = "SELECT date, findings, recommendations FROM consultation where pet_id=".$id." ORDER BY date DESC";

	
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
	  echo "<table class='table'><tr><th>Date</th><th>Findings</th><th>Recommendations</th></tr>";
	  // output data of each row
	  while($row = $result->fetch_assoc()) {
	    echo "<tr><td>".$row["date"]."</td><td>".$row["findings"]."</td><td>".$row["recommendations"]."</td></tr>";
	  }
	  echo "</table>";
	} else {
	  echo "0 results";
	}
	$conn->close();
?>