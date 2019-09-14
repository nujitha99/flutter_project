<?php
require_once ("rconnection.php");
if (isset ($_POST['save']))
{
	if(empty($_POST['from'])|| empty ($_POST['to'])|| empty($_POST['date'])|| empty($_POST['time']) ||empty($_POST['class'])|| empty($_POST['seat']) || empty ($_POST['price']) || empty ($_POST['ref']))
	{
		echo 'please fill in the blanks';
	}
else
{
	$startstation =$_POST ['from'];
	$endstation =$_POST ['to'];
	$userdate =$_POST ['date'];
	$usertime =$_POST ['time'];
	$userclass=$_POST ['class'];
	$seatnumber =$_POST ['seat'];
	$userprice=$_POST ['price'];
	$refnumber =$_POST ['ref'];
	
	
	
	$query = "insert into reserve ( start_station , end_station , user_date, user_time , user_class , seat_number , user_price , ref_number ) values ('$startstation','$endstation' ,'$userdate' , '$usertime' , '$userclass' , '$seatnumber' , '$userprice'  , '$refnumber' )";
	$result =mysqli_query($book , $query);
	if ($result)
	{
		header("location:reserveform.php");
	}
	else	
{
	echo 'please check your query';
}

}
}
else
{
	header("location:reserveform.php");
}
?>