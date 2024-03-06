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

    public ResultSet getAllCart() {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT Carts.*, ProductVariants.ProductID\n"
                + "FROM Carts\n"
                + "INNER JOIN ProductVariants ON Carts.VariantID = ProductVariants.VariantID;";
        try {
            // Đảm bảo cSonnection đã được khởi tạo và mở
            if (conn != null && !conn.isClosed()) {
                PreparedStatement st = conn.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
//                  Cart cart = new Cart(rs.getString("CartID"), rs.getInt("Quantity"), rs.getFloat("TotalPrice"), rs.getString("CustomerID"), rs.getString("VariantID"));
//                 list.add(cart);
                    return rs;
                }
            } else {
                System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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

    public static void main(String[] args) {
        CartDAO a = new CartDAO();
        List<Cart> l = (List<Cart>) a.getAllCart();//fixxxxxxxxxxxxxx
        System.out.println(l.get(0).getCartId());
    }

    public Cart checkCartExist(String accountID, String productID) {

        String query = "select * from Carts\r\n"
                + "where [customerId] = ? and [variantId] = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, accountID);
            ps.setString(2, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Cart(rs.getString(1),
                        rs.getInt(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editAmountAndSizeCart(String accountID, String productID, int amount) {
        String query = "update Carts set [quantity]=?,\r\n"
                + "where [customerId] = ? and [variantId] = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setString(2, accountID);
            ps.setString(3, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertCart(String accountID, String productID, int amount) {
        String query = "insert into Carts values(?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "Cart5");
            ps.setInt(2, amount);
            ps.setFloat(3, 1000);
            ps.setString(4, accountID);
            ps.setString(5, productID);
            int a = ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ResultSet getCartByAccountID(String accountID) {
        
        String query = "SELECT Carts.*, ProductVariants.ProductID\n"
                + "FROM Carts\n"
                + "INNER JOIN ProductVariants ON Carts.VariantID = ProductVariants.VariantID where CustomerID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, accountID);
            rs = ps.executeQuery();
            
             return rs;
        } catch (Exception e) {
        }
        return null;
    }

}
