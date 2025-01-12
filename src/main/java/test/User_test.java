package test;

import java.sql.*;
import cn.model.User;

public class User_test {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public User_test(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
        try {
            query = "select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
            	user = new User();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
        	e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }
	
	 public static int registerUser(User user) throws ClassNotFoundException {
	        String INSERT_USERS_SQL = "INSERT INTO users" +
	            "  (name, email, password) VALUES " +
	            " (?, ?, ?);";

	        int result = 0;
	      

	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost/ecommerce.project", "root", "");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
	          
	            preparedStatement.setString(1, user.getName());
	            preparedStatement.setString(2, user.getEmail());
	            preparedStatement.setString(3, user.getPassword());
	          

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