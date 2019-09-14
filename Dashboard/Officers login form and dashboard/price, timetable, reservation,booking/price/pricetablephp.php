<?php
require_once("pconnection.php");
$query ="select* from price ";
$result = mysqli_query ($value ,$query);

?>
<!doctype  html>
<html>
<head>

<title>Train price table</title>
<link rel="stylesheet" href="pricetablecss.css">
  <link rel="stylesheet" type="text/css" href="stylefornav.css">

</head>
<body background ="railways.jpg"">





        <div class="menu">
      
      <div class="leftmenu">
        <h4>Reservation System</h4>
      </div>

      <div class="rightmenu">
        <ul>
          <li ><a href="../../Officers DashboardHomepage.php">HOME</a></li>
          
          <li><a href="../mybooking/dailybookingform.php">Booking </a></li>
          <li><a href="pricetablephp.php">Train Price</a></li>
          <li><a href="../reserve compartment/reserveform.php">Reserve Compartment</a></li>
          <li><a href="../timetable/timetableformphp.php">Train Timetables</a></li>


        </ul>
      </div>

    </div>







<table align="center">
<td id ="header" colspan="8">
    <h2>Train price timetable</h2>
    <a href="pricephp.php">Add New Price list </a><br/><br/>
    
   </td>
<tr>
<td width ="10%"> ID</td>
<td width="20%"> From</td>
<td width="20"%>To</td>
<td width="10"%> 1st class </td>
<td width="10"%> 2nd class</td>
<td width="10"%> 3rd class</td>
<td width="10"%>Edit</td>
<td width="10"%>Delete </td>
</tr>
<?php
          while($row= mysqli_fetch_assoc($result))
{
	$userID=$row['user_ID'];
	$startstation =$row['start_station'];
	$endstation =$row['end_station'];
	$classone =$row['class_one'];
	$classtwo =$row['class_two'];
	$classthree =$row['class_three'];	

?>
<tr>
   <td><?php echo $userID?></td>
   <td><?php echo $startstation?></td>
   <td><?php echo $endstation?></td>
   <td><?php echo $classone?></td>
   <td><?php echo $classtwo?></td>
   <td><?php echo $classthree?></td>
   <td><a href ="pedit.php?GetID=<?php echo $userID?>">Edit</a></td>
   <td><a href ="pdelete.php?pdel=<?php echo $userID?>">Delete</a></td>
</tr>
<?php
}
?>
</table>
</body>
</html>