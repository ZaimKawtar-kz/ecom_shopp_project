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
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

 #container{
        margin-top: 0;
        max-width:100%;
        background:#fff;
        padding:25px 30px;
        border-radius:5px;
    }
    #container .title{
        font-size:25px;
        font-weight:500;
        position:relative;
    }
    #container .title::before{
        content:'';
        position:absolute;
        
        height:3px;
        width:30px;
        background:#9a8f86;
        left:0;
        bottom:0;

    }
    #container form .user-details{
        display:flex;
        flex-wrap:wrap;
        justify-content: space-between;
        margin:20px 0 12px 0;
        
    }
    form .user-details .input-box{
        width: calc(100% /2 - 20px);
        margin-bottom:15px;
        
    }
    .user-details .input-box input{
        height:45px;
        width:100%;
        outline:none;
        border-radius:5px;
        border:1px solid #ccc;
        padding-left:15px;
        font-size:16px;
        border-bottom-width: 2px;
        transition:all 0.3s ease;
    }
     .user-details .input-box .details{
        display:block;
        font-weight:500;
        margin-bottom:5px;
    }


    .user-details .input-box input:focus,
    .user-details .input-box input:valid{
        border-color:#9a8f86;
    }

    form .button{
        height:45px;
        margin:45px 0;
         justify-content: space-between;

    }
     form .button input{
          height:50%;
          width: 50%;
          color: #fff;
           background:#696969;
           border:none;


     }
         form .button input:hover{
              background:#c4aead;
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


	 <div class="title"><h2>Ajouter produit</h2></div>
	 <div class="row">
         <div class="col-md-6"> 
  <form name="formAdd" style="margin:60px"  action="UploadServlet" method="post"  enctype="multipart/form-data">
                
                   <div class="user-details">
                   <div class="input-box">
                   <span class="details">Name</span>
                   <input type="text" name="name"   placeholder="Name" required>
                   </div>

                   <div class="input-box">
                   <span class="details">Categorie</span>
                   <input type="text" name="category"  placeholder="categorie" required>
                   </div>

                   <div class="input-box">
                   <span class="details">Prix </span>
                   <input type="text" name="price"  placeholder="Entrer un le prix " required>
                   </div>
    			   
                   <div class="input-box">
                   <span class="details">Photo</span>
                   <input type="file" name="image"  placeholder="Choisir une image" required>
                   </div>

                </div>
                   <div class="button">
    			   <input type="submit" name="btadd" value="Ajouter" >
               </div>
             </form>
            </div>
            </div>
            </div>


</body>
</html>
