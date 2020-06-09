<?php
require('Database.php');
include('errors.php');
$conn = sqlsrv_connect($serverName, $connectionOptions); ?>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>View/Edit/Delete Records</title>

</head>
<body>
<div class="form">
<p><a href="Acceuil.html">Dashboard</a>
| <a href="insert.php">Insert New Record</a>
<h2>View/Edit/Delete Records</h2>
<table width="100%" border="1" style="border-collapse:collapse;">
<thead>
<tr>
<th><strong>N°Client</strong></th>
<th><strong>Nom</strong></th>
<th><strong>Prenom</strong></th>
<th><strong>Edit</strong></th>
<th><strong>Delete</strong></th>

</tr>
</thead>
<tbody>
<?php
$count=1;
$query = 'SELECT idClient, nomClient, prenomClient FROM Client;';
$result = sqlsrv_query($conn , $query);
if ($result === false) {
   format_errors(sqlsrv_errors());
   die();
}
while($row = sqlsrv_fetch_array($result, SQLSRV_FETCH_ASSOC)) { ?>
<tr>

<td align="center"><?php echo $row["idClient"]; ?></td>
<td align="center"><?php echo $row["nomClient"]; ?></td>
<td align="center"><?php echo $row["prenomClient"]; ?></td>
<td align="center">
<a href="edit.php?id=<?php echo $row["idClient"]; ?>">Edit</a>
</td>
<td align="center">
<a href="delete.php?id=<?php echo $row["idClient"]; ?>">Delete</a>
</td>
</tr>
<?php  } ?>
</tbody>
</table>
</div>
</body>
</html>
