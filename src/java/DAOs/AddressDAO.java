/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Address;
import Models.Brand;
import Utils.MD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.jakartaee.EESpecProfile;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class AddressDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public AddressDAO() {
		conn = DBConnection.getConnection();
	}

	// read all from admins
	public List<Address> getAddressAdmins() {
		List<Address> list = new ArrayList<>();
		String sql = "Select * from Addresses";
		try {
			// Đảm bảo cSonnection đã được khởi tạo và mở
			if (conn != null && !conn.isClosed()) {
				PreparedStatement st = conn.prepareStatement(sql);
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
					Address address = new Address(rs.getString("AddressID"),
							rs.getString("City"), rs.getString("addressDetail"),
							rs.getString("CustomerID"), rs.getBoolean("isPrimary"));
					list.add(address);
				}
			} else {
				System.out.println("Kết nối đến cơ sở dữ liệu không hợp lệ.");
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return list;
	}

	// get Admins by ID
	public Address getAddressByCusId(String id) {
		String sql = "Select * from Addresses where CustomerID = ? and isPrimary = 1";
		try {
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				Address address = new Address(rs.getString("AddressID"),
						rs.getString("City"), rs.getString("AddressDetail"),
						rs.getString("CustomerID"), rs.getBoolean("isPrimary"));
				return address;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getAddressCount() {
		int count = -1;
		String sql = "SELECT COUNT(*) AS addressCount FROM Addresses";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt("addressCount");
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return count;
	}

	public int add(Address address) {
		int count = 0;
		String sql = "insert into Addresses values(?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, address.getAddressId());
			ps.setString(2, address.getCity());
			ps.setString(3, address.getAddressDetail());
			ps.setBoolean(4, address.isPrimary());
			ps.setString(5, address.getCustomerId());
			count = ps.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return count;
	}

	// Delect Address
	public int deleteByCusID(String CusID) {
		int result = 0;
		String sql = "DELETE FROM [dbo].[Addresses]\n"
				+ "      WHERE CustomerID = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, CusID);
			result = ps.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return result;
	}

	public int deleteById(String addressId) {
		int result = 0;
		String sql = "DELETE FROM [dbo].[Addresses]\n"
				+ "      WHERE AddressID = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, addressId);
			result = ps.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return result;
	}

	// add Address
	public int addAddress(Address address) {
		int result = 0;
		String sql = "INSERT INTO [dbo].[Addresses]\n"
				+ "           ([AddressID]\n"
				+ "           ,[City]\n"
				+ "           ,[addressDetail]\n"
				+ "           ,[isPrimary]\n"
				+ "           ,[CustomerID])\n"
				+ "     VALUES\n"
				+ "           (?,?,?,?,?)";
		try {
			PreparedStatement st = conn.prepareCall(sql);
			st.setString(1, address.getAddressId());
			st.setString(2, address.getCity());
			st.setString(3, address.getAddressDetail());
			st.setBoolean(4, address.isPrimary());
			st.setString(5, address.getCustomerId());
			result = st.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return result;
	}

	public int updateAddressbyCustomerID(String customerID) {
		int count = 0;
		String sql = "UPDATE [dbo].[Addresses]\n"
				+ "   SET [CustomerID] = NULL\n"
				+ " WHERE CustomerID  = ?";
		try {
			PreparedStatement st = conn.prepareCall(sql);
			st.setString(1, customerID);
			count = st.executeUpdate();
		} catch (SQLException e) {
		}
		return count;
	}

	public int removePrimaryByCustomerId(String customerID) {
		int count = 0;
		String sql = "UPDATE [dbo].[Addresses]\n"
				+ "   SET [isPrimary] = 0\n"
				+ " WHERE CustomerID  = ?";
		try {
			PreparedStatement st = conn.prepareCall(sql);
			st.setString(1, customerID);
			count = st.executeUpdate();
		} catch (SQLException e) {
		}
		return count;
	}

	public int setPrimaryByAddressId(String addressId) {
		int count = 0;
		String sql = "UPDATE [dbo].[Addresses]\n"
				+ "   SET [isPrimary] = 1\n"
				+ " WHERE AddressID  = ?";
		try {
			PreparedStatement st = conn.prepareCall(sql);
			st.setString(1, addressId);
			count = st.executeUpdate();
		} catch (SQLException e) {
		}
		return count;
	}

	public List<Address> getAddressesByCusId(String id) {
		List<Address> addresses = new ArrayList<>();
		String sql = "Select * from Addresses where CustomerID = ?";
		try {
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Address address = new Address(rs.getString("AddressID"),
						rs.getString("City"), rs.getString("AddressDetail"),
						rs.getString("CustomerID"), rs.getBoolean("isPrimary"));
				addresses.add(address);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return addresses;
	}

	public List<String> getAllAddressID() {
		List<String> addressIDs = new ArrayList<>();
		String sql = "select AddressID from Addresses";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				String address = rs.getString("AddressID");
				addressIDs.add(address);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return addressIDs;
	}

	public int updateAddress(Address address) {
		int count = 0;
		String sql = "UPDATE [dbo].[Addresses]\n"
				+ "   SET [City] = ?\n"
				+ "      ,[addressDetail] = ?\n"
				+ "      ,[isPrimary] = ?\n"
				+ "      ,[CustomerID] = ?\n"
				+ " WHERE AddressID = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, address.getCity());
			ps.setString(2, address.getAddressDetail());
			ps.setBoolean(3, address.isPrimary());
			ps.setString(4, address.getCustomerId());
			ps.setString(5, address.getAddressId());
			count = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return count;
	}

	public Address getAddressById(String addressId) {
		String sql = "Select * from Addresses where AddressID = ?";
		try {
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, addressId);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				Address address = new Address(rs.getString("AddressID"),
						rs.getString("City"), rs.getString("AddressDetail"),
						rs.getString("CustomerID"), rs.getBoolean("isPrimary"));
				return address;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public static void main(String[] args) {
		AddressDAO d = new AddressDAO();
		List<Address> da = d.getAddressAdmins();
		for (Address address : da) {
			System.out.println(address.getAddressDetail());
		}

	}

}
