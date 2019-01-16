/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Product;
import org.springframework.stereotype.Service;

/**
 *
 * @author B9
 */
@Service
public interface ProductService {

    public String insertProduct(Product pm);

    public String updateProduct(int product_id, Product pm);

    public String deleteProduct(int product_id);

    public String viewProduct();

    public Product viewOneProduct(int product_id);

}
