package servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.OrderBuy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class cancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
  
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			
			String id = request.getParameter("id");
			String url="jdbc:mysql://localhost/ecommerce.project";
			String driver = "com.mysql.cj.jdbc.Driver"; 
			Class.forName(driver);
			Connection con;
			con = DriverManager.getConnection(url, "root", "");
			if(id != null) {
			
				OrderBuy orderDao = new OrderBuy(con);
				
				orderDao.cancelOrder(Integer.parseInt(id));
			}
			response.sendRedirect("orders.jsp");
		} catch (ClassNotFoundException|SQLException e) {
			
			e.printStackTrace();
		} 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
