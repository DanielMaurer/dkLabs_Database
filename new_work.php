<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>New Work</title>
</head>

<body>
    <main role="main" class="container-fluid">
        <h1> DK Labs New Work Entry </h1>
		<?php $memberID = $_GET['memberID'];?>
        <form action="insert_work.php" method="post">
        <input type="hidden" name="memberID" value = <?php echo '"'.$memberID.'"'; ?> />
            <p>Time In (hh:mm) </br> <input type="time" name="timeIn" maxlength="13" size="13" /></p>
            <p>Time Out (hh:mm) </br> <input type="time" name="timeOut" maxlength="13" size="13" /></p>
            <p>Date (yyyy-mm-dd) </br> <input type="date" name="wDate" maxlength="13" size="13" /></p>
            <p>Goal </br> <input type="text" name="goal" maxlength="200" size="60" /></p>

            <input type="submit" name="submit" value="Add Work" />
        </form>
    </main>
</body>

</html>
