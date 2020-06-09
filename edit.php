<?php
require('Database.php');
include('errors.php');
$conn = sqlsrv_connect($serverName, $connectionOptions);
$id=$_GET['id'];
$query = "SELECT * from Client where idClient= ?";
$param=[$id];
$result = sqlsrv_query($conn, $query,$param);
if ($result === false) {
   format_errors(sqlsrv_errors());
   die();
}
$row = sqlsrv_fetch_array($result, SQLSRV_FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Update Record</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
<div class="form">
<p><a href="Acceuil.html">Dashboard</a>
| <a href="insert.php">Insert New Record</a>
<h1>Edit Record</h1>
<?php
$status = "";
if(isset($_POST['new']) && $_POST['new']==1)
{
$id=$_REQUEST['id'];
$nom =$_REQUEST['nom'];
$prenom =$_REQUEST['prenom'];

$tsql = 'UPDATE Client SET nomClient = ? , prenomClient= ? WHERE idClient = ?';
$param = [ $nom , $prenom , $id ];

$result = sqlsrv_query($conn , $tsql, $param);
if ($result === false) {
   format_errors(sqlsrv_errors());
   die();
}

$status = "Record Updated Successfully. </br></br>
<a href='view.php'>View Updated Record</a>";
echo '<p style="color:#FF0000;">'.$status.'</p>';
}else {
?>
<div>
<form name="form" method="post" action="">
<input type="hidden" name="new" value="1" />
<input name="id" type="hidden" value="<?php echo $row['idClient'];?>" />
<p><input type="text" name="nom" placeholder="Enter Name"
required value="<?php echo $row['nomClient'];?>" /></p>
<p><input type="text" name="prenom" placeholder="Enter Last Name"
required value="<?php echo $row['prenomClient'];?>" /></p>
<p><input name="submit" type="submit" value="Edit" /></p>
</form>
<?php } ?>
</div>
</div>
</body>
</html>
