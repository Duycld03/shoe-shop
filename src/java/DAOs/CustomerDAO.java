package DAOs;

import DBConnection.DBConnection;
import Models.Customer;
import Utils.MD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

	public Customer checkGoogleLogin(String socialId) {
		String sql = "select * from Customers where SocialID = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, socialId);
			rs = ps.executeQuery();
			if (rs.next()) {
				Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
						rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), socialId,
						rs.getString("PhoneNumber"));
				return customer;
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public Customer checkLogin(String username, String password) {
		String sql = "select * from Customers where UserName = ? and Password = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, MD5.getMd5(password));
			rs = ps.executeQuery();
			if (rs.next()) {
				Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
						rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"),
						rs.getString("SocialID"), rs.getString("PhoneNumber"));
				return customer;
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public int add(Customer customer) {
		int count = 0;
		String sql = "insert into customers values(?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, customer.getCustomerId());
			ps.setString(2, customer.getUsername());
			ps.setString(3, MD5.getMd5(customer.getPassword()));
			ps.setString(4, customer.getEmail());
			ps.setString(5, customer.getFullname());
			ps.setString(6, customer.getSocialId());
			ps.setString(7, customer.getPhoneNumber());
			count = ps.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return count;
	}

	public int getCustomerCount() {
		int count = -1;
		String sql = "SELECT COUNT(*) AS CustomerCount FROM customers";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt("CustomerCount");
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return count;
	}

	public Customer getByEmail(String email) {
		String sql = "select * from Customers where email = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
						rs.getString("Password"), email, rs.getString("FullName"), rs.getString("SocialID"), rs.getString("PhoneNumber"));
				return customer;
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public int update(Customer customer) {
		int count = 0;
		String sql = "update Customers set UserName = ?, Password = ?, Email = ?, FullName = ?, SocialID =? where CustomerID = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, customer.getUsername());
			ps.setString(2, customer.getPassword());
			ps.setString(3, customer.getEmail());
			ps.setString(4, customer.getFullname());
			ps.setString(5, customer.getSocialId());
			ps.setString(6, customer.getCustomerId());
			count = ps.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return count;
	}
	//get Admins by ID

	public Customer getCustomerById(String id) {
		String sql = "Select * from Customers where CustomerID = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
						rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"),
						rs.getString("SocialID"), rs.getString("PhoneNumber"));
				return customer;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public Customer getCustomerByUsername(String username) {
		String sql = "Select * from Customers where UserName = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
						rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"),
						rs.getString("SocialID"), rs.getString("PhoneNumber"));
				return customer;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public static void main(String[] args) {
		CustomerDAO d = new CustomerDAO();
		String id = "Cus001";
		Customer c = d.getCustomerById(id);
		System.out.println(c.getFullname());
	}
}
