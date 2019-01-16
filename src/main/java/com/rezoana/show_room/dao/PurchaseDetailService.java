/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Purchasedetail;
import java.util.ArrayList;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface PurchaseDetailService {

    public String insertPurchasedetail(ArrayList<Purchasedetail> purchasedetails);

    public String updatePurchasedetail(int purchasedetailid, Purchasedetail purchasedetails);

    public String deletePurchasedetail(int purchasedetailid);

    public String viewPurchasedetail();

    public Purchasedetail viewOnePurchasedetail(int purchasedetailid);

}
