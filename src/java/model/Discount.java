/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Discount {
    int id, dscPer, quantity;
    String dscCode, start, end;

    public Discount(int id, int dscPer, int quantity, String dscCode, String start, String end) {
        this.id = id;
        this.dscPer = dscPer;
        this.quantity = quantity;
        this.dscCode = dscCode;
        this.start = start;
        this.end = end;
    }

    public Discount() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDscPer() {
        return dscPer;
    }

    public void setDscPer(int dscPer) {
        this.dscPer = dscPer;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDscCode() {
        return dscCode;
    }

    public void setDscCode(String dscCode) {
        this.dscCode = dscCode;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }   
    
}
