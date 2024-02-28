/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Address;
import Utils.MD5;
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
 * @author Doan Thanh Phuc - CE170580
 */
public class AddressDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public AddressDAO() {
		conn = DBConnection.getConnection();
	}

	//read all from admins
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

	//get Admins by ID
	public Address getAddressnByCusId(String id) {
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
}
