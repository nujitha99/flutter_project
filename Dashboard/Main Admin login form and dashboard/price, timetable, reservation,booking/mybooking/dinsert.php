<?php
require_once ("dconnection.php");
if (isset ($_POST['save']))
{
	if(empty($_POST['name'])|| empty ($_POST['phonenumber'])|| empty($_POST['from'])|| empty($_POST['to']) ||empty($_POST['price'])|| empty($_POST['class']))
	{
		echo 'please fill in the blanks';
	}
else
{
	$Name =$_POST ['name'];
	$PhoneNumber =$_POST ['phonenumber'];
	$From =$_POST ['from'];
	$To =$_POST ['to'];
	$Price=$_POST ['price'];
	$Class =$_POST ['class'];
	
	
	
	$query ="insert into daily (user_name , phone_number , start_station , end_station , user_price , user_class ) values('$Name','$PhoneNumber' ,'$From' ,'$To' ,'$Price' ,'$Class')";
	$result =mysqli_query($day ,$query);
	if ($result)
	{
		header("location:dailybookingform.php");
	}
	else	
{
	echo 'please check your query';
}

}
}
else
{
	header("location:dailybookingform.php");
}
?>