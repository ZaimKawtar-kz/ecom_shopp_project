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
<%
String url="jdbc:mysql://localhost/ecommerce.project";
String driver = "com.mysql.cj.jdbc.Driver"; 
Class.forName(driver);
Connection con;
con = DriverManager.getConnection(url, "root", "");
Statement stmt = con.createStatement();

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("admin", auth);}

Test_product pd = new Test_product(con);
List<Product> products = pd.getAllProducts();
%>


	

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
@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-image: url('https://st3.depositphotos.com/3126601/12891/i/450/depositphotos_128913196-stock-photo-pastel-color-background-with-gradient.jpg');
background-size: cover;
height: 100vh;
}

table{
  border-collapse: collapse;
}

th, td{
  border: 1px solid black;
  padding: 10px;
}
</style>
</head>
<body>

<div class="sidebar">
  <a class="active">Espace Administrateur</a>
  <a href="Admin.jsp">Stock</a>
  <a href="comm.jsp">vent en cours</a>
  <a href="login.jsp">out</a>
  
</div>

<div class="content">
<div class="card-header my-3"><h3>All Product :</h3></div>


<% if(request.getAttribute("Message")!=null){ %>
<h4 style=color:red><%=request.getAttribute("Message")%></h4>
<% } %>

<div class="card-header my-3"><button type="button" class="btn btn-light"><a type="button" class="btn btn-light" href="Ajout.jsp">Add product</a></button>
</div>

     
			<table  class="table table-bordered">
  <thead>
     <tr>
          
           <th> image</th>
           <th >name</th>
           <th>categorie</th>
           <th >price</th>
           <th></th>
    </tr>
  </thead>
  
  <tbody>
 	      <%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			
          <tr>
               
                <td> <img style="height : 100%; max-height:75px; width : auto;" src="image/<%=p.getImage()%>" alt="Card image cap"/> </td>
		    	<td><%=p.getName() %> </td>
		    	<td> <%=p.getCategory() %></td>
		    	<td>: $<%=p.getPrice() %></td>
			    <td> <button type="submit" class="btn btn-primary btn-sm"><a type="button" class="btn btn-light" href="delete?id=<%=p.getId()%>">Delete</a></button> 
			    <button type="submit" class="btn btn-primary btn-sm"><a type="button" class="btn btn-light" href="modi.jsp">Update</a></button></td>
        </tr>
  </tbody>

			
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>		
</table>
</div>
</body>
</html>
