<?php
session_start();
require_once("dbconnect.php");
$Resident_ID = $_POST['Resident_ID'];
$password = $_POST['password'];
$type= $_POST['type'];
if (empty($Resident_ID) or empty($password)) {
	echo "required field is empty.";
}
else {
	$query="SELECT * FROM resident where Resident_ID='$Resident_ID' AND password='$password'";
	$result = $conn->query($query);
	$row = $result->fetch_assoc();
	if ($row) {
		$_SESSION['Resident_ID'] = $row['Resident_ID'];
		if ($type=='Flat Owner') {
			header('Location: http://localhost/CSE370_project/Flat_Owner.html');
		} elseif ($type=='Tenant') {
			header('Location: http://localhost/CSE370_project/Tenant.html');
		}
	}
	else {
		echo "Invalid Login Credentials";
		session_destroy();
	}
}
?>
