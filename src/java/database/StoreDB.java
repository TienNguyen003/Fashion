/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Store;

/**
 *
 * @author Admin
 */
public class StoreDB {
    // lay 1 cua hang
    public static Store getProducts(String username) {
        Store s = new Store();
        String str = "SELECT * FROM store WHERE own='" + username + "'";
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setOwn(rs.getString("own"));
                s.setName(rs.getString("name"));
            }
            ps.close();
        } catch (SQLException e) {
        }
        return s;
    }
}
