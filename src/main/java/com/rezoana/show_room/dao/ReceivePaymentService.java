/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.ReceivePayment;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface ReceivePaymentService {

    public String insertReceivePayment(ReceivePayment pm);

    public Integer updateReceivePayment(int receiveid, ReceivePayment pm);

    public Integer deleteReceivePayment(int receiveid);

    public String viewReceivePayment();

    public ReceivePayment viewOneReceivePayment(int receiveid);

}
