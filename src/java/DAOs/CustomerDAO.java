package DAOs;

import DBConnection.DBConnection;
import Models.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duy
 */
public class CustomerDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public CustomerDAO() {
		conn = DBConnection.getConnection();
	}

	public Customer getCustomerByEmail(String email) {
		String sql = "select * from Customers where email = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"), rs.getString("Password"), email, rs.getString("FullName"), rs.getString("SocialID"));
				return customer;
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public Customer checkGoogleLogin(String socialId) {
		String sql = "select * from Customers where SocialID = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, socialId);
			rs = ps.executeQuery();
			if (rs.next()) {
				Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), socialId);
				return customer;
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	
}
