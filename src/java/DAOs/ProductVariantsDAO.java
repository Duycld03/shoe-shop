/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
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
        String sql = "Select * from ProductVariants where ProductID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, ID);
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

    public static void main(String[] args) {
        ProductVariantsDAO d = new ProductVariantsDAO();
        List<ProductVariant> list = d.getVariantByProID("P1");
        for (ProductVariant p : list) {
            System.out.println(p.getVariantId());
        }
    }
}
