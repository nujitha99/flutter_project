<?php
require_once("rconnection.php");
  if (isset($_POST['update']))
	  
  {
	 $userID = $_GET['ID'];
	$From = $_POST['from'];
	$To =$_POST['to'];
	$Date=$_POST['date'];
	$Time =$_POST['time'];
	$Class=$_POST['class'];
	$Seat =$_POST['seat'];
	$Price=$_POST['price'];
	$Ref =$_POST['ref'];
	
	
	$query = "update reserve set start_station = '".$From."' , end_station ='".$To."' , user_date = '".$Date."', user_time= '".$Time."' , user_class ='".$Class."' , seat_number = '".$Seat."' , user_price = '".$Price."' ,  ref_number = '".$Ref."' where user_ID = '".$userID."'";
    $result = mysqli_query($book , $query);
	
  if($result)
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
	 header("location:rserveform.php");
 }
?>