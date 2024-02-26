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
import org.apache.jasper.tagplugins.jstl.core.ForEach;

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
                Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"), rs.getString("Password"), email, rs.getString("FullName"), rs.getString("SocialID"), rs.getString("phoneNumber"));
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
                Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), socialId, rs.getString("phoneNumber"));
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
                Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), rs.getString("SocialID"), rs.getString("phoneNumber"));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }


}
