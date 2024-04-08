<?php
include 'dbconnect.php';
echo "</br>";
$T_Resident_ID = $_POST['T_Resident_ID'];
$Tenant_ID = $_POST['Tenant_ID'];
$T_Owner_ID = $_POST['T_Owner_ID'];
$T_Flat_ID=$_POST['T_Flat_ID'];
$O_Resident_ID=$_POST['O_Resident_ID'];
$password = $_POST['password'];
$Contact_num = $_POST['Contact_num'];
$Name = $_POST['Name'];
$Rent_from = $_POST['Rent_from'];

echo "<br>";

$sql1 = "INSERT INTO resident (Resident_ID, Password, Name, Contact_num)
VALUES ('$T_Resident_ID', '$password', '$Name', '$Contact_num');";
$sql2 = "INSERT INTO tenant (T_Resident_ID,Tenant_ID,T_Owner_ID,T_Flat_ID,O_Resident_ID,Rent_from)
VALUES ('$T_Resident_ID', '$Tenant_ID', '$T_Owner_ID',  '$T_Flat_ID', '$O_Resident_ID','$Rent_from');";

if ($conn->query($sql1) === TRUE && $conn->query($sql2) === TRUE) {
  echo "New records created successfully";
} else {
  echo "Error: " . $conn->error;
}

$conn->close();
?>