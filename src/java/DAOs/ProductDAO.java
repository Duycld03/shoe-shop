package DAOs;

import DBConnection.DBConnection;
import Models.Admin;
import Models.Product;
import Models.ProductImage;
import Utils.MD5;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.print.attribute.standard.MediaSize;

/**
 *
 * @author Duy
 */
public class ProductDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductDAO() {
        conn = DBConnection.getConnection();
    }

    public ResultSet getAll() {
        String sql = "select * from Products";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "select * from products p inner join ProductImages i on p.ProductID = i.ProductID where p.isDeleted = 0 and i.isPrimary = 1";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), false,
                        rs.getString("ProductID"));
                Product product = new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getFloat("Price"), rs.getFloat("Discount"), rs.getString("Description"),
                        rs.getString("BrandID"), false, productImage);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getTop3DiscountedProduct() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT Top 3 * FROM Products p inner join ProductImages i on p.ProductID = i.ProductID WHERE Discount IS NOT NULL AND i.isPrimary = 1 AND p.isDeleted = 0 ORDER BY Discount DESC";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), false,
                        rs.getString("ProductID"));
                Product product = new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getFloat("Price"), rs.getFloat("Discount"), rs.getString("Description"),
                        rs.getString("BrandID"), false, productImage);
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ProductImage getPrimaryImage(String productId) {
        String sql = "select * from ProductImages where ProductID = ? and isPrimary = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            ps.setBoolean(2, true);
            rs = ps.executeQuery();
            if (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), true,
                        rs.getString("ProductID"));
                return productImage;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<ProductImage> getImages(String productId) {
        List<ProductImage> images = new ArrayList<>();
        String sql = "select * from ProductImages where ProductID = ? and isPrimary = 0";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), false,
                        rs.getString("ProductID"));
                images.add(productImage);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return images;
    }

    // Get Porduct By ID
    public Product getProductByID(String proID) {
        String sql = "SELECT * FROM Products p \n"
                + "inner join ProductImages i on p.ProductID = i.ProductID \n"
                + "WHERE i.isPrimary = 1 AND p.isDeleted = 0 and p.ProductID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, proID);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), false,
                        rs.getString("ProductID"));
                Product product = new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getFloat("Price"), rs.getFloat("Discount"), rs.getString("Description"),
                        rs.getString("BrandID"), false, productImage);
                return product;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public Product getProductByID2(String proID) {
        String sql = " Select * from Products\n"
                + " where ProductID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, proID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getString(1), rs.getString(2),
                        rs.getFloat(3), rs.getFloat(4), rs.getString(5), rs.getString(7), rs.getBoolean(6));
                return pro;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public List<Product> getTop4RelatePro(String BrandId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT Top 4 * FROM Products p \n"
                + "                join ProductImages i on p.ProductID = i.ProductID\n"
                + "                WHERE i.isPrimary = 1 AND p.isDeleted = 0 and p.BrandID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, BrandId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), false,
                        rs.getString("ProductID"));
                Product product = new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getFloat("Price"), rs.getFloat("Discount"), rs.getString("Description"),
                        rs.getString("BrandID"), false, productImage);
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public List<Product> getTop8Product() {
        List<Product> products = new ArrayList<>();
        String sql = "select top(8) * from products p inner join ProductImages i on p.ProductID = i.ProductID where p.isDeleted = 0 and i.isPrimary = 1";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), true,
                        rs.getString("ProductID"));
                Product product = new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getFloat("Price"), rs.getFloat("Discount"), rs.getString("Description"),
                        rs.getString("BrandID"), false, productImage);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getNext4Product(int offset) {
        List<Product> products = new ArrayList<>();
        String sql = "select * from products p inner join ProductImages i on p.ProductID = i.ProductID where p.isDeleted = 0 and i.isPrimary = 1 order by p.ProductID offset ? rows FETCH NEXT 4 ROWS ONLY;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, offset);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), true,
                        rs.getString("ProductID"));
                Product product = new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getFloat("Price"), rs.getFloat("Discount"), rs.getString("Description"),
                        rs.getString("BrandID"), false, productImage);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getProductCount() {
        int count = -1;
        String sql = "SELECT COUNT(*) AS ProductCount FROM Products where isDeleted = 0";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("ProductCount");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public List<Product> getTop3BestSeller() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT TOP 3 *\n"
                + "FROM\n"
                + "    Orders od\n"
                + "    INNER JOIN OrderDetails ode ON od.OrderID = ode.OrderID\n"
                + "    INNER JOIN ProductVariants v ON ode.VariantID = v.VariantID\n"
                + "    INNER JOIN Products p ON v.ProductID = p.ProductID\n"
                + "	INNER JOIN ProductImages img on p.ProductID = img.ProductID\n"
                + "WHERE\n"
                + "    od.OrderStatus = 'Accepted'\n"
                + "    AND od.PaymentStatus = 'Paid'\n"
                + "    AND p.isDeleted = 0\n"
                + "    AND v.StockQuantity > 0\n"
                + "	AND img.IsPrimary = 1\n"
                + "ORDER BY Quantity DESC";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), true,
                        rs.getString("ProductID"));
                Product product = new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getFloat("Price"), rs.getFloat("Discount"), rs.getString("Description"),
                        rs.getString("BrandID"), false, productImage);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> searchProductByName(String name) {
        List<Product> products = new ArrayList<>();
        String sql = "select * from Products p\n"
                + "inner join ProductImages i on p.ProductID = i.ProductID\n"
                + "where 1 = 1 and p.isDeleted = 0 and i.IsPrimary = 1";
        if (!name.equals("")) {
            sql += " AND ProductName LIKE '%" + name + "%'";
        }
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage productImage = new ProductImage(rs.getString("ImageID"), rs.getString("ImageURL"), true,
                        rs.getString("ProductID"));
                Product product = new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getFloat("Price"), rs.getFloat("Discount"), rs.getString("Description"),
                        rs.getString("BrandID"), false, productImage);
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return products;
    }

    public boolean isValidProductID(String productID) {
        // Sử dụng biểu thức chính quy để kiểm tra định dạng
        String regex = "^P\\d+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(productID);

        // Kiểm tra nếu chuỗi productID khớp với biểu thức chính quy
        return matcher.matches();
    }

    public boolean checkProNameExit(String proName) {
        String sql = "Select * from Products\n"
                + "where ProductName = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, proName);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    // add new admin
    public boolean addProduct(Product pro) {
        String sql = "INSERT INTO [dbo].[Products] "
                + "([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        ProductDAO d = new ProductDAO();
        BrandDAO br = new BrandDAO();

        try ( PreparedStatement ps = conn.prepareStatement(sql)) {

            if (d.isValidProductID(pro.getProductId()) == false) {
                return false;
            } else {
                ps.setString(1, pro.getProductId());
            }
            if (d.checkProNameExit(pro.getProductName()) || pro.getProductName().trim().equals("")) {
                return false;

            } else {
                ps.setString(2, pro.getProductName());
            }

            if (pro.getPrice() < 1) {
                return false;
            } else {
                ps.setFloat(3, pro.getPrice());
            }

            if (pro.getDiscount() < 0) {
                return false;
            } else {
                ps.setFloat(4, pro.getDiscount());
            }

            ps.setString(5, pro.getDescription());
            ps.setBoolean(6, false);

            // Kiểm tra và gán BrandId
            ps.setString(7, (pro.getBrandId() != null) ? pro.getBrandId() : "default_brand_value");

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public List<Product> getAllProManagement() {
        List<Product> pros = new ArrayList<>();
        String sql = "select * from Products";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getString(1), rs.getString(2),
                        rs.getFloat(3), rs.getFloat(4), rs.getString(5), rs.getString(7), rs.getBoolean(6));
                pros.add(pro);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());

        }

        return pros;
    }

    public List<String> getAllProID() {
        List<String> productIDs = new ArrayList<>();
        String sql = "SELECT ProductID FROM Products";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("ProductID");
                productIDs.add(productID);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return productIDs;
    }

    public boolean softDeletePro(String proID) {
        String sql = " Update Products \n"
                + " set isDeleted = 1\n"
                + " where ProductID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, proID);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public boolean UpdateProduct(Product pro) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET \n"
                + "      [ProductName] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Discount] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[isDeleted] = ?\n"
                + "      ,[BrandID] = ?\n"
                + " WHERE [ProductID] = ? ";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, pro.getProductName());
            ps.setFloat(2, pro.getPrice());
            ps.setFloat(3, pro.getDiscount());
            ps.setString(4, pro.getDescription());
            ps.setBoolean(5, pro.getIsDelete());
            ps.setString(6, pro.getBrandId());
            ps.setString(7, pro.getProductId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public int updateProductbyBrandID(String brandID) {
        int count = 0;
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [BrandID] = NULL\n"
                + " WHERE BrandID  = ?";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, brandID);
            count = st.executeUpdate();
        } catch (SQLException e) {
        }
        return count;
    }

    public static void main(String[] args) {
        ProductDAO d = new ProductDAO();
        String proID = "P2";
        if (d.softDeletePro(proID)) {
            System.out.println("success");
        } else {
            System.out.println("false");
        }
    }

}