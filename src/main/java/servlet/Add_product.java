package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig(maxFileSize = 16999999)

public class Add_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			        String name = request.getParameter("name");
			        String category = request.getParameter("category");
			        Double price = Double.parseDouble(request.getParameter("price"));
			        Part filePart = request.getPart("image");
			       
			        InputStream inputStream = null;
			        
			        if (filePart != null) {
			        	long fileSize = filePart.getSize();
			        	String fileContent = filePart.getContentType();
			        	inputStream = filePart.getInputStream();
			        }
			       PreparedStatement product=con.prepareStatement("insert into products(name ,category, price, image) values (?,?,?,?)");

			    
			        product.setString(1	,name);
			        product.setString(2	,category);
			        product.setDouble(3,price);
			        product.setBlob(4,inputStream);
			        
			       int prod =product.executeUpdate();
			       if(prod == 0) {
			        request.setAttribute("Message", "error inserting file");
			        getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
			       }
			       else {
			    	   request.setAttribute("Message", "your record inserted sucess fully");
				        getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
				       }
			            
			        } catch (Exception e) {
			            e.printStackTrace();
			        }

			      
			    }

}
