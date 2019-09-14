<?php
require_once("dconnection.php");
  if (isset($_POST['update']))
	  
  {
	 $userID = $_GET['ID'];
	$Name = $_POST['name'];
	$PhoneNumber =$_POST['phonenumber'];
	$From=$_POST['from'];
	$To =$_POST['to'];
	$Price=$_POST['price'];
	$Class =$_POST['class'];
	
	$query = "update daily set user_name = '".$Name."' , phone_number ='".$PhoneNumber."' , start_station = '".$From."', end_station= '".$To."' , user_price ='".$Price."' , user_class = '".$Class."' where user_ID = '".$userID."'";
    $result = mysqli_query($day , $query);
	
  if($result)
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