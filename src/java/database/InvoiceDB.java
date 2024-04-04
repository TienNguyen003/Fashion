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
import model.Invoice;

/**
 *
 * @author Admin
 */
public class InvoiceDB {
    // lấy tất cả hóa đơn
    public static List<Invoice> getAll() {
        List<Invoice> list = new ArrayList<>();
        String str = "SELECT * FROM `invoice`";
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                Invoice i = new Invoice();
                i.setOwn(rs.getString("own"));
                i.setCodeBill(rs.getInt("codeBill"));
                i.setCodeTrading(rs.getInt("codeTrading"));
                i.setPrice(rs.getString("price"));
                i.setIdProduct(rs.getString("idProduct"));
                i.setStatus(rs.getInt("status"));
                i.setCreateBy(rs.getString("createBy"));
                i.setCreateDate(rs.getString("createDate"));
                i.setDeleteBy(rs.getString("deleteBy"));
                i.setDeleteDate(rs.getString("deleteDate"));
                list.add(i);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static List<Invoice> getInvoiceStore(String id, int isCheck) {
        List<Invoice> list = new ArrayList<>();
        String str = "SELECT * FROM `invoice`";
        if(!id.equals("null") && id.length() > 0){
            str += "WHERE shop = '" + id + "'";
            if(isCheck == 0)
                str += " ORDER BY id DESC LIMIT 5";
        }        
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                Invoice i = new Invoice();
                i.setOwn(rs.getString("own"));
                i.setCodeBill(rs.getInt("codeBill"));
                i.setCodeTrading(rs.getInt("codeTrading"));
                i.setPrice(rs.getString("price"));
                i.setIdProduct(rs.getString("idProduct"));
                i.setStatus(rs.getInt("status"));
                i.setCreateBy(rs.getString("createBy"));
                i.setCreateDate(rs.getString("createDate"));
                i.setDeleteBy(rs.getString("deleteBy"));
                i.setDeleteDate(rs.getString("deleteDate"));
                list.add(i);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }
    
    // lấy tất cả hóa đơn theo username
    public static List<Invoice> getAllOwn(String own) {
        List<Invoice> list = new ArrayList<>();
        String str = "SELECT * FROM `invoice` WHERE own ='"+own+"'";
        Connection connection = Util.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(str);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                Invoice i = new Invoice();
                i.setOwn(rs.getString("own"));
                i.setCodeBill(rs.getInt("codeBill"));
                i.setCodeTrading(rs.getInt("codeTrading"));
                i.setPrice(rs.getString("price"));
                i.setIdProduct(rs.getString("idProduct"));
                i.setStatus(rs.getInt("status"));
                i.setCreateBy(rs.getString("createBy"));
                i.setCreateDate(rs.getString("createDate"));
                i.setDeleteBy(rs.getString("deleteBy"));
                i.setDeleteDate(rs.getString("deleteDate"));
                list.add(i);
            }
            ps.close();
        } catch (SQLException e) {
        }
        return list;
    }

    // ham delete
    public void deleteInvoice(String codeBill) {
        Connection connection = Util.getConnection();
        String sql = "DELETE FROM invoice WHERE codeBill = '"+codeBill+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();            
        } catch (SQLException e) {
        }
    }

    // ham insert
    public void insertInvoice(String own, int codeBill, int codeTrading, String price, String idProduct, int status, String shop, String createBy, String createDate, String deleteBy, String deleteDate) {
        Connection connection = Util.getConnection();
        String sql = "INSERT INTO invoice(own, codeBill, codeTrading, price, idProduct, status, shop, createBy, createDate, deleteBy, deleteDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, own);
            ps.setInt(2, codeBill);
            ps.setInt(3, codeTrading);
            ps.setString(4, price);
            ps.setString(5, idProduct);
            ps.setInt(6, status);
            ps.setString(7, shop);
            ps.setString(8, createBy);
            ps.setString(9, createDate);
            ps.setString(10, deleteBy);
            ps.setString(11, deleteDate);
            ps.executeUpdate();
            
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    // ham update
    public void updateInvoice(int status, String codeBill) {
        Connection connection = Util.getConnection();
        String sql = "UPDATE `invoice` SET `status`=? WHERE codeBill = ? ";
        try (
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, status);  
            ps.setString(2, codeBill);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
    }
    
    // check bill de tao moi
    public static Invoice checkInvoice(String codeBill, String codeTrading){
        Invoice i = new Invoice();
        Connection connection = Util.getConnection();
        String sql = "SELECT * FROM `invoice` WHERE codeBill = '"+codeBill+"' AND codeTrading='"+codeTrading+"'";
        try (
            PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i.setCodeBill(rs.getInt("codeBill"));
            }
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
        return i;
    }
}
