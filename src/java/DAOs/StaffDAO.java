package DAOs;

import DBConnection.DBConnection;
import Models.Staff;
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
public class StaffDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public StaffDAO() {
        conn = DBConnection.getConnection();
    }

    public Staff checkLogin(String username, String password) {
        String sql = "select * from Staffs where UserName = ? and Password = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, MD5.getMd5(password));
            rs = ps.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff(rs.getString("StaffID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"));
                return staff;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //read all from staff
    public List<Staff> getAllStaff() {
        List<Staff> list = new ArrayList<>();
        String sql = "SELECT [StaffID]\n"
                + "      ,[UserName]\n"
                + "      ,[Password]\n"
                + "      ,[Email]\n"
                + "      ,[FullName]\n"
                + "  FROM [dbo].[Staffs]";
        try {
            // Đảm bảo cSonnection đã được khởi tạo và mở
            if (conn != null && !conn.isClosed()) {
                PreparedStatement st = conn.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Staff c = new Staff(rs.getString("StaffID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"));
                    list.add(c);
                }
            } else {
                System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //getStaffByid  
    public Staff getStaffById(String id) {
        String sql = "SELECT [StaffID]\n"
                + "      ,[UserName]\n"
                + "      ,[Password]\n"
                + "      ,[Email]\n"
                + "      ,[FullName]\n"
                + "  FROM [dbo].[Staffs]\n"
                + "  where StaffID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Staff c = new Staff(rs.getString("StaffID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"));
                return c;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void insertStaff(Staff c) {
        String sql = "INSERT INTO [dbo].[Staffs]\n" +
"           ([StaffID]\n" +
"           ,[UserName]\n" +
"           ,[Password]\n" +
"           ,[Email]\n" +
"           ,[FullName])\n" +
"     VALUES\n" +
"           (?,?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, c.getLaptop_id());
            st.setString(2, c.getLaptop_name());
            st.setString(3, c.getLaptop_description());
            st.setFloat(4, c.getLaptop_price());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        StaffDAO a = new StaffDAO();
        List<Staff> l = a.getAllStaff();
        System.out.println(l.get(0).getStaffId());
    }

}
