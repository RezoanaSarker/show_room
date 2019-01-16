/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Saledetail;
import java.util.ArrayList;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface SaleDetailService {

    public String insertSaledetail(ArrayList<Saledetail> saledetails);

    public String updateSaledetail(int saledetailid, Saledetail saledetails);

    public String deleteSaledetail(int saledetailid);

    public String viewSaledetail();

    public Saledetail viewOneSaledetail(int saledetailid);

}
