<?php
require_once("tconnection.php");
if(isset($_GET['tDel']))
{
	$userID =$_GET['tDel'];
	$query ="delete from timetable where user_ID='".$userID."'";
	$result =mysqli_query ($time ,$query);
	
	if ($result)
	{
		header("location:timetableformphp.php");
	}
	else
	{
		echo 'please check your query';
	}
}
 else
 {
	 header("location:timetableformphp.php");
 }
?>