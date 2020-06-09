<?php
require('Database.php');
include('errors.php');
$status = "";
$conn = sqlsrv_connect($serverName, $connectionOptions);

if(isset($_POST['new']) && $_POST['new']==1){
  
    $id = $_REQUEST['Id'];
    $name =$_REQUEST['name'];
    $prenom = $_REQUEST['prenom'];
    $tsql = 'INSERT INTO Client (idClient, nomClient,prenomClient) VALUES (?,?,?);';
    $donnees = [$id,$name,$prenom];
	
    $Errortest =sqlsrv_query($conn , $tsql,$donnees);
      if($Errortest == false){
        format_errors(sqlsrv_errors());
        die();
      }
    $status = "New Record Inserted Successfully.";
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert New Record</title>

</head>
<body>
<div class="form">
<p><a href="Acceuil.html">Dashboard</a>
| <a href="view.php">View/Edit/Delete Records</a>
<div>
<h1>Insert New Record</h1>
<form name="form" method="post" action="">
<input type="hidden" name="new" value="1" />
<p><input type="text" name="Id" placeholder="Enter Id" autocomplete="off" required /></p>
<p><input type="text" name="name" placeholder="Enter Name" autocomplete="off" required /></p>
<p><input type="text" name="prenom" placeholder="Enter Prenom" autocomplete="off" required /></p>
<p><input name="submit" type="submit" value="Submit" /></p>
</form>
<p style="color:#FF0000;"><?php echo $status; ?></p>
</div>
</div>
</body>
</html>
