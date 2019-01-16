/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Purchase;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface ViewPurchaseService {

    public String updatePurchase(int purchaseid, Purchase pm);

    public String deletePurchase(int purchaseid);

    public String viewPurchase();

    public Purchase viewOnePurchase(int purchaseid);

}
