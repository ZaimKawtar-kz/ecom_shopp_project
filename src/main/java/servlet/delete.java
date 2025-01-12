package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import test.Test_product;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import cn.model.Product;


public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public delete() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
			    throws ServletException, IOException {

		 try {
			      String url="jdbc:mysql://localhost/ecommerce.project";
			      String driver = "com.mysql.cj.jdbc.Driver"; 
			      Class.forName(driver);
			      Connection con;
			      con = DriverManager.getConnection(url, "root", "");

			      
			       int id = Integer.parseInt(request.getParameter("id"));
			       PreparedStatement product=con.prepareStatement("delete from products where id=?");

			    
			        product.setInt(1,id);
			       
			       int prod =product.executeUpdate();
			       if(prod == 0) {
			        request.setAttribute("Message", "error file");
			        getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
			       }
			       else {
			    	   request.setAttribute("Message", "your record delete with sucess fully");
				        getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
				       }
			            
			        } catch (Exception e) {
			            e.printStackTrace();
			        }

			      
			    }

}
