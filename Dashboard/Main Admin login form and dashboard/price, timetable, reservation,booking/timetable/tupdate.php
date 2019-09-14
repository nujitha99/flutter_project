<?php
require_once("tconnection.php");
  if (isset($_POST['update']))
	  
  {
	 $userID = $_GET['ID'];
	$trainid = $_POST['trainid'];
	$traintype =$_POST['type'];
	$startstation =$_POST['startstation'];
	$departure =$_POST['departure'];
	$endstation =$_POST['endstation'];
	$arrival =$_POST['arrival'];
	
	$query = "update timetable set train_id = '".$trainid."' , train_type ='".$traintype."' , start_station = '".$startstation."', start_time= '".$departure."' , end_station ='".$endstation."' , end_time = '".$arrival."' where user_ID = '".$userID."'";
    $result = mysqli_query($time , $query);
	
  if($result)
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