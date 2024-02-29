package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {

<<<<<<< HEAD
	private static String server = "localhost";
	private static String port = "1433";
	private static String database = "ShoeStoreManagement";
	private static String user = "sa";
	private static String password = "123456";


=======
	private static final String server = "localhost";
	private static final String port = "1433";
	private static final String database = "ShoeStoreManagement";
	private static final String user = "sa";
	private static final String password = "123";
>>>>>>> b86d6d84ba2b95a1613cccae59d776024d26ca60

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			try {
				conn = DriverManager.getConnection("jdbc:sqlserver://" + server + ":" + port
						+ ";databaseName=" + database + ";user=" + user + ";password=" + password
						+ ";encrypt=true;trustServerCertificate=true;");
			} catch (SQLException ex) {
				Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
			}
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
		}

		return conn;
	}
}
