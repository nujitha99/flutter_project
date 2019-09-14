<?php
require_once ("pconnection.php");
$query ="SELECT * FROM price ";
$result = mysqli_query ($value ,$query);

?>

<!doctype  html>
<html>
<head>

<title>Train price table</title>
<link rel="stylesheet" href="pricetablecss.css">
</head>
<body background ="railways.jpg"">

<table align="center">
<td id ="header" colspan="8">
    <h2>Train price timetable</h2>
    
   </td>
<tr>
<td > ID</td>
<td > From</td>
<td >To</td>
<td > 1st class </td>
<td > 2nd class</td>
<td > 3rd class</td>
<td>Edit</td>
<td width="10"%>Delete </td>

</tr>
<?php
          while($row= mysqli_fetch_assoc($result))
{
	$priceid=$row['price_id'];
	$startstation =$row['start_station'];
	$endstation =$row['end_station'];
	$classone =$row['class_one'];
	$classtwo =$row['class_two'];
	$classthree =$row['class_three'];	

?>
<tr>
<td><?php echo $priceid?></td>
<td><?php echo $startstation?></td>
<td><?php echo $endstation?></td>
<td><?php echo $classone?></td>
<td><?php echo $classtwo?></td>
<td><?php echo $classthree?></td>
<td><a href="#">Edit</a></td>
<td><a href ="#">Delete</a></td>
</tr>
<?php
}
?>

</table>
</body>
</html>