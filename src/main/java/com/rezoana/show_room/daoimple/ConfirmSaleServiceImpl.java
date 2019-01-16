/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.daoimple;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.ConfirmSaleService;
import com.rezoana.show_room.model.ProductSale;
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
public class ConfirmSaleServiceImpl implements ConfirmSaleService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertProductOrder(ProductSale order_id) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(order_id);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateProductOrder(int order_id, ProductSale order) {
        return null;
    }

    @Override
    public String deleteProductOrder(int order_id) {
        return null;
    }

    @Override
    public String viewsale() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<ProductSale> productslist = s.createQuery("from ProductSale").list();
        Gson g = new Gson();
        String productslistgson = g.toJson(productslist);
        t.commit();
        s.close();
        return productslistgson;
    }

    @Override
    public ProductSale viewOneProductOrder(int order_id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String insert(int p, ProductSale order) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        order.setOrderid(p);
        s.save(order);
        t.commit();
        s.close();
        return null;
    }

}
