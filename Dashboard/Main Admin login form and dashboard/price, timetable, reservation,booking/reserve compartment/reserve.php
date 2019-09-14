<!doctype html>
<html>
<head>
<title>Reserve compartment</title>
<link rel="stylesheet" href="reservecss.css">

</head>
<body>
<img src="trainadminloginwall.jpg" alt="Nature" class="responsive" width="600" height="400">
<form action ="rinsert.php" method ="post">
<div class = "bookingform">
	<div class ="title">
		<h2>Reserve compartment</h2>	
	</div>
	
	<div class ="form">
	<div class ="From ">
		<div class= "innerform">
		<div class ="lable">From</div>
		<input type="text" name = "from" placeholder ="--enter--" >
	
		</div>
        </div>
		<div class ="To ">
		<div class= "innerform">
		<div class ="lable">To</div>
		<input type ="text"  name = "to" placeholder ="--enter--">
		</div>
        </div>
	<div class = "Date">
	<div class ="innerform">
	<div class ="lable">Date</div>
	<input type ="text"  name = "date" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Time">
	<div class ="innerform">
	<div class ="lable">Time</div>
	<input type ="text"  name ="time" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Class">
	<div class ="innerform">
	<div class ="lable">Class  </div>
	<input type ="text" name =" class" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Seat">
	<div class ="innerform">
	<div class ="lable">Seat no</div>
	<input type ="text" name ="seat" placeholder ="--enter--">
	</div>
	</div>
	
	<div class ="Price">
	<div class ="innerform">
	<div class ="lable">Price</div>
	<input type ="text" name ="price" placeholder ="--enter--">
	</div>
	</div>
	
	<div class ="Ref">
	<div class ="innerform">
	<div class ="lable">Ref</div>
	<input type ="text" name ="ref" placeholder ="--enter--">
	</div>
	</div>
	
	
	<div class ="button">
	<button type ="submit" name="save" class ="btn">save</button>
</div>
	
	
	

	</div>
	</div>
	</form>
</body>
</html>