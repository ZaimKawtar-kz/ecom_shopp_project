package servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.User_test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import cn.connection.Db_conn;
import cn.model.User;


public class Login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Login_servlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			User_test udao = new User_test(Db_conn.getConnection());
			User user = udao.userLogin(email, password);
			if (user != null) {
				
//				System.out.print("user logged in");
				if (user.getName().isEmpty()) {
					request.getSession().setAttribute("admin", user);
					response.sendRedirect("Admin.jsp");
				} else {
					
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("index.jsp");}
			} else {
				out.println("there is no user");
			}

		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		} 

	}
}