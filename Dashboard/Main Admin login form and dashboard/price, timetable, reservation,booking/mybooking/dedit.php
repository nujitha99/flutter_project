<?php
require_once("dconnection.php");
$userID =$_GET ['tGetID'];
$query = " select * from daily where user_ID = '".$userID."'" ;
$result = mysqli_query($day ,$query);

 while($row= mysqli_fetch_assoc($result))
 {
	
	
	$userID=$row['user_ID'];
	$Name =$row['user_name'];
	$PhoneNumber =$row['phone_number'];
	$From =$row['start_station'];
	$To =$row['end_station'];
	$Price =$row['user_price'];
	$Class =$row['user_class'];
	
 }

?>

<!doctype html>
<html>
<head>
<title>My booking</title>
<link rel="stylesheet" href="dailybookingcss.css">
</head>
<body>
<img src="trainadminloginwall.jpg" alt="Nature" class="responsive" width="600" height="400">
<form action ="dupdate.php?ID=<?php echo $userID ?>" method ="post">
<div class = "bookingform">
	<div class ="title">
		<h2> Update my bookinng</h2>	
	</div>
	
	<div class ="form">
	<div class ="Name ">
		<div class= "innerform">
		<div class ="lable">Name</div>
		<input type="text" name = "name" placeholder ="--enter--" value="<?php echo $Name?>">
	
		</div>
        </div>
		<div class ="Phonenumber ">
		<div class= "innerform">
		<div class ="lable">Phone number</div>
		<input type ="text"  name = "phonenumber" placeholder ="--enter--" value="<?php echo $PhoneNumber?>">
		</div>
        </div>
	<div class = "From">
	<div class ="innerform">
	<div class ="lable">From</div>
	<input type ="text"  name = "from" placeholder ="--enter--"  value="<?php echo $From?>">
	</div>
	</div>
	<div class ="To">
	<div class ="innerform">
	<div class ="lable">To </div>
	<input type ="text"  name ="to" placeholder ="--enter--"  value="<?php echo $To?>">
	</div>
	</div>
	<div class ="Price">
	<div class ="innerform">
	<div class ="lable">Price  </div>
	<input type ="text" name =" price" placeholder ="--enter--" value="<?php echo $Price?>" >
	</div>
	</div>
	<div class ="Class">
	<div class ="innerform">
	<div class ="lable">Class  </div>
	<input type ="text" name ="class" placeholder ="--enter--" value="<?php echo $Class?>" >
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