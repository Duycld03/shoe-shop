package DAOs;

import DBConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
