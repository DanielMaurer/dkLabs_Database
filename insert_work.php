<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>DK Labs Entry Results</title>


</head>

<body>
    <main role="main" class="container-fluid">
	<h1> DK Labs Entry Results </h1>
<?php
    $timeIn=$_POST["timeIn"];
    $timeOut=$_POST["timeOut"];
    $wDate=$_POST["wDate"];
    $goal=$_POST["goal"];
    $memberID =intval($_POST["memberID"]);
    
    echo $memberID;

    if (!$timeIn || !$timeOut || !$wDate || !$goal) {
        echo "You have not entered all required details.  Please go back and try again.";
        exit;
    }

    //format input
    //$timeIn = addslashes($timeIn);
    //$timeOut = addslashes($timeOut);
    //$wDate = addslashes($wDate);
    $goal = addslashes($goal);

    //connect to the database
    @$db = new mysqli('localhost', 'dannymaurer', 'databasefinal', 'dkLabs');


    if ($db->connect_error) {
        die('Connect Error ' . $db->connect_errno . ': ' . $db->connect_error);
    }


    $query = "insert into work values (null, ?, ?, ?, ?, ?)";  
    $stmt = $db->prepare($query);
    $stmt->bind_param("ssssi", $timeIn, $timeOut, $wDate, $goal, $memberID);
    $stmt->execute();
    echo $stmt->affected_rows." work inserted into database";

    $db->close();
?>
    <br/
    ><a href="show_work.php">Show Work</a> 
</main>
</body>

</html>
