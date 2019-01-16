/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.daoimple;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.EmpsalaryService;
import com.rezoana.show_room.model.Empsalary;
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
public class EmpsalaryServiceImpl implements EmpsalaryService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertEmpsalary(Empsalary pm) {
        Session s = sessionFactory.openSession();

        Transaction t = s.getTransaction();
        t.begin();
        Empsalary e = new Empsalary();
        e.setBasicsalary(pm.getBasicsalary());
        e.setOvertimepayment(pm.getOvertimepayment());
        e.setIncentives(pm.getIncentives());
        pm.setTotal(e.getBasicsalary() + e.getOvertimepayment() + e.getIncentives());

        s.save(pm);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public Integer updateEmpsalary(int salaryid, Empsalary pm) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Empsalary emp = (Empsalary) s.get(Empsalary.class, salaryid);
        emp.setEmpid(pm.getEmpid());
        emp.setEmpattendid(pm.getEmpattendid());
        emp.setSalarydate(pm.getSalarydate());
        emp.setBasicsalary(pm.getBasicsalary());
        emp.setOvertimepayment(pm.getOvertimepayment());
        emp.setIncentives(pm.getIncentives());

        s.update(emp);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public Integer deleteEmpsalary(int salaryid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Empsalary pm = (Empsalary) s.get(Empsalary.class, salaryid);

        s.delete(pm);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewEmpsalary() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Empsalary> salaryList = s.createQuery("from Empsalary").list();
        Gson g = new Gson();
        String salarylistgson = g.toJson(salaryList);
        t.commit();
        s.close();
        return salarylistgson;
    }

    @Override
    public Empsalary viewOneEmpsalary(int salaryid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Empsalary pm = (Empsalary) s.get(Empsalary.class, salaryid);
        t.commit();
        s.close();
        return pm;
    }

}
