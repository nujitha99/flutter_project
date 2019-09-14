<html>
<head>
	<title>Add Data</title>
</head>

<body>
<?php
//including the database connection file
include_once("config.php");

if(isset($_POST['Submit'])) {	
	$first_name = mysqli_real_escape_string($mysqli, $_POST['first_name']);
	$last_name = mysqli_real_escape_string($mysqli, $_POST['last_name']);
	$address = mysqli_real_escape_string($mysqli, $_POST['address']);

	$phone_number = mysqli_real_escape_string($mysqli, $_POST['phone_number']);
	$age = mysqli_real_escape_string($mysqli, $_POST['age']);


	$email = mysqli_real_escape_string($mysqli, $_POST['email']);

	$password = mysqli_real_escape_string($mysqli, $_POST['password']);
	
	// checking empty fields
	if(empty($first_name) || empty($last_name) || empty($address)|| empty($phone_number)|| empty($age)|| empty($email)|| empty($password)) {
				
		if(empty($first_name)) {
			echo "<font color='red'>First Name field is empty.</font><br/>";
		}
		
		if(empty($last_name)) {
			echo "<font color='red'>Last Name field is empty.</font><br/>";
		}
		
		if(empty($address)) {
			echo "<font color='red'>Address field is empty.</font><br/>";
		}
		

		if(empty($phone_number)) {
			echo "<font color='red'>Phone number field is empty.</font><br/>";
		}
		
		if(empty($age)) {
			echo "<font color='red'>Age field is empty.</font><br/>";
		}
		
		if(empty($email)) {
			echo "<font color='red'>Email field is empty.</font><br/>";
		}

		if(empty($password)) {
			echo "<font color='red'>Password field is empty.</font><br/>";
		}
		












		//link to the previous page
		echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} else { 
		// if all the fields are filled (not empty) 
			
		//insert data to database	
		$result = mysqli_query($mysqli, "INSERT INTO officers(first_name,last_name,address,phone_number,age,email,password) VALUES('$first_name','$last_name','$address','$phone_number','$age','$email','$password')");
		
		//display success message
		echo "<font color='green'>Data added successfully.";
		echo "<br/><a href='index.php'>View Result</a>";
	}
}
?>
</body>
</html>
