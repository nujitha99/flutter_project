<?php
require_once("dconnection.php");
if(isset($_GET['tDel']))
{
	$userID =$_GET['tDel'];
	$query ="delete from daily where user_ID='".$userID."'";
	$result =mysqli_query ($day ,$query);
	
	if ($result)
	{
		header("location:dailybookingform.php");
	}
	else
	{
		echo 'please check your query';
	}
}
 else
 {
	 header("location:dailybookingform.php");
 }
?>