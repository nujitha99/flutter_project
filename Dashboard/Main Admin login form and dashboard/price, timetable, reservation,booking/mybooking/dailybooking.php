<!doctype html>
<html>
<head>
<title> My booking</title>
<link rel="stylesheet" href="dailybookingcss.css">
</head>
<body>
<img src="trainadminloginwall.jpg" alt="Nature" class="responsive" width="600" height="400">
<form action ="dinsert.php" method ="post">
<div class = "bookingform">
	<div class ="title">
		<h2>My booking</h2>	
	</div>
	
	<div class ="form">
	<div class ="Name ">
		<div class= "innerform">
		<div class ="lable"> Name</div>
		<input type="text" name = "name" placeholder ="--enter--" >
	
		</div>
        </div>
		<div class ="Phonenumber ">
		<div class= "innerform">
		<div class ="lable">Phone number</div>
		<input type ="text"  name = "phonenumber" placeholder ="--enter--">
		</div>
        </div>
	<div class = "From">
	<div class ="innerform">
	<div class ="lable">From</div>
	<input type ="text"  name = "from" placeholder ="--enter--">
	</div>
	</div>
	<div class ="To">
	<div class ="innerform">
	<div class ="lable">To</div>
	<input type ="text"  name ="to" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Price">
	<div class ="innerform">
	<div class ="lable">Price  </div>
	<input type ="text" name =" price" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Class">
	<div class ="innerform">
	<div class ="lable">Class  </div>
	<input type ="text" name ="class" placeholder ="--enter--">
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