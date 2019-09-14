<!doctype html>
<html>
<head>
<title>Train timetable</title>
<link rel="stylesheet" href="timetablecss.css">
</head>
<body>
<img src="trainadminloginwall.jpg" alt="Nature" class="responsive" width="600" height="400">
<form action ="tinsert.php" method ="post">
<div class = "bookingform">
	<div class ="title">
		<h2>Train time table</h2>	
	</div>
	
	<div class ="form">
	<div class ="Trainid ">
		<div class= "innerform">
		<div class ="lable"> Train id</div>
		<input type="text" name = "trainid" placeholder ="--enter--" >
	
		</div>
        </div>
		<div class ="Type ">
		<div class= "innerform">
		<div class ="lable">Train type</div>
		<input type ="text"  name = "type" placeholder ="--enter--">
		</div>
        </div>
	<div class = "Startstation">
	<div class ="innerform">
	<div class ="lable">Start station</div>
	<input type ="text"  name = "startstation" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Departure">
	<div class ="innerform">
	<div class ="lable">Departure </div>
	<input type ="text"  name ="departure" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Endstation">
	<div class ="innerform">
	<div class ="lable">End station  </div>
	<input type ="text" name =" endstation" placeholder ="--enter--">
	</div>
	</div>
	<div class ="Arrival">
	<div class ="innerform">
	<div class ="lable">Arrival  </div>
	<input type ="text" name ="arrival" placeholder ="--enter--">
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