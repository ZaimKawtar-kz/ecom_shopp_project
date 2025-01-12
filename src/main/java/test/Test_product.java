package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.model.Product;

public class Test_product {
	
    private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

    public Test_product(Connection con) {
		super();
		this.con = con;
		
	}
	
	public List<Product> getAllProducts() {
        List<Product> book = new ArrayList<>();
        try {

            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	
	  public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
	  public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
	        List<Cart> book = new ArrayList<>();
	        try {
	            if (cartList.size() > 0) {
	                for (Cart item : cartList) {
	                    query = "select * from products where id=?";
	                    pst = this.con.prepareStatement(query);
	                    pst.setInt(1, item.getId());
	                    rs = pst.executeQuery();
	                    while (rs.next()) {
	                        Cart row = new Cart();
	                        row.setId(rs.getInt("id"));
	                        row.setName(rs.getString("name"));
	                        row.setCategory(rs.getString("category"));
	                        row.setPrice(rs.getDouble("price")*item.getQuantity());
	                        row.setQuantity(item.getQuantity());
	                        row.setImage(rs.getString("image"));
	                        book.add(row);
	                    }

	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }
	        return book;
	    }
	 
	  public Product getSingleProduct(int id) {
		 Product row = null;
	        try {
	            query = "select * from products where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
	  
	  public static int registerProduct(Product product) throws ClassNotFoundException {
	        String INSERT_USERS_SQL = "INSERT INTO product" +
	            "  (name, category, price, image) VALUES " +
	            " (?, ?, ?,?);";

	        int result = 0;
	      

	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost/ecommerce.project", "root", "");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
	          
	            preparedStatement.setString(1, product.getName());
	            preparedStatement.setString(1, product.getCategory());
	            preparedStatement.setDouble(1, product.getPrice());
	            preparedStatement.setString(1, product.getImage());
	            

	            System.out.println(preparedStatement);
	            // Step 3: Execute the query or update query
	            result = preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	        	e.printStackTrace();
	            System.out.print(e.getMessage());
	        }
	        return result;
	    }

}
