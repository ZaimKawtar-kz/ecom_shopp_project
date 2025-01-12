package servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;


import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



@MultipartConfig

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			System.out.println("In do post method of Add Image servlet.");
			Part file=request.getPart("image");
			
			String imageFileName=file.getSubmittedFileName();  // get selected image file name
			System.out.println("Selected Image File Name : "+imageFileName);
			
			String uploadPath="C:/Users/user/eclipse-workspacee/ecom_shopp_project/src/main/webapp/product_image/"+imageFileName;  // upload path where we have to upload our actual image
			System.out.println("Upload Path : "+uploadPath);
			
			 String name = request.getParameter("name");
		     String category = request.getParameter("category");
		     Double price = Double.parseDouble(request.getParameter("price"));
			
			// Uploading our selected image into the images folder
			
			try
			{
			
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
			//**********************
			
			//getting database connection (jdbc code)
			Connection connection=null;
			try 
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce.project","root","");
				PreparedStatement product;
				String query="insert into products(name ,category, price, image) values (?,?,?,?)";
				product=connection.prepareStatement(query);
				
			    product.setString(1	,name);
			    product.setString(2	,category);
			    product.setDouble(3,price);
				product.setString(4,imageFileName);
				int row=product.executeUpdate(); // it returns no of rows affected.
			
			       if(row == 0) {
			        request.setAttribute("Message", "error inserting file");
			        getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
			       }
			       else {
			    	   request.setAttribute("Message", "your record inserted sucess fully");
				        getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
				       }
			            
			}catch (Exception e)
			{
				System.out.println(e);
			}
			
		}
}

		
	

