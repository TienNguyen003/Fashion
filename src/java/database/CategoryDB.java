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
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDB {
    public static List<Category> getAll(int stt) {
        List<Category> list = new ArrayList<>();
        String str = "SELECT * FROM `category` WHERE status = '" +stt+"'";
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setCreateBy(rs.getString("createBy"));
                c.setCreateDate(rs.getDate("createDate"));
                c.setStatus(rs.getInt("status"));
                list.add(c);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }
}
