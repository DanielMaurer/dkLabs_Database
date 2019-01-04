<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>Search Results</title>


</head>

<body>
   
   <main role="main" class="container-fluid">
	<h1> Instrument Search Results </h1>
		<?php
			$searchtype=$_POST["searchtype"];
			$searchterm=trim($_POST["searchterm"]);
			
			if(!$searchtype || !$searchterm){
				echo "You have not entered search details. Please go back and try again.";
				exit;
			}
			
			@$db = new mysqli('localhost', 'dannymaurer', 'databasefinal', 'dkLabs');
			
			if($db->connect_error){
				die('Connect Error ' . $db->connect_errno . ': ' . $db->connect_error);
			}   
			
			$query = "SELECT * FROM instrument WHERE $searchtype LIKE ?";
			$stmt = $db->prepare($query);
			$term = "%" . $searchterm . "%";
			$stmt->bind_param("s", $term);
			$stmt->execute();
			
			$result=$db->query($query);
			$result = $stmt->get_result();
			$num_results = $result->num_rows;
			echo "<p> Number of instruments found: $num_results";
			
			for($i = 0; $i<$num_results; $i++){
				$row = $result->fetch_assoc();
				echo "<p><strong>Name: ";
				echo htmlspecialchars(stripslashes($row["insName"]));
				echo "</strong>";
				echo "<br />";
				echo "Purpose: ".stripslashes($row["purpose"]);
				echo "<br />";
				echo "Instrument ID: ".stripslashes($row["instrumentID"]);
				echo "<br />";
				echo "In Use: ".stripslashes($row["inUse"]);
				echo "</p>";
			}
			
		?>
			<a href="main_page.html">Back Home</a>
</body>

</html>
