/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Cart;
import Models.ProductVariant;
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
                    String variantId = rs.getString("VariantID");
                    ProductVariant productVariant = new ProductVariant(variantId, rs.getString("Color"), rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getString("ProductID"), false);
                    Cart cart = new Cart(rs.getString("CartID"), rs.getInt("Quantity"), rs.getFloat("TotalPrice"),
                            rs.getString("CustomerID"), productVariant);
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

    public Cart getCartByCartId(String cartId) {
        String sql = "SELECT *\n"
                + "FROM Carts\n"
                + "INNER JOIN ProductVariants ON Carts.VariantID = ProductVariants.VariantID where CartID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, cartId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String variantId = rs.getString("VariantID");
                ProductVariant productVariant = new ProductVariant(variantId, rs.getString("Color"), rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getString("ProductID"), false);
                Cart cart = new Cart(rs.getString("CartID"), rs.getInt("Quantity"), rs.getFloat("TotalPrice"),
                        rs.getString("CustomerID"), productVariant);
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
            ps.setString(5, cart.getProductVariant().getVariantId());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int delete(String cartId) {
        int result = 0;
        String sql = "DELETE FROM [dbo].[Carts]\n"
                + "      WHERE CartID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cartId);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
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
            ps.setString(4, cart.getProductVariant().getVariantId());
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

    public Cart checkCartExist(String customerId, String variantId) {
        String sql = "SELECT *\n"
                + "FROM Carts\n"
                + "INNER JOIN ProductVariants ON Carts.VariantID = ProductVariants.VariantID where CustomerID = ? and ProductVariants.VariantID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerId);
            ps.setString(2, variantId);
            rs = ps.executeQuery();
            if (rs.next()) {
                ProductVariant productVariant = new ProductVariant(variantId, rs.getString("Color"), rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getString("ProductID"), false);
                Cart cart = new Cart(rs.getString("CartID"), rs.getInt("Quantity"), rs.getFloat("TotalPrice"),
                        rs.getString("CustomerID"), productVariant);
                return cart;
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

    public List<Cart> getCartByCusID(String customerId) {
        List<Cart> carts = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM Carts\n"
                + "INNER JOIN ProductVariants ON Carts.VariantID = ProductVariants.VariantID where CustomerID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String variantId = rs.getString("VariantID");
                ProductVariant productVariant = new ProductVariant(variantId, rs.getString("Color"), rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getString("ProductID"), false);
                Cart cart = new Cart(rs.getString("CartID"), rs.getInt("Quantity"), rs.getFloat("TotalPrice"),
                        rs.getString("CustomerID"), productVariant);
                carts.add(cart);
            }
            return carts;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
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

    public void deleteCartByCusId(String customerId) {
        String sql = "delete from Carts where CustomerID = ?";
        try {
            ps = conn.prepareCall(sql);
            ps.setString(1, customerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<String> getAllCartID() {
        List<String> cartIDs = new ArrayList<>();
        String sql = "select CartID from Carts";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String cartID = rs.getString("CartID");
                cartIDs.add(cartID);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return cartIDs;
    }

    public static void main(String[] args) {
        CartDAO a = new CartDAO();
        List<Cart> l = a.getCartByCusID("Cus2");
        for (Cart cart : l) {
            System.out.println(cart.getCartId());
        }
    }
}
