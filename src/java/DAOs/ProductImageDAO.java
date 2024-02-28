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
}
