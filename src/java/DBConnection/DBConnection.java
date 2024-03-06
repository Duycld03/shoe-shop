package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {

    private static String server = "localhost";
    private static String port = "1433";
    private static String database = "ShoeStoreManagementTest";
    private static String user = "sa";
    private static String password = "123456";

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
