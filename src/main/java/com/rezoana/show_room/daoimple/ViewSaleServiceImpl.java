/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.daoimple;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.ViewSaleService;
import com.rezoana.show_room.model.Sale;
import com.rezoana.show_room.model.Saledetail;
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
public class ViewSaleServiceImpl implements ViewSaleService{
     @Autowired
    SessionFactory sessionFactory;

    @Override
    public String updateSale(int saleid, Sale pm) {
        return null;
    }

    @Override
    public String deleteSale(int saleid) {
        return null;
    }

    @Override
    public String viewSale() {
         Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        
         List<Sale> saleList = s.createQuery("from Sale order by saleid").list();
        List<Saledetail> saledetailList = s.createQuery("from Saledetail order by saleid").list();
        //adding blank orderdetails
        
        for (int i = 0; i < saleList.size(); i++) {
            saleList.get(i).setSaledetail(new ArrayList<Saledetail>());
        }
        
         List<Integer> parentId = new ArrayList<>();
        List<Integer> childId = new ArrayList<>();
        //list all orderid from order
        
         for (int i = 0; i < saleList.size(); i++) {
            parentId.add(saleList.get(i).getSaleid());            
        }
        //list all orderid from orderdetails
        
         for (int i = 0; i < saledetailList.size(); i++) {
            childId.add(saledetailList.get(i).getSaleid());            
        }
        //List<OrderDetails> subchild;
        
        try {
            int index=0;
            for (Integer i : childId) {
            if (parentId.contains(i)) {
                //subchild = new ArrayList<>();
                System.out.println(parentId.indexOf(i)+" Match Found " + i);
                //subchild.add(orderDetailList.get(index));                
                saleList.get(parentId.indexOf(i)).getSaledetail().add(saledetailList.get(index));
                index++;
            }
        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
         Gson g = new Gson();
        String saleListgson = g.toJson(saleList);
        t.commit();
        s.close();
        System.out.println("-----"+saleListgson);
        return saleListgson;
        
    }

    @Override
    public Sale viewOneSale(int saleid) {
        return null;
    }
    
}
