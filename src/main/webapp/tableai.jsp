<%@page import="cn.connection.Db_conn" %>
<%@page import="cn.model.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="test.Test_product"%>
<%@page import="test.User_test"%>
<%@page import="test.OrderBuy"%>
<%@page import="cn.model.OrdersBuy"%>
<%@page import="test.Cart"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #04AA6D;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
  
}

.table{
  margin-left: auto;
  margin-right: auto;
  margin-top:auto;
  
}
html,body{
background-image: url('https://st3.depositphotos.com/3126601/12891/i/450/depositphotos_128913196-stock-photo-pastel-color-background-with-gradient.jpg');
background-size: cover;
background-repeat: no-repeat;
</style>
</head>
<body>

<div class="sidebar">
  <a class="active">Espace Administrateur</a>
  <a href="index.jsp">Home</a>
  <a href="Admin">Stock</a>
  <a href="Ajout">Add product</a>
  <a href="orders.jsp">orders</a>
  <a href="cart.jsp">out</a>
  
</div>

<div class="content">
<div class="card-header my-3">All Product</div>
 <table width="100%" border="1">
	<tr>
		<th>name</th>
		<th> categ</th>
		<th> Prix de vente</th>
		<th> Photo</th>
		<th> Supprimer</th>
		<th> Modifier</th>

			</tr>
			
			<?php 
			while($ligne=mysqli_fetch_assoc($resultat))
			{
				
				?>
			<tr>
			<td><?php echo $ligne['Matricule'];?></td>
			<td> <?php echo $ligne['Marque'];?></td>
			<td> <?php echo $ligne['Prixvente'];?></td>
			<td>  <img src='<?php echo $ligne['Photo']; ?>' class="photocar" ></td>
			<td> <?php echo $ligne['Type'];?></td>
			<td><?php echo $ligne['Carburant']; ?> </td>
			<td> <a href="supprimer.php?supCar=<?php echo $ligne['Matricule'];?> "> <img src="images/supprimer.png" width="50px" height="50px"></a></td>
			<td> <a href="PageModifier.php?mod=<?php echo $ligne['Matricule'];?>"> <img src="images/modifierr.png" width="50px" height="50px"></a></td>
			
			
			</tr>
			<?php
			}
	        ?>
	
	</table>
</div>

</body>
</html>
