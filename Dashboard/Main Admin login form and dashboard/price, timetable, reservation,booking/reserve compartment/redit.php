<?php
require_once("rconnection.php");
$userID =$_GET ['tGetID'];
$query = " select * from reserve where user_ID = '".$userID."'" ;
$result = mysqli_query($book ,$query);

 while($row= mysqli_fetch_assoc($result))
 {
	
	$userID=$row['user_ID'];
	$startstation =$row['start_station'];
	$endstation =$row['end_station'];
	$userdate =$row['user_date'];
	$usertime =$row['user_time'];
	$userclass =$row['user_class'];
	$seatnumber =$row['seat_number'];
	$userprice =$row['user_price'];
	$refnumber =$row['ref_number'];
	
 }

?>

<!doctype html>
<html>
<head>
<title>Reserve compartment</title>
<link rel="stylesheet" href="reservecss.css">
</head>
<body>
<img src="trainadminloginwall.jpg" alt="Nature" class="responsive" width="600" height="400">
<form action ="rupdate.php?ID=<?php echo $userID ?>" method ="post">
<div class = "bookingform">
	<div class ="title">
		<h2>Update details</h2>	
	</div>
	
	<div class ="form">
	<div class ="From ">
		<div class= "innerform">
		<div class ="lable">From</div>
		<input type="text" name = "from" placeholder ="--enter--" value="<?php echo $startstation?>">
	
		</div>
        </div>
		<div class ="To ">
		<div class= "innerform">
		<div class ="lable">To</div>
		<input type ="text"  name = "to" placeholder ="--enter--" value="<?php echo $endstation?>">
		</div>
        </div>
	<div class = "Date">
	<div class ="innerform">
	<div class ="lable">Date</div>
	<input type ="text"  name = "date" placeholder ="--enter--"  value="<?php echo $userdate?>">
	</div>
	</div>
	<div class ="Time">
	<div class ="innerform">
	<div class ="lable">Time </div>
	<input type ="text"  name ="time" placeholder ="--enter--"  value="<?php echo $usertime?>">
	</div>
	</div>
	<div class ="Class">
	<div class ="innerform">
	<div class ="lable">Class  </div>
	<input type ="text" name ="class" placeholder ="--enter--" value="<?php echo $userclass?>" >
	</div>
	</div>
	<div class ="Seat">
	<div class ="innerform">
	<div class ="lable">Seat </div>
	<input type ="text" name ="seat" placeholder ="--enter--" value="<?php echo $seatnumber?>" >
	</div>
	</div>
	
		<div class ="Price">
	<div class ="innerform">
	<div class ="lable">Price </div>
	<input type ="text" name ="price" placeholder ="--enter--" value="<?php echo $userprice?>" >
	</div>
	</div>
	
		<div class ="Ref">
	<div class ="innerform">
	<div class ="lable">Ref no </div>
	<input type ="text" name ="ref" placeholder ="--enter--" value="<?php echo $refnumber?>" >
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