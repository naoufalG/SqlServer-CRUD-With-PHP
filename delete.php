<?php
require('Database.php');
include('errors.php');
$conn = sqlsrv_connect($serverName, $connectionOptions);
$id=$_GET['id'];
$query = "DELETE FROM Entrepot.Client WHERE idClient= ?";
$param = [$id];
$result = sqlsrv_query($conn,$query,$param);
if($result === false){
  format_errors(sqlsrv_errors());
  die();
}
header("Location: view.php");
 ?>
