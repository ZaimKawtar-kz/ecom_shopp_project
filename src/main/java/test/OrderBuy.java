package test;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.model.Buyproduct;
import cn.model.OrdersBuy;
import cn.model.Product;


public class OrderBuy {

	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public OrderBuy(Connection con) {
		this.con = con;
	}
	
	public boolean insertOrderBuy(OrdersBuy model){
		boolean result = false;
	
		try {
            query = "insert into buy_orders(p_id, u_id, o_quantity, o_date) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQunatity());
            pst.setString(4,model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
		
		return result;
	}
	
	public List<OrdersBuy> userOrders(int id) {
        List<OrdersBuy> list = new ArrayList<>();
        try {
            query = "select * from buy_orders where u_id=? order by buy_orders.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
            	OrdersBuy order = new OrdersBuy();
                Test_product Test_product = new Test_product(this.con);
                int pId = rs.getInt("p_id");
                
                Product product = Test_product.getSingleProduct(pId);
                order.setOrderId(rs.getInt("p_id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("o_quantity"));
                order.setQunatity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
	//*******************************************************************
	
	public List<Buyproduct> getAllBuyproduct() {
		   List<Buyproduct> book = new ArrayList<>();
        try {
   query ="select o_id, o_quantity, o_date , email ,category  from (buy_orders INNER JOIN users ON buy_orders.u_id = users.id INNER JOIN products ON buy_orders.p_id = products.id)";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
            	Buyproduct row = new Buyproduct();
            	
            	row.setId(rs.getInt("o_id"));
                row.setDate(rs.getString("o_date"));
                row.setCategorie(rs.getString("category"));
                row.setQuntity(rs.getString("o_quantity"));
                row.setEmail(rs.getString("email"));
                book.add(row);
            }
             
               } catch (SQLException e) {
                     e.printStackTrace();
                     System.out.println(e.getMessage());
                    }
                    return book;
                }
	
	
    public void cancelOrder(int id) {
      
        try {
            query = "delete from buy_orders  where b_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}
