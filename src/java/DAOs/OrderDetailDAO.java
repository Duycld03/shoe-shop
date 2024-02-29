/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Address;
import Models.Admin;
import Models.OrderDetail;
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
public class OrderDetailDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDetailDAO() {
        conn = DBConnection.getConnection();
    }

    //Delect OrderDetail by Order ID
    public int delectByOrderID(String OrderID) {
        int result = 0;
        String sql = "DELETE FROM [dbo].[OrderDetails]\n"
                + "      WHERE OrderID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, OrderID);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //Add Order Detail
    public int addOrderDetail(OrderDetail orderD) {
        int result = 0;
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([OrderDetailID]\n"
                + "           ,[Price]\n"
                + "           ,[Quantity]\n"
                + "           ,[OrderID]\n"
                + "           ,[VariantID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, orderD.getOrderDetailId());
            st.setFloat(2, orderD.getPrice());
            st.setInt(3, orderD.getQuantity());
            st.setString(4, orderD.getOrderId());
            st.setString(5, orderD.getVariantId());
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }

    //Update order Detail
}