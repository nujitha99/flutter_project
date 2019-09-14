<?php
require_once ("dconnection.php");
$query ="select* from daily";
$result = mysqli_query ($day ,$query);

?>

<!doctype  html>
<html>
<head>

<title>My booking</title>
<link rel="stylesheet" href="dailybookingformcss.css">
	<link rel="stylesheet" href="stylefornav.css">

</head>
<body background ="trainadminloginwall.jpg"">


<div class="menu">
			
			<div class="leftmenu">
				<h4>Reservation System</h4>
			</div>

			<div class="rightmenu">
				<ul>
					<li ><a href="../../adminDashboardHomepage.php" class="buttonone">HOME</a></li>
					<li><a href="../../manage officers2/crud2/index.php">Officers</a> </li>
					<li><a href="dailybookingform.php">Booking </a></li>
					<li><a href="../price/pricetablephp.php">Train Price</a></li>
					<li><a href="../reserve compartment/reserveform.php">Reserve Compartment</a></li>
					<li><a href="../timetable/timetableformphp.php">Train Timetables</a></li>

				</ul>
			</div>

		</div>

<table align="center">
<td id ="header" colspan="9">
    <h2>My booking</h2>
	<a href="dailybooking.php">Add New DailyBooking</a><br/><br/>
    
   </td>

<tr>
<td width ="10%"> ID</td>
<td width="20"%>Name</td>
<td width="10"%>Phone no</td>
<td width="10"%>From</td>
<td width="10"%>To</td>
<td width="10"%>price</td>
<td width="10"%>Class </td>
<td width="10"%>Edit</td>
<td width="10"%>Delete </td>

</tr>
<?php
          while($row= mysqli_fetch_assoc($result))
{
	$userID=$row['user_ID'];
	$Name =$row['user_name'];
	$PhoneNumber =$row['phone_number'];
	$From =$row['start_station'];
	$To =$row['end_station'];
	$Price =$row['user_price'];
	$Class =$row['user_class'];
	
	

?>
<tr>
<td><?php echo $userID?></td>
<td><?php echo $Name?></td>
<td><?php echo $PhoneNumber?></td>
<td><?php echo $From?></td>
<td><?php echo $To?></td>
<td><?php echo $Price?></td>
<td><?php echo $Class?></td>
<td><a href="dedit.php?tGetID=<?php echo $userID?>">Edit</a></td>
<td><a href ="ddelete.php?tDel=<?php echo $userID?>">Delete</a></td>
</tr>
<?php
}
?>

</table>
</body>
</html>