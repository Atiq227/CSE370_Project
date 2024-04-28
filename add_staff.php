<?php
include 'dbconnect.php';
echo "</br>";

$Staff_ID = $_POST['Staff_ID'];
$password = $_POST['password'];
$Name = $_POST['Name'];
$Contact_num = $_POST['Contact_num'];
$Role = $_POST['Role'];
echo "<br>";

$sql1 = "INSERT INTO service_and_utility_staff (Staff_ID, Password, Name, Contact_num, Role)
VALUES ('$Staff_ID', '$password', '$Name', '$Contact_num', '$Role' );";

if ($conn->query($sql1) === TRUE) {
  echo "New Staff added successfully";
} else {
  echo "Error: " . $conn->error;
}

$conn->close();
?>
