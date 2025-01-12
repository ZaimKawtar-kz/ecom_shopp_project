package servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.User_test;

import java.io.IOException;

import cn.model.User;


public class Add_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
   
    public Add_user() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
			    throws ServletException, IOException {

			        String name = request.getParameter("name");
			        String email = request.getParameter("email");
			        String password = request.getParameter("password");
			       

			        User user = new User();
			        user.setName(name);
			        user.setEmail(email);
			        user.setPassword(password);
			       
			        try {
			            User_test.registerUser(user);
			        } catch (Exception e) {
			           
			            e.printStackTrace();
			        }

			        response.sendRedirect("reg.jsp");
			    }

}
