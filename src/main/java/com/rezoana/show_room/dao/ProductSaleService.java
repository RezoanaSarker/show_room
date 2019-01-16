/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.ProductSale;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface ProductSaleService {

    public String insertProductOrder(ProductSale order_id);

    public String updateProductOrder(int order_id, ProductSale order);

    public String deleteProductOrder(int order_id);

    public String viewsale();

    public ProductSale viewOneProductOrder(int order_id);

}
