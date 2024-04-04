/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Products;

/**
 *
 * @author Admin
 */
public class ProductDB {

    public static List<Products> getAllProducts(int slPro, String sxPro) {
        List<Products> list = new ArrayList<>();
        String str = "SELECT * FROM `fashion`";
        Connection connection = Util.getConnection();
        if (slPro > 0 && (sxPro.length() == 0)) {
            str += "LIMIT " + slPro;
        } else if (sxPro.length() > 0 && slPro == 0) {
            str += "ORDER BY " + sxPro;
        } else if (slPro > 0 && sxPro.length() > 0) {
            str += "ORDER BY " + sxPro + " LIMIT " + slPro;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setDes(rs.getString("des"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setDiscount(rs.getFloat("discount"));
                p.setType(rs.getString("type"));
                p.setQuantity(rs.getInt("quantity"));
                p.setStore(rs.getInt("store"));
                list.add(p);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }

    // lấy tất cả các sản phẩm theo kieu type (lay ra all tuong tu)
    public static List<Products> getAll(String type) {
        List<Products> list = new ArrayList<>();
        String str = "SELECT * FROM `fashion` WHERE type = ?";
        // connection : thiết lập kết nối đến CSDL
        Connection connection = Util.getConnection();
        try {
            // dùng để thực thi các câu lệnh truy vấn SQL trong JDBC
            PreparedStatement ps = connection.prepareStatement(str);
            if (type.equals("")) {
                ps.setString(1, "1");
            } else {
                ps.setString(1, type);
            }
            // duyệt và truy xuất dữ liệu từ tập kết quả trả về
            ResultSet rs = ps.executeQuery(); // executeQuery trả về kết quả của truy vấn
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setDes(rs.getString("des"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setDiscount(rs.getFloat("discount"));
                p.setType(rs.getString("type"));
                p.setQuantity(rs.getInt("quantity"));
                list.add(p);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }

    // lay 1 san pham
    public static Products getProducts(String id) {
        Products p = null;
        String str = "SELECT *, store.name as storeName, store.id as storeId, category.name as nameCate FROM `fashion` "
                + "JOIN `category` ON `fashion`.type = `category`.id "
                + "JOIN `store` ON `fashion`.shop = `store`.id"
                + " WHERE fashion.id = '" + id + "'";
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Products();
                p.setId(id);
                p.setName(rs.getString("name"));
                p.setDes(rs.getString("des"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setDiscount(rs.getFloat("discount"));
                p.setType(rs.getString("type"));
                p.setSize(rs.getString("size"));
                p.setListImg(rs.getString("listImg"));
                p.setColor(rs.getString("color"));
                p.setSell(rs.getInt("sell"));
                p.setQuantity(rs.getInt("quantity"));
                p.setNameCate(rs.getString("nameCate"));
                p.setNameStore(rs.getString("storeName"));
                p.setIdStore(rs.getInt("storeId"));
            }
            ps.close();
        } catch (SQLException e) {
        }
        return p;
    }

    // lay theo ten san pham
    public List<Products> showNProducts(String name) {
        List<Products> list = new ArrayList<>();
        String str = "SELECT * FROM `fashion`";
        // connection : thiết lập kết nối đến CSDL
        Connection connection = Util.getConnection();
        if (name.length() > 0) {
            str += " WHERE name like '%" + name + "%'";
            try {
                PreparedStatement ps = connection.prepareStatement(str);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Products p = new Products();
                    p.setId(rs.getString("id"));
                    p.setName(rs.getString("name"));
                    p.setDes(rs.getString("des"));
                    p.setImage(rs.getString("image"));
                    p.setPrice(rs.getFloat("price"));
                    p.setDiscount(rs.getFloat("discount"));
                    p.setType(rs.getString("type"));
                    p.setSize(rs.getString("size"));
                    p.setListImg(rs.getString("listImg"));
                    p.setColor(rs.getString("color"));
                    p.setSell(rs.getInt("sell"));
                    p.setQuantity(rs.getInt("quantity"));
                    p.setCreateDate(rs.getString("createDate"));
                    p.setStore(rs.getInt("shop"));
                    list.add(p);
                }
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    // ham update
    public void updateSP(String name, float price, String des, String image, float discount, String type, String id) {
        Connection connection = Util.getConnection();
        String sql = "UPDATE fashion SET name = ?, price = ?, des = ?, image =? discount=? type=? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setFloat(2, price);
            ps.setString(3, des);
            ps.setString(4, image);
            ps.setFloat(5, discount);
            ps.setString(6, type);
            ps.setString(7, id);
            ps.executeUpdate();
            ps.close();

        } catch (SQLException e) {
        }
    }

    // ham kiem tra so luong san pham
    public boolean checkQuantitySP(int quantity, String id) {
        Connection connection = Util.getConnection();
        String sql = "SELECT * FROM fashion WHERE id = '" + id + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setQuantity(rs.getInt("quantity"));
                if (p.getQuantity() - quantity > 0) {
                    return true;
                } else {
                    return false;
                }
            }
            ps.close();
        } catch (SQLException e) {
        }
        return true;
    }

    // ham update so luong
    public void updateQuantitySP(int quantity, String id) {
        Connection connection = Util.getConnection();
        String sql = "SELECT * FROM fashion WHERE id = '" + id + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setQuantity(rs.getInt("quantity"));
                String sqlUd = "UPDATE fashion SET quantity=" + (p.getQuantity() - quantity) + " WHERE id = '" + id + "'";
                PreparedStatement psUd = connection.prepareStatement(sqlUd);
                psUd.executeUpdate();
            }
            ps.close();
        } catch (SQLException e) {
        }
    }

    // ham delete
    public void deleteSP(String id) {
        Connection connection = Util.getConnection();
        String sql = "DELETE FROM fashion WHERE id = '" + id + "'";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.executeUpdate();
//            ps.close();
//
//        } catch (SQLException e) {
//        }
        System.out.println(sql);
    }

    // ham insert
    public void insertSP(String id, String name, float price, String des, String image, float discount, String type, int quantity, String color, String size, String createDate) {
        Connection connection = Util.getConnection();
        String sql = "INSERT INTO fashion (id, name, price, des, image, discount, type, quantity, color, size, createDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setFloat(3, price);
            ps.setString(4, des);
            ps.setString(5, image);
            ps.setFloat(6, discount);
            ps.setString(7, type);
            ps.setInt(8, quantity);
            ps.setString(9, color);
            ps.setString(10, size);
            ps.setString(11, createDate);
            ps.executeUpdate();
            ps.close();

        } catch (SQLException e) {
        }
    }

    // dem san pham de phan trang
    public int countProduct(String shop) {
        Connection connection = Util.getConnection();
        String sql = "select count(*) as total from fashion";
        if (shop.length() > 0 && !shop.equals("null")) {
            sql += " WHERE shop ='" + shop + "'";
        }
        int productCount = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productCount = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productCount;
    }

    public static List<Products> getListPage(int start, String shop) {
        ArrayList<Products> list = new ArrayList<>();
        Connection connection = Util.getConnection();
        String sql = "select * from fashion limit 9 offset " + start;
        if (shop.length() > 0) {
            sql = "select * from fashion WHERE shop ='" + shop + "' limit 9 offset " + start;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setDes(rs.getString("des"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setDiscount(rs.getFloat("discount"));
                p.setType(rs.getString("type"));
                p.setQuantity(rs.getInt("quantity"));
                list.add(p);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }
}
