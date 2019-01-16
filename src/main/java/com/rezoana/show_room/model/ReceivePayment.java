/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Rezwana
 */
@Entity
public class ReceivePayment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int receiveid;
   // @Column
//    private int supplierid;
//    @Column
    @Column
    private int showroomid;
    @Column
    private int saleid;
    @Column
    private String user;
    @Column
    private double amount;
    @Temporal(TemporalType.DATE)
    private Date date;
    @Column
    private String remarks;
    @Column
    private String status = "Receive Success";

    public int getReceiveid() {
        return receiveid;
    }

    public void setReceiveid(int receiveid) {
        this.receiveid = receiveid;
    }

//    public int getSupplierid() {
//        return supplierid;
//    }
//
//    public void setSupplierid(int supplierid) {
//        this.supplierid = supplierid;
//    }

    public int getSaleid() {
        return saleid;
    }

    public void setSaleid(int saleid) {
        this.saleid = saleid;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getShowroomid() {
        return showroomid;
    }

    public void setShowroomid(int showroomid) {
        this.showroomid = showroomid;
    }
    
    
    
    

}
