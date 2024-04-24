<?php
session_start();
require_once("dbconnect.php");
$Resident_ID=$_SESSION['Resident_ID'];
$rent = $_POST['rent'];
$Flat_ID = $_POST['Flat_ID'];
$Month = $_POST['month'];
if (isset($Resident_ID) && isset($Flat_ID) && isset($rent) && isset($Month)) {
	$query="SELECT T_Resident_ID FROM tenant where T_Flat_ID='$Flat_ID'";
	$result = $conn->query($query);
	$row = $result->fetch_assoc();
	$T_Resident_ID=$row['T_Resident_ID'];
	$notif= "Notice: Rent will change to " . $rent . " from " . $Month . "."; 
	if (isset($T_Resident_ID)) {
		$sql = "INSERT INTO resident_notification(Resident_ID, notification, type)
		VALUES ('$T_Resident_ID', '$notif', 'Resident')";
		if ($conn->query($sql) == TRUE) {
		  echo "New notification sent successfully";
		} else {
		  echo "Error: " . $sql . "<br>" . $conn->error;
		}
		$conn->close();

	}
}
?>