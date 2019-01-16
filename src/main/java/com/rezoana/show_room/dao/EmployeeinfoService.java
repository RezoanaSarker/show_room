/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Employeeinfo;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface EmployeeinfoService {

    public String insertEmployeeinfo(Employeeinfo cm);

    public String updateEmployeeinfo(Employeeinfo cm);

    public Integer deleteEmployeeinfo(int id);

    public String viewEmployeeinfo();

    public Employeeinfo viewOneEmployeeinfo(int id);

}
