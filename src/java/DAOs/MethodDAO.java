/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.PaymentMethod;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class MethodDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public List<PaymentMethod> getAllMethod() {

        List<PaymentMethod> methods = new ArrayList<>();
        String sql = "Select * from PaymentMethods";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                PaymentMethod method = new PaymentMethod(rs.getString("MethodID"), "MethodName");
                methods.add(method);

            }
        } catch (Exception e) {
        }
        return methods;
    }

    public PaymentMethod getMethodByName(String name) {
        String sql = "Select * from PaymentMethods\n"
                + "where MethodName = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                PaymentMethod method = new PaymentMethod(rs.getString("MethodID"), "MethodName");
                return method;

            }
        } catch (Exception e) {
        }
        return null;
    }

}
