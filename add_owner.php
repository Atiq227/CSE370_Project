<?php
include 'dbconnect.php';
echo "</br>";
$Resident_ID = $_POST['Resident_ID'];
$Name = $_POST['Name'];
$Contact_num = $_POST['Contact_num'];
$password = $_POST['password'];
$Owner_ID = $_POST['Owner_ID'];
$Flat_ID = $_POST['Flat_ID'];

echo "<br>";

$sql = "INSERT INTO resident (Resident_ID, Password, Name, Contact_num)
VALUES ('$Resident_ID', '$password', '$Name', '$Contact_num');";
$sql .= "INSERT INTO flat_owner (O_Resident_ID, Owner_ID)
VALUES ('$Resident_ID', '$Owner_ID');";
$sql .= "INSERT INTO owns (O_Flat_ID, O_Resident_ID, O_Owner_ID)
VALUES ('$Flat_ID', '$Resident_ID', '$Owner_ID')";

if ($conn->multi_query($sql) == TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>