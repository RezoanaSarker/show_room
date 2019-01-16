/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.daoimple;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.ShowroomService;
import com.rezoana.show_room.model.Showroom;
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
public class ShowroomServiceImpl implements ShowroomService {
     @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertShowroom(Showroom sr) {
         Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(sr);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateShowroom(Showroom sr) {
         Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.update(sr);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteShowroom(String id) {
         Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Showroom sr = (Showroom) s.get(Showroom.class, id);
        s.delete(sr);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewShowroom() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Showroom> showroomlist = s.createQuery("from Showroom").list();
        Gson g = new Gson();
        String showroomlistgson = g.toJson(showroomlist);
        t.commit();
        s.close();
        return showroomlistgson;
    }

    @Override
    public Showroom viewOneShowroom(String id) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Showroom sr = (Showroom) s.get(Showroom.class, id);
        //Gson gson = new Gson();
        //String onesuppliergsonstring = gson.toJson(sm);
        t.commit();
        s.close();
        return sr;
    }

    

}
