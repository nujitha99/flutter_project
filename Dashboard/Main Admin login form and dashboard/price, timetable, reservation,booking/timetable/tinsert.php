<?php
require_once ("tconnection.php");
if (isset ($_POST['save']))
{
	if(empty($_POST['trainid'])|| empty ($_POST['type'])|| empty($_POST['startstation'])|| empty($_POST['departure']) ||empty($_POST['endstation'])|| empty($_POST['arrival']))
	{
		echo 'please fill in the blanks';
	}
else
{
	$trainid =$_POST ['trainid'];
	$traintype =$_POST ['type'];
	$startstation =$_POST ['startstation'];
	$departure =$_POST ['departure'];
	$endstation=$_POST ['endstation'];
	$arrival =$_POST ['arrival'];
	
	
	
	$query ="insert into timetable (train_id ,train_type ,start_station ,start_time ,end_station ,end_time ) values('$trainid','$traintype','$startstation' ,'$departure' ,'$endstation' ,'$arrival')";
	$result =mysqli_query($time ,$query);
	if ($result)
	{
		header("location:timetableformphp.php");
	}
	else	
{
	echo 'please check your query';
}

}
}
else
{
	header("location:timetableformphp.php");
}
?>