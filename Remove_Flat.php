<?php
session_start();
require_once("dbconnect.php");
$Resident_ID=$_SESSION['Resident_ID'];
$Flat_ID = $_POST['Flat_ID'];
$flag=0;
if (empty($Flat_ID)) {
	echo "required field is empty.";
	$flag=1;
	}
else {
	$query="SELECT Flat_ID FROM apartment_a1";
	$result = $conn->query($query);
	if ($result->num_rows > 0) {
		while ($row = $result->fetch_assoc()) {
			if ($row['Flat_ID']=== $Flat_ID) {
				$query1="SELECT O_Flat_ID FROM owns WHERE O_Resident_ID='$Resident_ID'";
				$result1 = $conn->query($query1);
				if ($result1->num_rows > 0) {
					while ($row1 = $result1->fetch_assoc()) {
						if ($row1['O_Flat_ID']=== $Flat_ID) {
							$flag=1;
							$sql = "DELETE FROM owns WHERE O_Flat_ID='$Flat_ID'";
							if ($conn->query($sql) == TRUE) {

							  	echo "Flat_ID removed successfully";
								$query2="SELECT O_Flat_ID FROM owns WHERE O_Resident_ID='$Resident_ID'";
								$result2 = $conn->query($query2);
								if ($result2->num_rows == 0) {
									$sql1= "DELETE FROM resident where Resident_ID='$Resident_ID'";
									if ($conn->query($sql1) == TRUE) {
										header('Location: http://localhost/CSE370_project/Home_page.html');
									} else {
									  echo "Error: " . $sql . "<br>" . $conn->error;
									}
									$conn->close();
								}

							} else {
							  echo "Error: " . $sql . "<br>" . $conn->error;
							}
							$conn->close();

							break;
						}
					}
				}
				break;
			}
		}
	}
	if ($flag==0) {
		echo "wrong Flat_ID";
	}			
}
?>