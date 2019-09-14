<?php
require_once("pconnection.php");
  if (isset($_POST['update']))
	  
  {
	 $userID = $_GET['ID'];
	$startstation = $_POST['From'];
	$endstation =$_POST['To'];
	$classone =$_POST['Classone'];
	$classtwo =$_POST['Classtwo'];
	$classthree =$_POST['Classthree'];
	
	
	$query = "update price set start_station ='".$startstation."' , end_station = '".$endstation."', class_one= '".$classone."' , class_two ='".$classtwo."' , class_three = '".$classthree."' where user_ID = '".$userID."'";
    $result = mysqli_query($value , $query);
  if($result)
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