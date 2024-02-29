package DAOs;

import DBConnection.DBConnection;
import Models.Staff;
import Utils.MD5;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class StaffDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public StaffDAO() {
		conn = DBConnection.getConnection();
	}

	public Staff checkLogin(String username, String password) {
		String sql = "select * from Staffs where UserName = ? and Password = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, MD5.getMd5(password));
			rs = ps.executeQuery();
			if (rs.next()) {
				Staff staff = new Staff(rs.getString("StaffID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), rs.getString("PhoneNumber"));
				return staff;
			}
		} catch (SQLException ex) {
			Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	//read all from staff
	public List<Staff> getAllStaff() {
		List<Staff> list = new ArrayList<>();
		String sql = "SELECT [StaffID]\n"
				+ "      ,[UserName]\n"
				+ "      ,[Password]\n"
				+ "      ,[Email]\n"
				+ "      ,[FullName]\n"
				+ "      ,[PhoneNumber]\n"
				+ "  FROM [dbo].[Staffs]";
		try {
			// Đảm bảo cSonnection đã được khởi tạo và mở
			if (conn != null && !conn.isClosed()) {
				PreparedStatement st = conn.prepareStatement(sql);
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
					Staff staff = new Staff(rs.getString("StaffID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), rs.getString("PhoneNumber"));
					list.add(staff);
				}
			} else {
				System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
			}
		} catch (SQLException ex) {
			Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return list;
	}

	//getStaffByid
	public Staff getStaffById(String id) {
		String sql = "SELECT [StaffID]\n"
				+ "      ,[UserName]\n"
				+ "      ,[Password]\n"
				+ "      ,[Email]\n"
				+ "      ,[FullName]\n"
				+ "      ,[PhoneNumber]\n"
				+ "  FROM [dbo].[Staffs]\n"
				+ "  where StaffID = ?";
		try {
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				Staff c = new Staff(rs.getString("StaffID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), rs.getString("PhoneNumber"));
				return c;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//add new staff
	public void addStaff(Staff staff) {
		String sql = "INSERT INTO [dbo].[Staffs]\n"
				+ "           ([StaffID]\n"
				+ "           ,[UserName]\n"
				+ "           ,[Password]\n"
				+ "           ,[Email]\n"
				+ "           ,[FullName]\n"
				+ "           ,[PhoneNumber])\n"
				+ "     VALUES\n"
				+ "           (?,?,?,?,?,?)";
		try {
			PreparedStatement st = conn.prepareCall(sql);
			st.setString(1, staff.getStaffId());
			st.setString(2, staff.getUsername());
			st.setString(3, MD5.getMd5(staff.getPassword()));
			st.setString(4, staff.getEmail());
			st.setString(5, staff.getFullname());
			st.setString(6, staff.getPhoneNumber());
			st.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public int add(Staff staff) {
		int count = 0;
		String sql = "INSERT INTO [dbo].[Staffs]\n"
				+ "           ([StaffID]\n"
				+ "           ,[UserName]\n"
				+ "           ,[Password]\n"
				+ "           ,[Email]\n"
				+ "           ,[FullName]\n"
				+ "           ,[PhoneNumber])\n"
				+ "     VALUES\n"
				+ "           (?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, staff.getStaffId());
			ps.setString(2, staff.getUsername());
			ps.setString(3, MD5.getMd5(staff.getPassword()));
			ps.setString(4, staff.getEmail());
			ps.setString(5, staff.getFullname());
			ps.setString(6, staff.getPhoneNumber());
			count = ps.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return count;
	}

	//delete staff
//    public void deleteStaff(String id) {
//        String sql = "DELETE FROM [dbo].[Staffs]\n"
//                + "      WHERE StaffID = ?";
//        try {
//            PreparedStatement st = conn.prepareStatement(sql);
//            st.setString(1, id);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
	public int delete(String staffId) {
		int ketqua = 0;
		String sql = "DELETE FROM [dbo].[Staffs]\n"
				+ "      WHERE StaffID = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, staffId);
			ketqua = ps.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return ketqua;
	}

	//update staff
	public void updateStaff(Staff c) {
		String sql = "UPDATE [dbo].[Staffs]\n"
				+ "   SET [UserName] = ?\n"
				+ "      ,[Password] = ?\n"
				+ "      ,[Email] = ?\n"
				+ "      ,[FullName] = ?\n"
				+ "      ,[PhoneNumber] = ?\n"
				+ " WHERE StaffID = ?";
		try {
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, c.getUsername());
			st.setString(2, MD5.getMd5(c.getPassword()));
			st.setString(3, c.getEmail());
			st.setString(4, c.getFullname());
			st.setString(5, c.getPhoneNumber());
			st.setString(6, c.getStaffId());
			st.executeUpdate();
		} catch (SQLException e) {
		}
	}

	public int update(Staff staff) {
		int count = 0;
		String sql = "UPDATE [dbo].[Staffs]\n"
				+ "   SET [UserName] = ?\n"
				+ "      ,[Password] = ?\n"
				+ "      ,[Email] = ?\n"
				+ "      ,[FullName] = ?\n"
				+ "      ,[PhoneNumber] = ?\n"
				+ " WHERE StaffID = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, staff.getUsername());
			ps.setString(2, staff.getPassword());
			ps.setString(3, staff.getEmail());
			ps.setString(4, staff.getFullname());
			ps.setString(5, staff.getPhoneNumber());
			ps.setString(6, staff.getStaffId());
			count = ps.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return count;
	}

	public int getStaffCount() {
		int count = -1;
		String sql = "SELECT COUNT(*) AS StaffCount FROM Staffs";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt("StaffCount");
			}
		} catch (SQLException ex) {
			Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return count;
	}

	public Staff getStaffByUsername(String username) {
		String sql = "Select * from Staffs where UserName = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				Staff staff = new Staff(rs.getString("StaffID"), rs.getString("UserName"), rs.getString("Password"), rs.getString("Email"), rs.getString("FullName"), rs.getString("PhoneNumber"));
				return staff;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public static void main(String[] args) {
		//test add
		// Tạo một đối tượng StaffDAO
//        StaffDAO staffDAO = new StaffDAO();
//
//        // Tạo một đối tượng Staff để thêm vào cơ sở dữ liệu
//        Staff staff = new Staff();
//        staff.setStaffId("S001");
//        staff.setUsername("john_doe");
//        staff.setPassword("password123");
//        staff.setEmail("john.doe@example.com");
//        staff.setFullname("John Doe");
//        staff.setPhoneNumber("123456789");
//
//        // Gọi phương thức addStaff
//        int result = staffDAO.add(staff);
//
//        // Kiểm tra kết quả
//        if (result > 0) {
//            System.out.println("Thêm nhân viên thành công!");
//        } else {
//            System.out.println("Thêm nhân viên thất bại!");
//        }
		StaffDAO a = new StaffDAO();
		List<Staff> l = a.getAllStaff();
		System.out.println(l.get(0).getStaffId());
	}

}
