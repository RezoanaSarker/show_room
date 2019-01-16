/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Payment;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface PaymentService {

    public String insertPayment(Payment pm);

    public Integer updatePayment(int paymentid, Payment pm);

    public Integer deletePayment(int paymentid);

    public String viewPayment();

    public Payment viewOnePayment(int paymentid);

}
