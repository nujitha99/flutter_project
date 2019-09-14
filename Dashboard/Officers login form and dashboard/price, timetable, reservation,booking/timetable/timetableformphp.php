<?php
require_once ("tconnection.php");
$query ="select* from timetable";
$result = mysqli_query ($time ,$query);

?>

<!doctype  html>
<html>
<head>

<title>Train timetable</title>
<link rel="stylesheet" href="timetableformcss.css">
	<link rel="stylesheet" type="text/css" href="stylefornav.css">

</head>
<body background ="railways.jpg"">





				<div class="menu">
			
			<div class="leftmenu">
				<h4>Reservation System</h4>
			</div>

			<div class="rightmenu">
				<ul>
					<li ><a href="../../Officers DashboardHomepage.php">HOME</li>
					
					<li><a href="../mybooking/dailybookingform.php">Booking </a></li>
					<li><a href="../price/pricetablephp.php">Train Price</a></li>
					<li><a href="../reserve compartment/reserveform.php">Reserve Compartment</a></li>
					<li><a href="timetableformphp.php">Train Timetables</a></li>

				</ul>
			</div>

		</div>







<table align="center">
<td id ="header" colspan="9">
    <h2>Train timetable</h2>
    <a href="timetablephp.php">Add New Train timetable</a><br/><br/>
    
   </td>
<tr>
<td width ="10%"> ID</td>
<td width="20"%>Train id</td>
<td width="10"%>Train type</td>
<td width="10"%>Start station</td>
<td width="10"%>Departure</td>
<td width="10"%>End station</td>
<td width="10"%>Arrival </td>
<td width="10"%>Edit</td>
<td width="10"%>Delete </td>

</tr>
<?php
          while($row= mysqli_fetch_assoc($result))
{
	$userID=$row['user_ID'];
	$trainid =$row['train_id'];
	$traintype =$row['train_type'];
	$startstation =$row['start_station'];
	$departure =$row['start_time'];
	$endstation =$row['end_station'];
	$arrival =$row['end_time'];
	
	

?>
<tr>
<td><?php echo $userID?></td>
<td><?php echo $trainid?></td>
<td><?php echo $traintype?></td>
<td><?php echo $startstation?></td>
<td><?php echo $departure?></td>
<td><?php echo $endstation?></td>
<td><?php echo $arrival?></td>
<td><a href="tedit.php?tGetID=<?php echo $userID?>">Edit</a></td>
<td><a href ="tdelete.php?tDel=<?php echo $userID?>">Delete</a></td>
</tr>
<?php
}
?>

</table>
</body>
</html>