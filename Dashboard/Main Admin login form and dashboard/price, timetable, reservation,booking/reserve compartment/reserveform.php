<?php
require_once ("rconnection.php");
$query ="select* from reserve";
$result = mysqli_query ($book ,$query);

?>

<!doctype  html>
<html>
<head>

<title>Reserve compartment</title>
<link rel="stylesheet" href="reserveformcss.css">
	<link rel="stylesheet" type="text/css" href="stylefornav.css">

</head>
<body background ="trainadminloginwall.jpg"">




		<div class="menu">
			
			<div class="leftmenu">
				<h4>Reservation System</h4>
			</div>

			<div class="rightmenu">
<ul>
          <li ><a href="../../adminDashboardHomepage.php">HOME</a></li>
          <li><a href="../../manage officers2/crud2/index.php">Officers</a> </li>
          <li><a href="../mybooking/dailybookingform.php">Booking </a></li>
          <li><a href="../price/pricetablephp.php">Train Price</a></li>
          <li><a href="reserveform.php">Reserve Compartment</a></li>
          <li><a href="../timetable/timetableformphp.php">Train Timetables</a></li>

        </ul>
			</div>

		</div>


	

<table align="center">
<td id ="header" colspan="11">
    <h2>Reserve compartment</h2>
    <a href="reserve.php">Add New ReserveDetailes</a><br/><br/>
    
   </td>
<tr>
<td width ="10%"> ID</td>
<td width="20"%>From</td>
<td width="10"%>To</td>
<td width="10"%>Date</td>
<td width="10"%>Time</td>
<td width="10"%>Class</td>
<td width="10"%>Seat </td>
<td width="10"%>Price </td>
<td width="10"%>Ref no </td>
<td width="10"%>Edit</td>
<td width="10"%>Delete </td>

</tr>
<?php
          while($row= mysqli_fetch_assoc($result))
{
	$userID=$row['user_ID'];
	$startstation =$row['start_station'];
	$endstation =$row['end_station'];
	$userdate =$row['user_date'];
	$usertime =$row['user_time'];
	$userclass =$row['user_class'];
	$seatnumber =$row['seat_number'];
	$userprice =$row['user_price'];
	$refnumber =$row['ref_number'];
	
	

?>
<tr>
<td><?php echo $userID?></td>
<td><?php echo $startstation?></td>
<td><?php echo $endstation?></td>
<td><?php echo $userdate?></td>
<td><?php echo $usertime?></td>
<td><?php echo $userclass?></td>
<td><?php echo $seatnumber?></td>
<td><?php echo $userprice?></td>
<td><?php echo $refnumber?></td>
<td><a href="redit.php?tGetID=<?php echo $userID?>">Edit</a></td>
<td><a href ="rdelete.php?tDel=<?php echo $userID?>">Delete</a></td>
</tr>
<?php
}
?>

</table>
</body>
</html>