<?php
require_once ("pconnection.php");
if (isset ($_POST['save']))
{
	if(empty($_POST['From'])|| empty ($_POST['To'])|| empty($_POST['Classone'])|| empty($_POST['Classtwo']) ||empty($_POST['Classthree']))
	{
		echo 'please fill in the blanks';
	}
else
{
	$startstation =$_POST ['From'];
	$endstation =$_POST ['To'];
	$classone =$_POST ['Classone'];
	$classtwo =$_POST ['Classtwo'];
	$classthree=$_POST ['Classthree'];
	
	
	
	
	$query ="INSERT INTO price (start_station , end_station , class_one , class_two , class_three) values('$startstation','$endstation','$classone' ,'$classtwo' ,'$classthree')";
	$result =mysqli_query($value ,$query);
	if ($result)
	{
		header("location:pricetablephp.php");
	}
	else	
{
	echo 'please check your query';
}

}
}
else
{
	header("location:pricetablephp.php");
}
?>