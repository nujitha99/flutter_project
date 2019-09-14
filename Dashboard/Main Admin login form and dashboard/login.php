


<?php

   include("source/db_connect.php");
   session_start();

    $conn =  mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);
   
  if(isset($_POST['login-btn'])) {
       
      // username and password sent from form 
      
       $phonenum = $_POST['user-phonenumber'];
        $password = $_POST['user-pass'];


        try{
      $sql = "SELECT * FROM admintable WHERE phonenumber = '$phonenum' AND password = '$password'";
      $result = mysqli_query($conn,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      
      $count = mysqli_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
		
      if($count == 1) {
          
         $_SESSION['phonenumber']= $phonenum;
         header("location: adminDashboardHomepage.php");
          
      }else {
          
                  echo "Error: Invalid username or password";
          
      }



   }

           catch (PDOException $e) {
      echo "Error: " . $e->getMessage();
      }
   }

?>





