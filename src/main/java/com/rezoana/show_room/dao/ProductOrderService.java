/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.ProductOrder;
import org.springframework.stereotype.Service;

/**
 *
 * @author B9
 */
@Service
public interface ProductOrderService {

    public String insertProductOrder(ProductOrder order);

    public String updateProductOrder(int orderid, ProductOrder order);

    public String deleteProductOrder(int orderid);

    public String viewProductOrder();

    public ProductOrder viewOneProductOrder(int orderid);

}
