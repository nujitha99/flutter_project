<?php
require_once("pconnection.php");
if(isset($_GET['pdel']))
{
	$userID =$_GET['pdel'];
	$query ="delete from price where user_ID='".$userID."'";
	$result =mysqli_query ($value ,$query);
	
	if ($result)
	{
		header("location:pricetablephp.php");
	}
	else
	{
		echo 'please check your query';
	}
}
 else
 {
	 header("location:pricetablephp.php");
 }
?>