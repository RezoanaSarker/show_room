/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.daoimple;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.ViewPurchaseService;
import com.rezoana.show_room.model.Purchase;
import com.rezoana.show_room.model.Purchasedetail;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rezwana
 */
@Repository
public class ViewPurchaseServiceImpl implements ViewPurchaseService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String updatePurchase(int purchaseid, Purchase pm) {
        return null;
    }

    @Override
    public String deletePurchase(int purchaseid) {
        return null;
    }

    @Override
    public String viewPurchase() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Purchase> purchaseList = s.createQuery("from Purchase order by purchaseid").list();
        List<Purchasedetail> purchasedetailList = s.createQuery("from Purchasedetail order by purchaseid").list();
        //adding blank orderdetails
        for (int i = 0; i < purchaseList.size(); i++) {
            purchaseList.get(i).setPurchasedetail(new ArrayList<Purchasedetail>());
        }

        List<Integer> parentId = new ArrayList<>();
        List<Integer> childId = new ArrayList<>();
        //list all orderid from order
        for (int i = 0; i < purchaseList.size(); i++) {
            parentId.add(purchaseList.get(i).getPurchaseid());            
        }
        
         //list all orderid from orderdetails
        for (int i = 0; i < purchasedetailList.size(); i++) {
            childId.add(purchasedetailList.get(i).getPurchaseid());            
        }
        //List<OrderDetails> subchild;
        try {
             int index=0;
            for (Integer i : childId) {
            if (parentId.contains(i)) {
                //subchild = new ArrayList<>();
                System.out.println(parentId.indexOf(i)+" Match Found " + i);
                //subchild.add(orderDetailList.get(index));                
                purchaseList.get(parentId.indexOf(i)).getPurchasedetail().add(purchasedetailList.get(index));
                index++;
            }
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        Gson g = new Gson();
        String purchaseListgson = g.toJson(purchaseList);
        t.commit();
        s.close();
        System.out.println("-----"+purchaseListgson);
        return purchaseListgson;
    }

    @Override
    public Purchase viewOnePurchase(int purchaseid) {
        return null;
    }

}
