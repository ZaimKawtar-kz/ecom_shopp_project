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
	
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf); 
	
	 List<OrdersBuy> orders = null;
	
	 User auth = (User) request.getSession().getAttribute("auth");
	 
	if(auth!=null){
		request.setAttribute("auth",auth);
		OrderBuy orderDao  = new OrderBuy(con);
		orders = orderDao.userOrders(auth.getId());
		}else{
			response.sendRedirect("login.jsp");
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

html,body{
background-image: url('https://st3.depositphotos.com/3126601/12891/i/450/depositphotos_128913196-stock-photo-pastel-color-background-with-gradient.jpg');
background-size: cover;
background-repeat: no-repeat;
}
</style>

<%@include file="/includes/navbar.jsp"%>

    <div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(OrdersBuy o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-secondary" href="cancel">Cancel Order</a>
						<a class="btn btn-secondary" href="cancel?id=<%=o.getId()%>">return</a>
						</td>
						
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	
<%@include file="/includes/footer.jsp" %>

</body>
</html>