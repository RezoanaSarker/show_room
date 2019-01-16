/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author B9
 */
@Entity
public class BillingAddress implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    int addressid;
    String addresslineone, addresslinetwo, country, city, statename, emailid, phone;

    public int getAddressid() {
        return addressid;
    }

    public void setAddressid(int addressid) {
        this.addressid = addressid;
    }

    public String getAddresslineone() {
        return addresslineone;
    }

    public void setAddresslineone(String addresslineone) {
        this.addresslineone = addresslineone;
    }

    public String getAddresslinetwo() {
        return addresslinetwo;
    }

    public void setAddresslinetwo(String addresslinetwo) {
        this.addresslinetwo = addresslinetwo;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStatename() {
        return statename;
    }

    public void setStatename(String statename) {
        this.statename = statename;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    
    
}
