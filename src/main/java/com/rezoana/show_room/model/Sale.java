/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author Rezwana
 */
@Entity
public class Sale implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int saleid;
//    @Column
//    private int supplierid;
    
    @Column
    private int showroomid;
    
    
    @Column
    private String admin;

    @Temporal(TemporalType.DATE)

    private Date saledate;
    @Column
    private double billtotal;
    @Column
    private String status = "Sale";
    @Transient
    int productid;
    @Transient
    int quantity;
    @Transient
    double price;

    public int getSaleid() {
        return saleid;
    }

    public void setSaleid(int saleid) {
        this.saleid = saleid;
    }

//    public int getSupplierid() {
//        return supplierid;
//    }
//
//    public void setSupplierid(int supplierid) {
//        this.supplierid = supplierid;
//    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public Date getSaledate() {
        return saledate;
    }

    public void setSaledate(Date saledate) {
        this.saledate = saledate;
    }

    public double getBilltotal() {
        return billtotal;
    }

    public void setBilltotal(double billtotal) {
        this.billtotal = billtotal;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
     @Transient
    List<Saledetail> saledetail;

    public List<Saledetail> getSaledetail() {
        return saledetail;
    }

    public void setSaledetail(List<Saledetail> saledetail) {
        this.saledetail = saledetail;
    }

    public int getShowroomid() {
        return showroomid;
    }

    public void setShowroomid(int showroomid) {
        this.showroomid = showroomid;
    }
     
     
    

}
