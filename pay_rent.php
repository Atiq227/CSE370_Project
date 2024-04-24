<?php
session_start();
require_once("dbconnect.php");

if (!isset($_SESSION['Resident_ID']) || !isset($_POST['Month']) || empty($_POST['Month'])) {
    echo "Required field is empty.";
    exit();
}

$Resident_ID = $_SESSION['Resident_ID'];
$Month = $_POST['Month'];

// Fetch O_Resident_ID based on O_Flat_ID
$query1 = "SELECT Tenant_ID,T_Flat_ID,O_Resident_ID FROM tenant WHERE T_Resident_ID = '$Resident_ID'";
$result1 = $conn->query($query1);

if ($result1->num_rows > 0) {
    $row = $result1->fetch_assoc();
    $O_Resident_ID = $row['O_Resident_ID'];
    $N_Tenant_ID= $row['Tenant_ID'];
    $N_Flat_ID= $row['T_Flat_ID'];
} else {
    echo "No results found for the given Resident_ID";
    exit();
}

// Assuming you have a template for the notification
$Notification = "$N_Tenant_ID has paid the rent of $N_Flat_ID for $Month";

$sql1 = "INSERT INTO resident_notification (Resident_ID, Notification)
VALUES ('$O_Resident_ID', '$Notification');";

if ($conn->query($sql1) === TRUE) {
    echo "<br>Rent has been paid";
} else {
    echo "Error inserting notification: " . $conn->error;
}

$conn->close();
?>