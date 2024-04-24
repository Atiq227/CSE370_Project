<?php
session_start();
require_once("dbconnect.php");

// Retrieve T_Resident_ID from the session
$L_Resident_ID = $_SESSION['Resident_ID'];

if ($L_Resident_ID === '') {
    echo "Error: T_Resident_ID not found in session.";
    exit;
}
// Perform deletion based on $T_Resident_ID
$sql = "DELETE FROM resident WHERE Resident_ID = '$L_Resident_ID'";

if ($conn->query($sql) === TRUE) {
    echo "<br>Good Bye";
} else {
    echo "Error: " . $conn->error;
}

$conn->close();
?>
