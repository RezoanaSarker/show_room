/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Empattend;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface EmpattendService {

    public String insertEmpattend(Empattend pm);

    public Integer updateEmpattend(int empattendid, Empattend pm);

    public Integer deleteEmpattend(int empattendid);

    public String viewEmpattend();

    public Empattend viewOneEmpattend(int empattendid);

}
