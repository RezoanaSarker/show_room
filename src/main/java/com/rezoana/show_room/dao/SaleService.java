/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Sale;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface SaleService {

    public String insertSale(Sale pm);

    public Integer updateSale(int saleid, Sale pm);

    public Integer deleteSale(int saleid);

    public String viewSale();

    public Sale viewOneSale(int saleid);

}
