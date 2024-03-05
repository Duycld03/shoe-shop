package DAOs;

import Models.ProductImage;
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
public class ProductImageDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductImage getPrimaryImage(String productId) {
        String sql = "select * from ProductImages where ProductID = ? and isPrimary = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            ps.setBoolean(2, true);
            rs = ps.executeQuery();
            if (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), true, rs.getString("ProductID"));
                return productImage;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<ProductImage> getImages(String productId) {
        List<ProductImage> images = new ArrayList<>();
        String sql = "select * from ProductImages where ProductID = ? and isPrimary = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            ps.setBoolean(2, false);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), true, rs.getString("ProductID"));
                images.add(productImage);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return images;
    }

    public List<ProductImage> getImages2(String productId) {
        List<ProductImage> images = new ArrayList<>();
        String sql = "select * from ProductImages where ProductID = ? ";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), true, rs.getString("ProductID"));
                images.add(productImage);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return images;
    }

    //Delect Product Imgage by Product ID 
    public int delectImgByProID(String ProductID) {
        int result = 0;
        String sql = "DELETE FROM [dbo].[ProductImages]\n"
                + "      WHERE ProductID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, ProductID);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //Add Product Image
    public int addProductImge(ProductImage image) {
        int result = 0;
        String sql = "INSERT INTO [dbo].[ProductImages]\n"
                + "           ([ImageID]\n"
                + "           ,[IsPrimary]\n"
                + "           ,[ImageURL]\n"
                + "           ,[ProductID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, image.getImageId());
            st.setBoolean(2, image.isPrimary());
            st.setString(3, image.getImageURL());
            st.setString(4, image.getProductId());
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }

}
