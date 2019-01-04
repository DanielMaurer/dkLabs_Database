<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>Instrument Search</title>


</head>

<body>
    <main role="main" class="container-fluid">
	<h1> Instrument Search </h1>

<form action="search-results.php" method="post">

	<div class="form-group">
		<label for="searchtype">Select Search Term</label>
		<select class="form-control" id="searchtype" name="searchtype">
			<option value = "insName">Instrument Name</option>
			<option value = "inUse">In Use</option>
		</select>
	</div>
	
	<div class="form-group">
		<label for="searchterm">Enter Search Term</label>
	<input name="searchterm" type="text" class="form-control" name="searchterm" id="searchterm" />
</div>
	<button type="submit" class="btn btn-primary">Search</button>
</body>

</html>
