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
    private static String password = "12345";
=======
	private static String server = "localhost";
	private static String port = "1433";
	private static String database = "ShoeStoreManagement";
	private static String user = "sa";
	private static String password = "todohongy14";
>>>>>>> 3bc8fdbeb19cf6fefe25a86403faf516d538d5e1

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
