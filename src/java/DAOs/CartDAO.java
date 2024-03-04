/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Cart;
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
 * @author To Do Hong Y - CE171148
 */
public class CartDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CartDAO() {
        conn = DBConnection.getConnection();
    }

    public List<Cart> getAllCart() {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT [CartID]\n"
                + "      ,[Quantity]\n"
                + "      ,[TotalPrice]\n"
                + "      ,[CustomerID]\n"
                + "      ,[VariantID]\n"
                + "  FROM [dbo].[Carts]";
        try {
            // Đảm bảo cSonnection đã được khởi tạo và mở
            if (conn != null && !conn.isClosed()) {
                PreparedStatement st = conn.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Cart cart = new Cart(rs.getString("CartID"), rs.getInt("Quantity"), rs.getFloat("TotalPrice"), rs.getString("CustomerID"), rs.getString("VariantID"));
                    list.add(cart);
                }
            } else {
                System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Cart getCartById(String id) {
        String sql = "SELECT [CartID]\n"
                + "      ,[Quantity]\n"
                + "      ,[TotalPrice]\n"
                + "      ,[CustomerID]\n"
                + "      ,[VariantID]\n"
                + "  FROM [dbo].[Carts]\n"
                + "  where CartID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Cart cart = new Cart(rs.getString("CartID"), rs.getInt("Quantity"), rs.getFloat("TotalPrice"), rs.getString("CustomerID"), rs.getString("VariantID"));
                return cart;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int add(Cart cart) {
        int count = 0;
        String sql = "INSERT INTO [dbo].[Carts]\n"
                + "           ([CartID]\n"
                + "           ,[Quantity]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[CustomerID]\n"
                + "           ,[VariantID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, cart.getCartId());
            ps.setInt(2, cart.getQuantity());
            ps.setFloat(3, cart.getTotalPrice());
            ps.setString(4, cart.getCustomerId());
            ps.setString(5, cart.getVariantId());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int delete(String cartId) {
        int ketqua = 0;
        String sql = "DELETE FROM [dbo].[Carts]\n"
                + "      WHERE CartID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cartId);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public String getLatestCartID() {
        String cartid = "";

        try {
            ps = conn.prepareStatement("select * from Carts where CartID = (select max(CartID) from Carts)");
            rs = ps.executeQuery();

            System.out.println(rs);
            if (rs.next()) {

                cartid = rs.getString("CartID");

            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cartid;
    }

    public int update(Cart cart) {
        int count = 0;
        String sql = "UPDATE [dbo].[Carts]\n"
                + "   SET [Quantity] = ?\n"
                + "      ,[TotalPrice] = ?\n"
                + "      ,[CustomerID] = ?\n"
                + "      ,[VariantID] = ?\n"
                + " WHERE CartID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cart.getQuantity());
            ps.setFloat(2, cart.getTotalPrice());
            ps.setString(3, cart.getCustomerId());
            ps.setString(4, cart.getVariantId());
            ps.setString(5, cart.getCartId());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getCartCount() {
        int count = -1;
        String sql = "SELECT COUNT(*) AS CartCount FROM Carts";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("CartCount");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getProductCountByCustomerId(String customerId) {
        int count = 0;
        String sql = "select count(*) as amount from Carts where CustomerID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerId);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("amount");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public List<Cart> getCartByCusID(String CusID) {
        List<Cart> carts = new ArrayList<>();

        return carts;
    }

    public int updateCartbyCustomerID(String customerID) {
        int count = 0;
        String sql = "UPDATE [dbo].[Carts]\n"
                + "   SET[CustomerID] = NULL\n"
                + " WHERE CustomerID = ?";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, customerID);
            count = st.executeUpdate();
        } catch (SQLException e) {
        }
        return count;
    }

    public static void main(String[] args) {
        CartDAO a = new CartDAO();
        List<Cart> l = a.getAllCart();
        System.out.println(l.get(0).getCartId());
    }

}
