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
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDB {

    // lấy tất cả các sản phẩm
    public static List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        String str = "SELECT * FROM `account`";
        // connection : thiết lập kết nối đến CSDL
        Connection connection = Util.getConnection();
        try {
            // dùng để thực thi các câu lệnh truy vấn SQL trong JDBC
            PreparedStatement ps = connection.prepareStatement(str);
            // duyệt và truy xuất dữ liệu từ tập kết quả trả về
            ResultSet rs = ps.executeQuery(); // executeQuery trả về kết quả của truy vấn
            while (rs.next()) {
                Account p = new Account();
                p.setUsername(rs.getString("username"));
                p.setPassword(rs.getString("password"));
                p.setEmail(rs.getString("email"));
                p.setName(rs.getString("name"));
                p.setDate(rs.getString("date"));
                p.setAddress(rs.getString("address"));
                p.setRole(rs.getString("role"));
                p.setPhoneNumber(rs.getString("phonenumber"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }

    // lay 1 tai khoan
    public Account getProducts(String username) {
        Account p = new Account();
        String str = "SELECT * FROM account WHERE username='" + username + "'";
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p.setUsername(rs.getString("username"));
                p.setPassword(rs.getString("password"));
                p.setEmail(rs.getString("email"));
                p.setName(rs.getString("name"));
                p.setDate(rs.getString("date"));
                p.setAddress(rs.getString("address"));
                p.setRole(rs.getString("role"));
                p.setPhoneNumber(rs.getString("phonenumber"));
                p.setImage(rs.getString("image"));
            }
            ps.close();
        } catch (SQLException e) {
        }
        return p;
    }

    // lay tai khoan theo ten
    public List<Account> showNProducts(String name) {
        List<Account> list = new ArrayList<>();
        String str = "SELECT * FROM `account`";
        // connection : thiết lập kết nối đến CSDL
        Connection connection = Util.getConnection();
        if (name.length() > 0) {
            str += " WHERE username like '%" + name + "%'";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account p = new Account();
                p.setUsername(rs.getString("username"));
                p.setPassword(rs.getString("password"));
                p.setEmail(rs.getString("email"));
                p.setName(rs.getString("name"));
                p.setDate(rs.getString("date"));
                p.setAddress(rs.getString("address"));
                p.setRole(rs.getString("role"));
                p.setPhoneNumber(rs.getString("phonenumber"));
                p.setImage(rs.getString("image"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // ham update
    public void updateSP(String name, String date, String address, String role, String phonenumber, String image, String username) {
        Connection connection = Util.getConnection();
        String sql = "UPDATE account SET name = ?, date = ?, address =?, role =?, phonenumber =?, image=? WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setString(3, address);
            ps.setString(4, role);
            ps.setString(5, phonenumber);
            ps.setString(6, image);
            ps.setString(7, username);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
    }

    // ham delete
    public void deleteSP(String username) {
        Connection connection = Util.getConnection();
        String sql = "DELETE FROM account WHERE username = '"+username+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();

        } catch (SQLException e) {
        }
    }

    // ham insert
    public void insertSP(String username, String password, String email, String name, String date, String address, String role, String phonenumber, String image) {
        Connection connection = Util.getConnection();
        AccountDB accDB = new AccountDB();
        Account getAcc = (Account) accDB.checkRes(username, email);
        if (getAcc.getUsername() == null || getAcc.getEmail() == null) {
            String insertQuery = "INSERT INTO account (username, password, email, name, date, address, role, phonenumber, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (
                PreparedStatement ps = connection.prepareStatement(insertQuery)) {
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, email);
                ps.setString(4, name);
                ps.setString(5, date);
                ps.setString(6, address);
                ps.setString(7, role);
                ps.setString(8, phonenumber);
                ps.setString(9, image);
                ps.executeUpdate();
                ps.close();
            } catch (SQLException e) {
            }
        }
    }

    // ham check quyen
    public static Account checkAd(String username) {
        Account p = new Account();
        Connection connection = Util.getConnection();
        String sql = "SELECT role FROM account WHERE username = '" + username + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p.setRole(rs.getString("role"));
            }
            ps.close();
        } catch (SQLException e) {
        }
        return p;
    }

    public static Account checkLogin(String userName, String pass) {
        Account p = new Account();
        Connection connection = Util.getConnection();
        String sql = "SELECT * FROM `account` WHERE username='" + userName + "' and password='" + pass + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p.setUsername(rs.getString("username"));
                p.setPassword(rs.getString("password"));
            }
            ps.close();
        } catch (SQLException e) {
        }
        return p;
    }

    public static Account checkRes(String userName, String email) {
        Account p = new Account();
        Connection connection = Util.getConnection();
        String sql = "SELECT * FROM account WHERE username = '" + userName + "' or email='" + email + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p.setUsername(rs.getString("username"));
                p.setEmail(rs.getString("email"));
            }
            ps.close();
        } catch (SQLException e) {
        }
        return p;
    }

    public boolean changePass(String usename, String newPass) {
        Account acc = new Account();
        Connection connection = Util.getConnection();
        String sql = "UPDATE account SET password = '" + newPass + "' WHERE username = '" + usename + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
        return true;
    }
}
