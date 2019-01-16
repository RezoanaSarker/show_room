/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.daoimple;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.ProductService;
import com.rezoana.show_room.model.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author B9
 */
@Repository
public class ProductServiceImpl implements ProductService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertProduct(Product pm) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(pm);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateProduct(int product_id, Product pm) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Product oneproductobject = (Product) s.get(Product.class, product_id);
        oneproductobject.setCatid(pm.getCatid());
        oneproductobject.setSupplierid(pm.getSupplierid());
        oneproductobject.setProductname(pm.getProductname());
        oneproductobject.setProductprice(pm.getProductprice());
        oneproductobject.setProductquantity(pm.getProductquantity());
        oneproductobject.setPurchasedate(pm.getPurchasedate());
        oneproductobject.setSaleprice(pm.getSaleprice());
        s.update(oneproductobject);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteProduct(int product_id) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Product pm = (Product) s.get(Product.class, product_id);
        s.delete(pm);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewProduct() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Product> productslist = s.createQuery("from Product").list();
        Gson g = new Gson();
        String productslistgson = g.toJson(productslist);
        t.commit();
        s.close();
        return productslistgson;
    }

    @Override
    public Product viewOneProduct(int product_id) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Product pm = (Product) s.get(Product.class, product_id);
        t.commit();
        s.close();
        return pm;
    }

}
