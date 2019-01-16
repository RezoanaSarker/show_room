/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Rezwana
 */
@Entity
public class ProductSale implements Serializable {
      @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    int psaleid;
    @Column
    int orderid;
    @Column
    Date deleverydate = new Date();
    @Column
    String salestatus = "Delivered";

    public int getPsaleid() {
        return psaleid;
    }

    public void setPsaleid(int psaleid) {
        this.psaleid = psaleid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public Date getDeleverydate() {
        return deleverydate;
    }

    public void setDeleverydate(Date deleverydate) {
        this.deleverydate = deleverydate;
    }

//    public String getSalestatus() {
//        return salestatus;
//    }
//
//    public void setSalestatus(String salestatus) {
//        this.salestatus = salestatus;
//    }

    public String getSalestatus() {
        return salestatus;
    }

    public void setSalestatus(String salestatus) {
        this.salestatus = salestatus;
    }
    
    
    
    
    
}
