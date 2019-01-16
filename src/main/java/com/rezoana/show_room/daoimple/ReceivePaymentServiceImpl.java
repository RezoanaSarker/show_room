/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.daoimple;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.ReceivePaymentService;
import com.rezoana.show_room.model.ReceivePayment;
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
public class ReceivePaymentServiceImpl implements ReceivePaymentService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertReceivePayment(ReceivePayment pm) {
        Session s = sessionFactory.openSession();

        Transaction t = s.getTransaction();
        t.begin();

        s.save(pm);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public Integer updateReceivePayment(int receiveid, ReceivePayment pm) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        ReceivePayment emp = (ReceivePayment) s.get(ReceivePayment.class, receiveid);
        emp.setShowroomid(pm.getShowroomid());
        emp.setSaleid(pm.getSaleid());
        emp.setUser(pm.getUser());
        emp.setAmount(pm.getAmount());
        emp.setDate(pm.getDate());
        emp.setRemarks(pm.getRemarks());
        
        s.update(emp);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public Integer deleteReceivePayment(int receiveid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        ReceivePayment pm = (ReceivePayment) s.get(ReceivePayment.class, receiveid);
        
        s.delete(pm);
        t.commit();
        s.close();
        return null;   
    }

    @Override
    public String viewReceivePayment() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
         List<ReceivePayment> payList = s.createQuery("from ReceivePayment").list();
          Gson g = new Gson();
        String paylistgson = g.toJson(payList);
        t.commit();
        s.close();
        return paylistgson; 
    }

    @Override
    public ReceivePayment viewOneReceivePayment(int receiveid) {
         Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        ReceivePayment pm = (ReceivePayment) s.get(ReceivePayment.class, receiveid);
        
        t.commit();
        s.close();
        return pm;
    }

}
