<?php
require_once("rconnection.php");
if(isset($_GET['tDel']))
{
	$userID =$_GET['tDel'];
	$query ="delete from reserve where user_ID='".$userID."'";
	$result =mysqli_query ($book ,$query);
	
	if ($result)
	{
		header("location:reserveform.php");
	}
	else
	{
		echo 'please check your query';
	}
}
 else
 {
	 header("location:reserveform.php");
 }
?>