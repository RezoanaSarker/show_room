/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.daoimple;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.PaymentService;
import com.rezoana.show_room.model.Payment;
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
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertPayment(Payment pm) {
        Session s = sessionFactory.openSession();

        Transaction t = s.getTransaction();
        t.begin();

        s.save(pm);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public Integer updatePayment(int paymentid, Payment pm) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Payment emp = (Payment) s.get(Payment.class, paymentid);
        emp.setSupplierid(pm.getSupplierid());
        emp.setUser(pm.getUser());
        emp.setAmount(pm.getAmount());
        emp.setPaydate(pm.getPaydate());
        emp.setRemarks(pm.getRemarks());
        emp.setPurchaseid(pm.getPurchaseid());
        s.update(emp);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public Integer deletePayment(int paymentid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Payment pm = (Payment) s.get(Payment.class, paymentid);
        s.delete(pm);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewPayment() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Payment> payList = s.createQuery("from Payment").list();
        Gson g = new Gson();
        String paylistgson = g.toJson(payList);
        t.commit();
        s.close();
        return paylistgson;
    }

    @Override
    public Payment viewOnePayment(int paymentid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Payment pm = (Payment) s.get(Payment.class, paymentid);
        t.commit();
        s.close();
        return pm;
    }

}
