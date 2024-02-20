package DAOs;

import DBConnection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	public ResultSet getTop3DiscountedProduct() {
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
}
