<?php
require_once("pconnection.php");
$priceid =$_GET ['pGetid'];
$query = " SELECT * FROM  WHERE price_id = '".$priceid."'" ;
$result = mysqli_query($value ,$query);

 while ($row=mysqli_fetch_assoc($result))
 {
	 $priceid=$row['price_id'];
	 $startstation =$row['start_station'];
	$endstation =$row['end_station'];
	$classone =$row['class_one'];
	$classtwo =$row['class_two'];
	$classthree =$row['class_three'];
	
	
 }

?>

<!doctype html>
<html>
<head>
<title>Train price</title>
<link rel="stylesheet" href="pricecss.css">
</head>
<body>
<img src="railways.jpg" alt="Nature" class="responsive" width="600">
<form action="pupdate.php" method ="post">
<div class = "bookingform">
	<div class ="title">
		<h2>Train  update price </h2>	
	</div>
	
	<div class ="form">
	<div class ="From ">
		<div class= "innerform">
		<div class ="lable">From</div>
		<input type="text" name = "From" placeholder ="--enter--" value = "<?php echo $startstation?>">
	
		</div>
        </div>
		<div class ="To ">
		<div class= "innerform">
		<div class ="lable">To</div>
		<input type ="text"  name = "To" placeholder ="--enter--">
		</div>
        </div>
	<div class = "Classone">
	<div class ="innerform">
	<div class ="lable">1st class</div>
	<input type ="text"  name = "Classone" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Classtwo">
	<div class ="innerform">
	<div class ="lable">2nd class</div>
	<input type ="text"  name ="Classtwo" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Classthree">
	<div class ="innerform">
	<div class ="lable">3rd class  </div>
	<input type ="text" name ="Classthree" placeholder ="--enter--">
	</div>
	</div>
	
	
	<div class ="button">
	<button type ="submit" name="update" class ="btn">update</button>
</div>
	

	</div>
	</div>
	</form>
</body>
</html>