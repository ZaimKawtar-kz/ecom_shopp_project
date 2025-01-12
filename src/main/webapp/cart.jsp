<%@page import="cn.connection.Db_conn" %>
<%@page import="cn.model.*" %>
<%@page import="java.text.DecimalFormat"%> 
<%@ page import="java.sql.DriverManager" %>
<%@page import="test.Test_product"%>
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

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf); 

%>
	
<%
	 User auth = (User) request.getSession().getAttribute("auth");
	if(auth!=null){
		request.setAttribute("auth",auth);
	}

	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		Test_product pDao = new Test_product(con);
		cartProduct = pDao.getCartProducts(cart_list);
		request.setAttribute("cart_list", cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("total", total);
		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<style>

@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-image: url('https://st3.depositphotos.com/3126601/12891/i/450/depositphotos_128913196-stock-photo-pastel-color-background-with-gradient.jpg');
background-size: cover;
height: 100vh;
}
</style>

<%@include file="/includes/navbar.jsp" %>

        <div class="container my-3">
		<div class="d-flex py-3"><h3>Total Price: $ ${ total } </h3> <a class="mx-3 btn btn-primary" href="check_out">Check Out</a></div>
		<table class="table table-light"> 
			<thead>
				<tr>
				    <th scope="col">   </th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
				    <td> <img style="height : 100%; max-height:75px; width : auto;" src="image/<%=c.getImage()%>" alt="Card image cap"/> </td>
				 	<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=c.getPrice()%>$</td>
					
					<td>
						
						<form action="OrdersBuyServlet" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="Quanti_prod?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="Quanti_prod?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a href="supp_prod?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
	</div>

<%@include file="/includes/footer.jsp" %>

</body>
</html>


