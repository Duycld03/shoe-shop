package DAOs;

import DBConnection.DBConnection;
import Models.Product;
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
public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public ProductDAO() {
		conn = DBConnection.getConnection();
	}

	public ResultSet getAll() {
		String sql = "select * from ProductVariants";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
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
			return products;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
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
}
