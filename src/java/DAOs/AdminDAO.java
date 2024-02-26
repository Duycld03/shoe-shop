package DAOs;

import DBConnection.DBConnection;
import Models.Admin;
import Models.Staff;
import Utils.MD5;
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
public class AdminDAO {
    
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public AdminDAO() {
        conn = DBConnection.getConnection();
    }
    
    public Admin checkLogin(String username, String password) {
        String sql = "select * from Admins where UserName = ? and Password = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, MD5.getMd5(password));
            rs = ps.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin(rs.getString("AdminID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), rs.getString("PhoneNumber"));
                return admin;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
