package DAOs;

import DBConnection.DBConnection;
import Models.Customer;
import Utils.MD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.*;

/**
 *
 * @author Duy
 */
public class CustomerDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CustomerDAO() {
        conn = DBConnection.getConnection();
    }

    public Customer checkGoogleLogin(String socialId) {
        String sql = "select * from Customers where SocialID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, socialId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
                        rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), socialId,
                        rs.getString("PhoneNumber"));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Customer checkLogin(String username, String password) {
        String sql = "select * from Customers where UserName = ? and Password = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, MD5.getMd5(password));
            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getString("UserName"), rs.getString("Password"));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean checkLUserLogin(String username, String password) {
        // Check username length between 6 and 30 characters
        if (username.length() < 6 || username.length() > 30) {
            System.out.println("Username must be from 6 to 30 character");
            return false;
        }


   
        // Check password length and requirements
        if (password.length() < 8) {
            System.out.println("Password must be larger or equal than 8 character");
            return false;
        }

        String sql = "select * from Customers where UserName = ? and Password = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, MD5.getMd5(password));
            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getString("UserName"), rs.getString("Password"));
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Customer> getAllCustomer() {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT [CustomerID]\n"
                + "      ,[UserName]\n"
                + "      ,[Password]\n"
                + "      ,[Email]\n"
                + "      ,[FullName]\n"
                + "      ,[PhoneNumber]\n"
                + "  FROM [dbo].[Customers]";
        try {
            // Đảm bảo cSonnection đã được khởi tạo và mở
            if (conn != null && !conn.isClosed()) {
                PreparedStatement st = conn.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), rs.getString("PhoneNumber"));
                    list.add(customer);
                }
            } else {
                System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int add(Customer customer) {
        int count = 0;
        String sql = "insert into customers values(?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer.getCustomerId());
            ps.setString(2, customer.getUsername());
            ps.setString(3, MD5.getMd5(customer.getPassword()));
            ps.setString(4, customer.getEmail());
            ps.setString(5, customer.getFullname());
            ps.setString(6, customer.getSocialId());
            ps.setString(7, customer.getPhoneNumber());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int addCustomerWithoutSociaiid(Customer customer) {
        int count = 0;
        String sql = "INSERT INTO [dbo].[Customers]\n"
                + "           ([CustomerID]\n"
                + "           ,[UserName]\n"
                + "           ,[Password]\n"
                + "           ,[Email]\n"
                + "           ,[FullName]\n"
                + "           ,[PhoneNumber])\n"
                + "     VALUES(?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer.getCustomerId());
            ps.setString(2, customer.getUsername());
            ps.setString(3, MD5.getMd5(customer.getPassword()));
            ps.setString(4, customer.getEmail());
            ps.setString(5, customer.getFullname());
            ps.setString(6, customer.getPhoneNumber());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Customer getByEmail(String email) {
        String sql = "select * from Customers where email = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
                        rs.getString("Password"), email, rs.getString("FullName"), rs.getString("SocialID"),
                        rs.getString("PhoneNumber"));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getCustomerCount() {
        int count = -1;
        String sql = "SELECT COUNT(*) AS CustomerCount FROM customers";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("CustomerCount");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Customer getCustomerByPhoneNumber(String phoneNumber) {
        String sql = "select * from Customers where PhoneNumber = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, phoneNumber);
            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
                        rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), rs.getString("SocialID"), phoneNumber);
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int update(Customer customer) {
        int count = 0;
        String sql = "update Customers set UserName = ?, Password = ?, Email = ?, FullName = ?, SocialID =? where CustomerID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer.getUsername());
            ps.setString(2, MD5.getMd5(customer.getPassword()));
            ps.setString(3, customer.getEmail());
            ps.setString(4, customer.getFullname());
            ps.setString(5, customer.getSocialId());
            ps.setString(6, customer.getCustomerId());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int updateCustomerWithoutPassword(Customer customer) {
        int count = 0;
        String sql = "update Customers set UserName = ?, Email = ?, FullName = ?, PhoneNumber = ? where CustomerID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer.getUsername());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getFullname());
            ps.setString(4, customer.getPhoneNumber());
            ps.setString(5, customer.getCustomerId());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int updateCustomerwithoutSociaID(Customer customer) {
        int count = 0;
        String sql = "update Customers set UserName = ?, Password = ?, Email = ?, FullName = ?, PhoneNumber = ? where CustomerID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer.getUsername());
            ps.setString(2, MD5.getMd5(customer.getPassword()));
            ps.setString(3, customer.getEmail());
            ps.setString(4, customer.getFullname());
            ps.setString(5, customer.getPhoneNumber());
            ps.setString(6, customer.getCustomerId());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    // get Admins by ID

    // get Admins by ID
    public Customer getCustomerById(String id) {
        String sql = "Select * from Customers where CustomerID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
                        rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"),
                        rs.getString("SocialID"), rs.getString("PhoneNumber"));
                return customer;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer getCustomerByUsername(String username) {
        String sql = "Select * from Customers where UserName = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
                        rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"),
                        rs.getString("SocialID"), rs.getString("PhoneNumber"));
                return customer;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer customerExist(String email, String username, String phoneNumber) {
        String sql = "select * from Customers where Email = ? or UserName = ? or PhoneNumber = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, username);
            ps.setString(3, phoneNumber);
            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getString("CustomerID"), rs.getString("UserName"),
                        rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"),
                        rs.getString("SocialID"), rs.getString("PhoneNumber"));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Boolean checkCustomerInforExist(String email, String username, String phoneNumber) {
        String sql = "select * from Customers where Email = ? or UserName = ? or PhoneNumber = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, username);
            ps.setString(3, phoneNumber);
            rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"));
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int delete(String customerId) {
        int ketqua = 0;
        String sql = "DELETE FROM [dbo].[Customers]\n"
                + "      WHERE CustomerID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, customerId);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public List<String> getAllCusID() {
        List<String> CusIDs = new ArrayList<>();
        String sql = "Select CustomerID from Customers ";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String cusId = rs.getString("CustomerID");
                CusIDs.add(cusId);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return CusIDs;
    }

    public static void main(String[] args) {
        String userName = "Phucdt1123";
        String password = "12345678";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkLUserLogin(userName, password);
        System.out.println(res);
    }
}
