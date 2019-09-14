<?php
//including the database connection file
include_once("config.php");

//fetching data in descending order (lastest entry first)
//$result = mysql_query("SELECT * FROM users ORDER BY id DESC"); // mysql_query is deprecated
$result = mysqli_query($mysqli, "SELECT * FROM officers ORDER BY id DESC"); // using mysqli_query instead
?>

<html>
<head>	
	<title>Officers Managing form</title>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="stylefornav.css">

</head>

<body background ="trainadminloginwall.jpg"">
	<div class="menu">
			
			<div class="leftmenu">
				<h4> Train-ticketing </h4>
			</div>

			<div class="rightmenu">
				<ul>
					<li ><a href="../../adminDashboardHomepage.php"> HOME</a> </li>
					<li><a href="index.php"> Officers</a> </li>
					<li><a href="../../price, timetable, reservation,booking/mybooking/dailybookingform.php"> Booking</a></li>
					<li><a href="../../price, timetable, reservation,booking/price/pricetablephp.php"> Train Price</a></li>
					<li><a href="../../price, timetable, reservation,booking/reserve compartment/reserveform.php">Reserve Compartment</a></li>

					<li><a href="../../price, timetable, reservation,booking/timetable/timetableformphp.php">   Train Timetables </a></li>
					<!-- <li>contact</li> -->
				</ul>
			</div>

		</div>
<div class="containerbox">
<!-- <a href="add.html">Add New Data</a><br/><br/>
 -->
	<table width='100%' border=0 id="user_data" class="table table-bordered table-striped">

		<td id ="header" colspan="9">
    <h2 align="center">Officers list</h2>
	<a href="add.html">Add New Officers</a><br/><br/>
    
   </td>

	<tr bgcolor='white'>
		<td  width="15%">First Name</td>
		<td  width="15%">Last Name</td>
		<td  width="20%">Address</td>
		<td  width="13%">Phone number</td>
		<td  width="5%">Age</td>
		<td  width="17%">Email</td>
		<td  width="10%">Password</td>




		<td>Update</td>
	</tr>
	<?php 
	//while($res = mysql_fetch_array($result)) { // mysql_fetch_array is deprecated, we need to use mysqli_fetch_array 
	while($res = mysqli_fetch_array($result)) { 		
		echo "<tr>";
		echo "<td>".$res['first_name']."</td>";
		echo "<td>".$res['last_name']."</td>";
		echo "<td>".$res['address']."</td>";	
		echo "<td>".$res['phone_number']."</td>";
		echo "<td>".$res['age']."</td>";	
		echo "<td>".$res['email']."</td>";
		echo "<td>".$res['password']."</td>";
		echo "<td><a href=\"edit.php?id=$res[id]\">Edit</a> | <a href=\"delete.php?id=$res[id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";		
	}
	?>
	</table>
</div>
</body>
</html>
