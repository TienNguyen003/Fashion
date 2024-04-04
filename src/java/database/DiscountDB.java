/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Discount;

/**
 *
 * @author Admin
 */
public class DiscountDB {
    // lấy ma giam gia
    public static List<Discount> getAll() {
        List<Discount> list = new ArrayList<>();
        String str = "SELECT * FROM `discount`";
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                Discount d = new Discount();
                d.setId(rs.getInt("id"));
                d.setDscPer(rs.getInt("dscPer"));
                d.setDscCode(rs.getString("dscCode"));
                d.setQuantity(rs.getInt("quantity"));
                d.setStart(rs.getString("start"));
                d.setEnd(rs.getString("end"));
                list.add(d);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }
}
