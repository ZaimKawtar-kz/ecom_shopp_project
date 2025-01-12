
<%@page import="cn.connection.Db_conn" %>
<%@page import="cn.model.Buyproduct"%>
<%@ page import="java.sql.DriverManager" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="test.OrderBuy"%>
<%@page import="cn.model.OrdersBuy"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
	String url="jdbc:mysql://localhost/ecommerce.project";
	String driver = "com.mysql.cj.jdbc.Driver"; 
	Class.forName(driver);
	Connection con;
	con = DriverManager.getConnection(url, "root", "");
	
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf); 

	OrderBuy pp = new OrderBuy(con);
	List<Buyproduct> kk = pp.getAllBuyproduct();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/head.jsp"%>
</head>
<body>

<style>

html,body{
background-image: url('https://st3.depositphotos.com/3126601/12891/i/450/depositphotos_128913196-stock-photo-pastel-color-background-with-gradient.jpg');
background-size: cover;
background-repeat: no-repeat;
}

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
</style>

<div class="sidebar">
  <a class="active">Espace Administrateur</a>
  <a href="Admin.jsp">Stock</a>
  <a href="comm.jsp">Commandes</a>
  <a href="login.jsp">out</a>
  
</div>

<div class="content">

    <div class="container">
		<div class="card-header my-3">All Commandes</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">   </th>
				</tr>
			</thead>
			<tbody>
			
           <% 
	        	if (!kk.isEmpty()) {
		     	for (Buyproduct p : kk) {
		    %>
					<tr>
						<td><%=p.getId() %></td>
						<td><%=p.getDate() %></td>
						<td><%=p.getEmail() %></td>
						<td><%=p.getCategorie() %></td>
						<td><%=p.getQuntity() %></td>
						<td> <td> <a type="button" class="btn btn-light" href="">Valide</a>
			            <a type="button" class="btn btn-light" href="">refuse</a></td>
						
					</tr>
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>		
			
			</tbody>
		</table>
	</div>
	
<%@include file="/includes/footer.jsp" %>

</body>
</html>