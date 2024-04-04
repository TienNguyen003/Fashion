/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Invoice {
    String price, idProduct, createBy, deleteBy, own;
    int id,status, codeBill, codeTrading;
    String createDate, deleteDate;

    public Invoice(String price, String idProduct, String createBy, String deleteBy, int id, int status, int codeBill, int codeTrading, String createDate, String deleteDate, String own) {
        this.price = price;
        this.idProduct = idProduct;
        this.createBy = createBy;
        this.deleteBy = deleteBy;
        this.id = id;
        this.status = status;
        this.codeBill = codeBill;
        this.codeTrading = codeTrading;
        this.createDate = createDate;
        this.deleteDate = deleteDate;
        this.own = own;
    }

    public Invoice() {
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getDeleteBy() {
        return deleteBy;
    }

    public void setDeleteBy(String deleteBy) {
        this.deleteBy = deleteBy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCodeBill() {
        return codeBill;
    }

    public void setCodeBill(int codeBill) {
        this.codeBill = codeBill;
    }

    public int getCodeTrading() {
        return codeTrading;
    }

    public void setCodeTrading(int codeTrading) {
        this.codeTrading = codeTrading;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getDeleteDate() {
        return deleteDate;
    }

    public void setDeleteDate(String deleteDate) {
        this.deleteDate = deleteDate;
    }

    public String getOwn() {
        return own;
    }

    public void setOwn(String own) {
        this.own = own;
    }
}
