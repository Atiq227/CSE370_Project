<html>
<body>
<h1>Update Flat Rent</h1>
<form action="http://localhost/CSE370_project/submit_updated_rent.php" method="post">
Flat_ID: 
<select name="Flat_ID">
	<?php
	session_start();
	require_once("dbconnect.php");
	$Resident_ID=$_SESSION['Resident_ID'];
	$query="SELECT T_Flat_ID FROM tenant WHERE O_Resident_ID='$Resident_ID'";
	$result = $conn->query($query);
	if ($result->num_rows > 0) {
		while ($row = $result->fetch_assoc()) {
			$f=$row["T_Flat_ID"];
			echo "<option value='{$f}'>{$f}</option>";
		}

	}
	?>	
</select>
Updated rent: <input type="text" name="rent"><br><br>
Applicable from: 
<select name="month">
	<option value="January">January</option>
	<option value="February">February</option>
	<option value="March">March</option>
	<option value="April">April</option>
	<option value="May">May</option>
	<option value="June">June</option>
	<option value="July">July</option>
	<option value="August">August</option>
	<option value="September">September</option>
	<option value="October">October</option>
	<option value="November">November</option>
	<option value="December">December</option>
</select>
<input type="submit">
</form>
</body>
</html>