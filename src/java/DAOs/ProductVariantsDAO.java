/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Product;
import Models.ProductVariant;
import Models.ProductImage;
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
public class ProductVariantsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public ProductVariantsDAO() {
		conn = DBConnection.getConnection();
	}

	public ResultSet getAll() {
		String sql = "Select * from ProductVariants";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public List<ProductVariant> getAllVariants() {
		List<ProductVariant> vars = new ArrayList<>();
		String sql = "Select * from ProductVariants";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductVariant var = new ProductVariant(rs.getString("VariantID"), rs.getString("Color"),
						rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getString("ProductID"));
				vars.add(var);
			}
			return vars;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public List<ProductVariant> getVariantByProID(String ID) {
		List<ProductVariant> vars = new ArrayList<>();
		String sql = "Select * from ProductVariants where ProductID = ? and isDelete = 0 ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ID);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductVariant var = new ProductVariant(rs.getString("VariantID"), rs.getString("Color"),
						rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getString("ProductID"),
						rs.getBoolean("isDelete"));
				vars.add(var);
			}
			return vars;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public List<ProductVariant> getVariantByProID2(String ID) {
		List<ProductVariant> vars = new ArrayList<>();
		String sql = "Select * from ProductVariants where ProductID = ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ID);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductVariant var = new ProductVariant(rs.getString("VariantID"), rs.getString("Color"),
						rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getString("ProductID"),
						rs.getBoolean("isDelete"));
				vars.add(var);
			}
			return vars;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public ProductVariant getSumVariantByProID(String proID) {
		String sql = "SELECT SUM(v.StockQuantity) AS NumberOfProduct, v.ProductID FROM ProductVariants v\n"
				+ "WHERE v.ProductID = ?\n"
				+ "GROUP BY v.ProductID";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, proID);
			rs = ps.executeQuery();
			if (rs.next()) {
				ProductVariant var = new ProductVariant(rs.getString("ProductID"), rs.getInt("NumberOfProduct"));
				return var;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	// Delect Product Variant
	public int delectVariantByProID(String ProductID) {
		int result = 0;
		String sql = "DELETE FROM [dbo].[ProductVariants]\n"
				+ "      WHERE ProductID = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ProductID);
			result = ps.executeUpdate();

		} catch (SQLException ex) {
			Logger.getLogger(CartDAO.class
					.getName()).log(Level.SEVERE, null, ex);
		}
		return result;
	}

	// add new admin
	public boolean addVariant(ProductVariant pro) {
		String sql = "INSERT INTO [dbo].[ProductVariants]\n"
				+ "           ([VariantID]\n"
				+ "           ,[Size]\n"
				+ "           ,[Color]\n"
				+ "           ,[StockQuantity]\n"
				+ "           ,[isDelete]\n"
				+ "           ,[ProductID])\n"
				+ "     VALUES\n"
				+ "           (?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pro.getVariantId()); // Assuming getVariantID() returns the VariantID
			ps.setInt(2, pro.getSize());
			ps.setString(3, pro.getColor());
			ps.setInt(4, pro.getStockQuantity());
			ps.setBoolean(5, pro.isDelete());
			ps.setString(6, pro.getProductId());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return false; // Consider returning false in case of an exception
	}

	public List<String> getAllVarinatID() {
		List<String> variantIDs = new ArrayList();
		String sql = "select VariantID from ProductVariants";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				String varID = rs.getString(1);
				variantIDs.add(varID);
			}
		} catch (Exception e) {
		}
		return variantIDs;
	}

	public String checkVariantExit(String Color, int Size, String ProID) {
		String sql = "select VariantID from ProductVariants where ProductID = ? and Color = ? and size = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ProID);
			ps.setString(2, Color);
			ps.setInt(3, Size);
			rs = ps.executeQuery();
			if (rs.next()) {
				String variantID = rs.getString(1);
				return variantID;
			}
		} catch (Exception e) {
		}
		return null;
	}

	public boolean UpdateVariant(ProductVariant var) {
		String sql = "UPDATE [dbo].[ProductVariants]\n"
				+ "SET [Size] = ?\n"
				+ "   ,[Color] = ?\n"
				+ "   ,[StockQuantity] = ?\n"
				+ "   ,[isDelete] = ?\n"
				+ "   ,[ProductID] = ?\n"
				+ "WHERE [VariantID] = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, var.getSize());
			ps.setString(2, var.getColor());
			ps.setInt(3, var.getStockQuantity());
			ps.setBoolean(4, var.isDelete());
			ps.setString(5, var.getProductId());
			ps.setString(6, var.getVariantId());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// Log or print the exception message for debugging purposes
			System.out.println(e.getMessage());
		}
		return false;
	}

	public boolean UpdateStockVar(String varID, int newStock) {
		String sql = "Update ProductVariants\n"
				+ "set StockQuantity = ?\n"
				+ "where VariantID = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, newStock);
			ps.setString(2, varID);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	public boolean softDeleteVariant(String varID) {
		String sql = "UPDATE ProductVariants SET isDelete = 1 WHERE VariantID = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, varID);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false; // Trả về false nếu có lỗi
		}
		return true;
	}

	public ProductVariant getVariantByID(String VarId) {
		String sql = "select * from ProductVariants where VariantID = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, VarId);
			rs = ps.executeQuery();
			if (rs.next()) {
				ProductVariant var = new ProductVariant(rs.getString("VariantID"), rs.getString("Color"),
						rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getString("ProductID"),
						rs.getBoolean("isDelete"));
				return var;
			}
		} catch (Exception e) {
		}
		return null;
	}

	public static void main(String[] args) {
		ProductVariantsDAO dao = new ProductVariantsDAO();
		ProductVariant var = new ProductVariant("Var222", "red", 20, 20, "P1", false);
		if (dao.addVariant(var)) {
			System.out.println("success");
		} else {
			System.out.println("failed");
		}
	}

}
