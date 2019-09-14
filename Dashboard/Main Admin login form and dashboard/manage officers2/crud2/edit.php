<?php
// including the database connection file
include_once("config.php");

if(isset($_POST['update']))
{	

	$id = mysqli_real_escape_string($mysqli, $_POST['id']);
	
	$first_name = mysqli_real_escape_string($mysqli, $_POST['first_name']);
	$last_name = mysqli_real_escape_string($mysqli, $_POST['last_name']);
	$address = mysqli_real_escape_string($mysqli, $_POST['address']);	
	$phone_number = mysqli_real_escape_string($mysqli, $_POST['phone_number']);
	$age = mysqli_real_escape_string($mysqli, $_POST['age']);
	$email = mysqli_real_escape_string($mysqli, $_POST['email']);
	$password = mysqli_real_escape_string($mysqli, $_POST['password']);




	// checking empty fields
	if(empty($first_name) || empty($last_name) || empty($address)|| empty($phone_number) || empty($age)|| empty($email) || empty($password)) {	
			
		if(empty($first_name)) {
			echo "<font color='red'>Name field is empty.</font><br/>";
		}
		
		if(empty($last_name)) {
			echo "<font color='red'>Age field is empty.</font><br/>";
		}
		
		if(empty($address)) {
			echo "<font color='red'>Email field is empty.</font><br/>";
		}
		if(empty($phone_number)) {
			echo "<font color='red'>Name field is empty.</font><br/>";
		}
		
		if(empty($age)) {
			echo "<font color='red'>Age field is empty.</font><br/>";
		}
		
		if(empty($email)) {
			echo "<font color='red'>Email field is empty.</font><br/>";
		}	
		if(empty($password)) {
			echo "<font color='red'>Email field is empty.</font><br/>";
		}	

	} else {	
		//updating the table
		$result = mysqli_query($mysqli, "UPDATE officers SET first_name='$first_name',last_name='$last_name',address='$address',phone_number='$phone_number',age='$age',email='$email',password='$password' WHERE id=$id");
		
		//redirectig to the display page. In our case, it is index.php
		header("Location: index.php");
	}
}
?>
<?php
//getting id from url
$id = $_GET['id'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM officers WHERE id=$id");

while($res = mysqli_fetch_array($result))
{
	$first_name = $res['first_name'];
	$last_name = $res['last_name'];
	$address = $res['address'];
	$phone_number = $res['phone_number'];
	$age = $res['age'];
	$email = $res['email'];
	$password = $res['password'];

}
?>
<html>
<head>	
	<title>Edit officers Data</title>
		<link rel="stylesheet" href="pricecss.css">
			<link rel="stylesheet" href="style.css">


</head>

<body>
	<a href="index.php">Home</a>
	<br/><br/>
	
	<form name="form1" method="post" action="edit.php">


			<div class = "bookingform">
	<div class ="title">
		<h2>Edit Officers </h2>	
	</div>


		<div class ="form">

	<div class ="From ">
		<div class= "innerform">
		<div class ="lable">First Name</div>
		<input type="text" name = "first_name" value="<?php echo $first_name;?>" >
	
		</div>
        </div>


		<div class ="To ">
		<div class= "innerform">
		<div class ="lable">Last Name</div>
		<input type ="text"  name = "last_name" value="<?php echo $last_name;?>">
		</div>
        </div>


	<div class = "Date ">
	<div class ="innerform">
	<div class ="lable">Adress</div>
	<input type ="text"  name = "address"  value="<?php echo $address;?>">
	</div>
	</div>
	<div class ="Time ">
	<div class ="innerform">
	<div class ="lable">Phone number</div>
	<input type ="text"  name ="phone_number" value="<?php echo $phone_number;?>">
	</div>
	</div>
	<div class ="Class ">
	<div class ="innerform">
	<div class ="lable">Age  </div>
	<input type ="text" name =" age" value="<?php echo $age;?>">
	</div>
	</div>
	<div class ="Seat ">
	<div class ="innerform">
	<div class ="lable">Email</div>
	<input type ="text" name ="email" value="<?php echo $email;?>">
	</div>
	</div>
	
	<div class ="Price ">
	<div class ="innerform">
	<div class ="lable">Password</div>
	<input type ="text" name ="password" value="<?php echo $password;?>">
	</div>
	</div>


	

	
	<div>
		<input type ="hidden" name ="id" value=<?php echo $_GET['id'];?>>
	<div class ="button">
	<button type ="submit" name="update" value="Update" >Update</button>
	</div>
	</div>
	
	


	</div>
	</form>



 </body>
</html>
