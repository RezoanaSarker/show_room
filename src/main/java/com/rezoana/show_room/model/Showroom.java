/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author Rezwana
 */
@Entity
public class Showroom implements Serializable  {
      @Id
    private String showroomId;
    @Column
    private String showroomName;
    @Column
    private String showroomAddress;
    @Column
    private String showroomPhone;
    @Column
    private String showroomemail;

    public String getShowroomId() {
        return showroomId;
    }

    public void setShowroomId(String showroomId) {
        this.showroomId = showroomId;
    }

    

    

    public String getShowroomName() {
        return showroomName;
    }

    public void setShowroomName(String showroomName) {
        this.showroomName = showroomName;
    }

    public String getShowroomAddress() {
        return showroomAddress;
    }

    public void setShowroomAddress(String showroomAddress) {
        this.showroomAddress = showroomAddress;
    }

    public String getShowroomPhone() {
        return showroomPhone;
    }

    public void setShowroomPhone(String showroomPhone) {
        this.showroomPhone = showroomPhone;
    }

    public String getShowroomemail() {
        return showroomemail;
    }

    public void setShowroomemail(String showroomemail) {
        this.showroomemail = showroomemail;
    }
    
    
    
}
