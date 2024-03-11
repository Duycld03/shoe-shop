/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Address;
import Models.Admin;
import Models.Cart;
import Models.OrderDetail;
import Models.ProductVariant;
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

    public List<OrderDetail> getOrderDetailByOrderID(String orderID) {
        List<OrderDetail> orderDs = new ArrayList<>();
        String sql = "select * from OrderDetails\n"
                + "where OrderID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail detail = new OrderDetail(rs.getString("OrderID"), rs.getFloat("Price"), rs.getInt("Quantity"), rs.getString("OrderID"), rs.getString("VariantID"));
                orderDs.add(detail);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return orderDs;
    }

    public boolean addOrderDetails(List<OrderDetail> orderDetails) {
        String query = "INSERT INTO OrderDetails (OrderDetailID, Price, Quantity, OrderID, VariantID) VALUES (?, ?, ?, ?, ?)";
        try ( PreparedStatement ps = conn.prepareStatement(query)) {
            for (OrderDetail orderDetail : orderDetails) {
                ps.setString(1, orderDetail.getOrderDetailId());
                ps.setFloat(2, orderDetail.getPrice());
                ps.setInt(3, orderDetail.getQuantity());
                ps.setString(4, orderDetail.getOrderId());
                ps.setString(5, orderDetail.getVariantId());
                ps.addBatch(); // Thêm câu lệnh vào batch để thực hiện nhiều lần
            }
            int[] affectedRows = ps.executeBatch(); // Thực hiện batch
            for (int affectedRow : affectedRows) {
                if (affectedRow == 0) {
                    return false; // Nếu không có hàng nào được thêm vào cơ sở dữ liệu
                }
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<String> getAllOrderDetailID() {
        List<String> orderDetailIds = new ArrayList<>();
        String sql = "select OrderDetailID from OrderDetails";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String address = rs.getString("OrderDetailID");
                orderDetailIds.add(address);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return orderDetailIds;
    }

    public List<OrderDetail> getOrderDetailsByOrderID(String orderID) {
        List<OrderDetail> details = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM OrderDetails\n"
                + "INNER JOIN ProductVariants ON OrderDetails.VariantID = ProductVariants.VariantID where OrderID = ?";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, orderID);
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String variantId = rs.getString("VariantID");
                    ProductVariant productVariant = new ProductVariant(variantId, rs.getString("Color"), rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getString("ProductID"), false);
                    OrderDetail detail = new OrderDetail(rs.getString(1), rs.getFloat(2), rs.getInt(3), rs.getString(4), rs.getString(5), productVariant);
                    details.add(detail);
                }
            }
            return details;
        } catch (SQLException e) {
            // Handle the exception appropriately (log, rethrow, etc.)
            System.out.println("Error retrieving order details: " + e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        List<OrderDetail> list = dao.getOrderDetailsByOrderID("Order1");
        if (dao.getOrderDetailsByOrderID("Order1") == null) {
            System.out.println("failed");
        }else {
            System.out.println("susscess");
        }
        for (OrderDetail orderDetail : list) {
            System.out.println(orderDetail.getOrderDetailId());
        }
    }

    //Update order Detail
}
