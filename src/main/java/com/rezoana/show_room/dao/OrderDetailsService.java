/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.OrderDetails;
import java.util.ArrayList;
import org.springframework.stereotype.Service;

/**
 *
 * @author B9
 */
@Service
public interface OrderDetailsService {

    public String insertOrderDetails(ArrayList<OrderDetails> orderdetails);

    public String updateOrderDetails(int orderid, OrderDetails orderdetails);

    public String deleteOrderDetails(int orderid);

    public String viewProductOrder();

    public OrderDetails viewOneProductOrder(int orderid);

}
