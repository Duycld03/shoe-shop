package DAOs;

import DBConnection.DBConnection;
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

    public ProductImageDAO() {
        conn = DBConnection.getConnection();
    }

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
        String sql = "Select * from ProductImages\n"
                + "where ProductID = ? ";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage
                        = new ProductImage(rs.getString(1),
                                rs.getString(3), rs.getBoolean(2), rs.getString(4));
                images.add(productImage);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
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
    public boolean addProductImge(ProductImage image) {
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
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public List<String> getAllImgID() {
        List<String> Imgs = new ArrayList<>();
        String sql = "Select ImageID from ProductImages";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String img = rs.getString("ProductID");
                Imgs.add(img);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return Imgs;
    }

    public boolean addNewImg(ProductImage img) {
        String sql = "INSERT INTO [dbo].[ProductImages]\n"
                + "           ([ImageID]\n"
                + "           ,[IsPrimary]\n"
                + "           ,[ImageURL]\n"
                + "           ,[ProductID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)\n"
                + "GO";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, img.getImageId());
            ps.setBoolean(2, img.isPrimary());
            ps.setString(3, img.getImageURL());
            ps.setString(4, img.getProductId());
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;
    }

    public String checkIsprimary(String proid, boolean isPrimary) {
        String sql = "Select ImageID from ProductImages where IsPrimary = 1 and ProductID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, isPrimary);
            ps.setString(2, proid);
            rs = ps.executeQuery();
            if (rs.next()) {
                String imgID = rs.getString(1);
                return imgID;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean UpdateIsPrimary(String updateImgID) {
        String sql = "Update ProductImages\n"
                + "set IsPrimary = 1\n"
                + "where ImageID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, updateImgID);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        ProductImageDAO d = new ProductImageDAO();
        String proID = "P1";
        System.out.println(d.UpdateIsPrimary("Image1"));
    }

    public String randomImg(String proid) {
        String sql = "SELECT TOP 1 ImageID\n"
                + "FROM ProductImages\n"
                + "WHERE IsPrimary = 0 AND ProductID = ?\n"
                + "ORDER BY NEWID();";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, proid);
            rs = ps.executeQuery();
            if (rs.next()) {
                String randomImg = rs.getString(1);
                return randomImg;
            }
        } catch (Exception e) {
        }
        return null;

    }

    public boolean isPrimaryImage(String imgid) {
        String sql = "Select ImageID from ProductImages where IsPrimary = 1  and ImageID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, imgid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean deleteImage(String imgid) {
        String sql = "Delete ProductImages\n"
                + "where ImageID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, imgid);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

}
