/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Order;
import Utils.MD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class OrderDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDAO() {
        conn = DBConnection.getConnection();
    }
    // read all from admins

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "Select * from Orders";
        try {
            // Đảm bảo cSonnection đã được khởi tạo và mở
            if (conn != null && !conn.isClosed()) {
                PreparedStatement st = conn.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Order order = new Order(rs.getString("OrderID"), rs.getFloat("TotalAmount"),
                            rs.getTimestamp("OrderDate"), rs.getString("PaymentStatus"), rs.getString("OrderStatus"),
                            rs.getString("CustomerID"), rs.getString("PaymentMethod"), rs.getString("StaffID"));
                    list.add(order);
                }
            } else {
                System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // get Admins by ID
    public Order getOrderById(String id) {
        String sql = "Select * from Orders where OrderID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order order = new Order(rs.getString("OrderID"), rs.getFloat("TotalAmount"),
                        rs.getTimestamp("OrderDate"), rs.getString("PaymentStatus"), rs.getString("OrderStatus"),
                        rs.getString("CustomerID"), rs.getString("PaymentMethod"), rs.getString("StaffID"));
                return order;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    // add new admin
    public void addOrder(Order c) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([OrderID]\n"
                + "           ,[OrderDate]\n"
                + "           ,[PaymentStatus]\n"
                + "           ,[OrderStatus]\n"
                + "           ,[TotalAmount]\n"
                + "           ,[CustomerID]\n"
                + "           ,[PaymentMethod])\n"
                + "     VALUES\n"
                + "         ( ?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, c.getOrderId());
            st.setTimestamp(2, c.getOrderDate());
            st.setString(3, c.getPaymentStatus());
            st.setString(4, c.getOrderStatus());
            st.setFloat(5, c.getTotalAmount());
            st.setString(6, c.getCustomerId());
            st.setString(7, c.getPaymentMethod());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // delete Order
    public void deleteOrder(String id) {
        String sql = "DELETE FROM [dbo].[Orders]\n"
                + "      WHERE OrderID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // update update order
    public void updateOrder(Order c) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET[OrderDate] = ?\n"
                + "      ,[PaymentStatus] = ?\n"
                + "      ,[OrderStatus] =?\n"
                + "      ,[TotalAmount] = ?\n"
                + "      ,[CustomerID] = ?\n"
                + "      ,[PaymentMethod] = ?\n"
                + " WHERE [OrderID] = ?";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setTimestamp(1, c.getOrderDate());
            st.setString(2, c.getPaymentStatus());
            st.setString(3, c.getOrderStatus());
            st.setFloat(4, c.getTotalAmount());
            st.setString(5, c.getCustomerId());
            st.setString(6, c.getPaymentMethod());
            st.setString(7, c.getOrderId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    // Count number of Order
    public int getOrderCount() {
        int count = -1;
        String sql = "SELECT COUNT(*) AS OrderNumbers FROM Orders";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("OrderNumbers");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    // update Order Status
    public void updateOrderStatus(String orderID, String Processing) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [OrderStatus] = ? \n"
                + " WHERE [OrderID] = ?\n";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, Processing);
            st.setString(2, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getTotalPriceByM(int month) {
        int total = 0;
        String sql = "Select Sum(o.TotalAmount) as TotalPrice from Orders o where MONTH(o.OrderDate) = ? and o.PaymentStatus = 'Paid'\n"
                + "and o.OrderStatus = 'accepted'";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, month); // Thiết lập giá trị tham số month
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalPrice");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public int updateOrderbyStaffID(String staffID) {
        int count = 0;
        String sql = "UPDATE orders\n"
                + "SET staffid = NULL\n"
                + "WHERE staffid = ?;";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, staffID);
            count = st.executeUpdate();
        } catch (SQLException e) {
        }
        return count;
    }

    public boolean updateTakeCareStaff(String StaffID, String OrderID) {
        String sql = "Update Orders\n"
                + "set StaffID = ?,\n"
                + "    OrderStatus = 'Accepted'\n"
                + "where OrderID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, StaffID);
            ps.setString(2, OrderID);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public int updateOrderbyCustomerID(String customerID) {
        int count = 0;
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [CustomerID] = NULL\n"
                + " WHERE CustomerID  = ?";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, customerID);
            count = st.executeUpdate();
        } catch (SQLException e) {
        }
        return count;
    }

    public List<Order> getOrderbyStaffID(String staffID) {
        List<Order> list = new ArrayList<>();
        String sql = "Select * from Orders\n"
                + "where StaffID is null or StaffID = ?";
        try {
            // Đảm bảo cSonnection đã được khởi tạo và mở
            if (conn != null && !conn.isClosed()) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, staffID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Order order = new Order(rs.getString("OrderID"), rs.getFloat("TotalAmount"),
                            rs.getTimestamp("OrderDate"), rs.getString("PaymentStatus"), rs.getString("OrderStatus"),
                            rs.getString("CustomerID"), rs.getString("PaymentMethod"), rs.getString("StaffID"));
                    list.add(order);
                }
            } else {
                System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Order> getOrdersbyCustomerId(String customerId) {
        List<Order> list = new ArrayList<>();
        String sql = "Select * from Orders\n"
                + "where CustomerID = ?";
        try {
            // Đảm bảo cSonnection đã được khởi tạo và mở
            if (conn != null && !conn.isClosed()) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, customerId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Order order = new Order(rs.getString("OrderID"), rs.getFloat("TotalAmount"),
                            rs.getTimestamp("OrderDate"), rs.getString("PaymentStatus"), rs.getString("OrderStatus"),
                            rs.getString("CustomerID"), rs.getString("PaymentMethod"), rs.getString("StaffID"));
                    list.add(order);
                }
            } else {
                System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO d = new OrderDAO();
        List<Order> list = d.getAllOrder();
        for (Order order : list) {
            System.out.println(order.getCustomerId());
        }

    }

}
