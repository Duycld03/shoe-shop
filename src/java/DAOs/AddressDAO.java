/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Address;
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
 * @author Doan Thanh Phuc - CE170580
 */
public class AddressDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AddressDAO() {
        conn = DBConnection.getConnection();
    }

    //read all from admins
    public List<Address> getAdressAdmins() {
        List<Address> list = new ArrayList<>();
        String sql = "Select * from Addresses";
        try {
            // Đảm bảo cSonnection đã được khởi tạo và mở
            if (conn != null && !conn.isClosed()) {
                PreparedStatement st = conn.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Address adress = new Address(rs.getString("AddressID"),
                            rs.getString("City"), rs.getString("addressDetail"),
                            rs.getString("StaffID"), rs.getString("CustomerID"), rs.getBoolean("isPrimary"));
                    list.add(adress);
                }
            } else {
                System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //get Admins by ID
    public Address getAdressnByCusId(String id) {
        String sql = "Select * from Addresses where CustomerID = ? and isPrimary = 1";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Address adress = new Address(rs.getString("AddressID"),
                        rs.getString("City"), rs.getString("addressDetail"),
                        rs.getString("StaffID"), rs.getString("CustomerID"), rs.getBoolean("isPrimary"));
                return adress;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

//    //add new admin
//    public void addAdmin(Admin c) {
//        String sql = "INSERT INTO [dbo].[Admins]\n"
//                + "           ([AdminID]\n"
//                + "           ,[UserName]\n"
//                + "           ,[Password]\n"
//                + "           ,[Email]\n"
//                + "           ,[FullName]\n"
//                + "           ,[PhoneNumber])\n"
//                + "     VALUES\n"
//                + "           (?,?,?,?,?,?)";
//        try {
//            PreparedStatement st = conn.prepareCall(sql);
//            st.setString(1, c.getAdminId());
//            st.setString(2, c.getUsername());
//            st.setString(3, c.getPassword());
//            st.setString(4, c.getEmail());
//            st.setString(5, c.getFullname());
//            st.setString(6, c.getPhoneNumber());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//
//    //delete Admin
//    public Boolean deleteAdmin(String id) {
//        String sql = "DELETE FROM [dbo].[Admins]\n"
//                + "      WHERE AdminID = ?";
//        try {
//            PreparedStatement st = conn.prepareStatement(sql);
//            st.setString(1, id);
//            st.executeUpdate();
//            return true;
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return false;
//    }
//
//    //update staff
//    public void updateAdmin(Admin c) {
//        String sql = "UPDATE [dbo].[Admins]\n"
//                + "   SET [UserName] = ?\n"
//                + "      ,[Password] = ?\n"
//                + "      ,[Email] = ?\n"
//                + "      ,[FullName] =?\n"
//                + "      ,[PhoneNumber] = ?\n"
//                + " WHERE [AdminID] = ?\n";
//        try {
//            PreparedStatement st = conn.prepareStatement(sql);
//            st.setString(1, c.getUsername());
//            st.setString(2, c.getPassword());
//            st.setString(3, c.getEmail());
//            st.setString(4, c.getFullname());
//            st.setString(5, c.getPhoneNumber());
//            st.setString(6, c.getAdminId());
//            st.executeUpdate();
//        } catch (SQLException e) {
//        }
//    }
//
//    public int getAdminsCount() {
//        int count = -1;
//        String sql = "SELECT COUNT(*) AS AdminNumbers FROM Admins";
//        try {
//            ps = conn.prepareStatement(sql);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                return rs.getInt("AdminNumbers");
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return count;
//    }
 
}
