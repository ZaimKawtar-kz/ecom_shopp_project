<%@page import="cn.connection.Db_conn"%>
<%@page import="cn.model.Product"%>
<%@page import="test.Test_product"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.DriverManager" %>
<%@page import="cn.model.*" %>
<%@page import="test.Cart"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
String url="jdbc:mysql://localhost/ecommerce.project";
String driver = "com.mysql.cj.jdbc.Driver"; 
Class.forName(driver);
Connection con;
con = DriverManager.getConnection(url, "root", "");
Statement stmt = con.createStatement();

Test_product pd = new Test_product(con);
List<Product> products = pd.getAllProducts();
%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-Commerce Cart</title>
</head>
<body>
	<style>
@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-image: url('https://st3.depositphotos.com/3126601/12891/i/450/depositphotos_128913196-stock-photo-pastel-color-background-with-gradient.jpg');
background-size: cover;
height: 100vh;
}
}
</style>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card ">
					<img class="card-img-top"  src="image/<%=p.getImage()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: $<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="AddCart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="OrdersBuyServlet?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%  
			}
			} else {
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>