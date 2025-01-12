<%@page import="cn.connection.Db_conn" %>
<%@page import="cn.model.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="test.Test_product"%>
<%@page import="test.Cart"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
	 User auth = (User) request.getSession().getAttribute("auth");
	if(auth!=null){
		response.sendRedirect("index.jsp");
	}
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
	<%@include file="/includes/navbar.jsp"%>

	<style>
@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-image: url('https://st3.depositphotos.com/3126601/12891/i/450/depositphotos_128913196-stock-photo-pastel-color-background-with-gradient.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}
</style>

 <h6>User successfully registered !!</h6>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>