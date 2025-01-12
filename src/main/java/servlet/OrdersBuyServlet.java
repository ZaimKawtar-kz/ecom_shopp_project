package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.Cart;
import test.OrderBuy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import cn.model.OrdersBuy;
import cn.model.User;


public class OrdersBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public OrdersBuyServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 try (PrintWriter out = response.getWriter()) {
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	            Date date = new Date();
			    User auth = (User) request.getSession().getAttribute("auth");

	            if (auth != null) {
	                String productId = request.getParameter("id");
	                int productQuantity = Integer.parseInt(request.getParameter("quantity"));
	                if (productQuantity <= 0) {
	                	productQuantity = 1;
	                }
	                
	                OrdersBuy orderModel = new OrdersBuy();
	                orderModel.setId(Integer.parseInt(productId));
	                orderModel.setUid(auth.getId()); 
	                orderModel.setQunatity(productQuantity);
	                orderModel.setDate(formatter.format(date));
	                
	                String url="jdbc:mysql://localhost/ecommerce.project";
	                String driver = "com.mysql.cj.jdbc.Driver"; 
	                Class.forName(driver);
	                Connection con;
	                con = DriverManager.getConnection(url, "root", "");
	                OrderBuy orderbuy = new OrderBuy(con);
	                
	                boolean result = orderbuy.insertOrderBuy(orderModel);
	                
	                if (result) {
	                    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
	                    if (cart_list != null) {
	                        for (Cart c : cart_list) {
	                            if (c.getId() == Integer.parseInt(productId)) {
	                                cart_list.remove(cart_list.indexOf(c));
	                                break;
	                            }
	                        }
	                    }
	                
	                    response.sendRedirect("orders.jsp");
	                } else {
	                    out.println("order failed");
	                }
	            } else {
	                response.sendRedirect("login.jsp");
	            }
	            
		 }catch (Exception e){
			 e.printStackTrace();
		 }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
