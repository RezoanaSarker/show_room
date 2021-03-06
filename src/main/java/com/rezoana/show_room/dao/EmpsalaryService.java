/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Empsalary;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface EmpsalaryService {

    public String insertEmpsalary(Empsalary pm);

    public Integer updateEmpsalary(int salaryid, Empsalary pm);

    public Integer deleteEmpsalary(int salaryid);

    public String viewEmpsalary();

    public Empsalary viewOneEmpsalary(int salaryid);
}
