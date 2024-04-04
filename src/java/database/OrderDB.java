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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order_product;

/**
 *
 * @author Admin
 */
public class OrderDB {

    // lấy tất cả các sản phẩm
    public static List<Order_product> getAll() {
        List<Order_product> list = new ArrayList<>();
        String str = "SELECT * FROM `order_product`";
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                Order_product p = new Order_product();
                p.setIdOrder(rs.getInt("Id_order"));
                p.setUsername(rs.getString("username"));
                p.setList_id(rs.getString("list_id_product"));
                p.setList_name(rs.getString("list_name_product"));
                p.setTotal_quantity(rs.getString("toatl_quantity"));
                p.setTotal_amount(rs.getString("total_amount"));
                p.setImage(rs.getString("image"));
                p.setDes(rs.getString("des"));
                list.add(p);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }

    // lay sp theo username
    public static List<Order_product> getProducts(String userId) {
        List<Order_product> list = new ArrayList<>();
        String str = "SELECT * FROM order_product WHERE username = '"+userId+"'";
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order_product p = new Order_product();
                p.setShop(rs.getString("shop"));
                p.setUsername(userId);                
                p.setIdOrder(rs.getInt("Id_order"));
                p.setUsername(rs.getString("username"));
                p.setList_id(rs.getString("list_id_product"));
                p.setList_name(rs.getString("list_name_product"));
                p.setTotal_quantity(rs.getString("toatl_quantity"));
                p.setTotal_amount(rs.getString("total_amount"));
                p.setImage(rs.getString("image"));
                p.setDes(rs.getString("des"));
                list.add(p);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }

    // ham delete
    public void deleteSP(String username, String idProduct) {
        Connection connection = Util.getConnection();
        String sql = "DELETE FROM order_product WHERE username = '"+username+"' AND list_id_product = '"+idProduct+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();            
        } catch (SQLException e) {
        }
    }

    // ham insert
    public void insertSP(String username, String list_id_product, String shop, String list_name_product, String toatl_quantity, String total_amount, String image, String des) {
        Connection connection = Util.getConnection();
        String sql = "INSERT INTO order_product(username, list_id_product, shop, list_name_product, toatl_quantity, total_amount, image, des) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, list_id_product);
            ps.setString(3, shop);
            ps.setString(4, list_name_product);
            ps.setString(5, toatl_quantity);
            ps.setString(6, total_amount);
            ps.setString(7, image);
            ps.setString(8, des);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    // ham update
    public void updateSP(String username, String list_id_product, String toatl_quantity, String total_amount) {
        Connection connection = Util.getConnection();
        String sql = "UPDATE order_product SET toatl_quantity=?, total_amount=? WHERE username=? AND list_id_product=? ";
        try (
            PreparedStatement insertStatement = connection.prepareStatement(sql)) {
            insertStatement.setString(1, toatl_quantity);
            insertStatement.setString(2, total_amount);
            insertStatement.setString(3, username);
            insertStatement.setString(4, list_id_product);
            insertStatement.executeUpdate();
            insertStatement.close();
        } catch (SQLException e) {
        }
    }
    
    // dem san pham cua user
    public int countProUser(String id){
        int i = 0;
        Connection connection = Util.getConnection();
        String sql = "SELECT COUNT(*) as total FROM `order_product` WHERE username = '"+id+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                i = resultSet.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
}
