package DAOs;

import DBConnection.DBConnection;
import Models.Brand;
import Utils.MD5;
import com.sun.swing.internal.plaf.basic.resources.basic;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author To Do Hong Y - CE171148
 */
public class BrandDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public BrandDAO() {
        conn = DBConnection.getConnection();
    }

    //read all from brand
    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT [BrandID]\n"
                + "      ,[BrandName]\n"
                + "  FROM [dbo].[Brands]";
        try {
            // Đảm bảo cSonnection đã được khởi tạo và mở
            if (conn != null && !conn.isClosed()) {
                PreparedStatement st = conn.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Brand brand = new Brand(rs.getString("BrandID"), rs.getString("BrandName"));
                    list.add(brand);
                }
            } else {
                System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //getBrandByid  
    public Brand getBrandById(String id) {
        String sql = "SELECT [BrandID]\n"
                + "      ,[BrandName]\n"
                + "  FROM [dbo].[Brands]\n"
                + "  where BrandID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Brand brand = new Brand(rs.getString("BrandID"), rs.getString("BrandName"));
                return brand;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    //add new brand
    public int addBrand(Brand brand) {
        int result = 0;
        String sql = "INSERT INTO [dbo].[Brands]\n"
                + "           ([BrandID]\n"
                + "           ,[BrandName])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, brand.getBrandId());
            st.setString(2, brand.getBrandName());

            result = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }

    //delete brand
    public int delete(String id) {
        int result = 0;
        String sql = "DELETE FROM [dbo].[Brands]\n"
                + "      WHERE BrandID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }

    //update brand
    public int updateBrand(Brand brand) {
        int result = 0;
        String sql = "UPDATE [dbo].[Brands]\n"
                + "   SET [BrandName] = ?\n"
                + " WHERE BrandID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, brand.getBrandName());
            st.setString(2, brand.getBrandId());
            result = st.executeUpdate();
        } catch (SQLException e) {
        }
        return result;
    }

    public int getBrandCount() {
        int count = -1;
        String sql = "SELECT COUNT(*) AS BrandCount FROM Brands";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("BrandCount");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Brand getBrandByBrandName(String bname) {
        String sql = "SELECT [BrandID]\n"
                + "      ,[BrandName]\n"
                + "  FROM [dbo].[Brands]\n"
                + "  where BrandName = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, bname);
            rs = ps.executeQuery();
            if (rs.next()) {
                Brand brand = new Brand(rs.getString("BrandID"), rs.getString("BrandName"));
                return brand;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<String> getAllBrandID() {
        List<String> brandIDs = new ArrayList<>();
        String sql = "SELECT BrandID FROM Brands";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String brandID = rs.getString("BrandID");
                brandIDs.add(brandID);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return brandIDs;
    }

    public static void main(String[] args) {
        BrandDAO a = new BrandDAO();
        List<String> l = a.getAllBrandID();
        for (String string : l) { 
            System.out.println(string);
        }
    }
}