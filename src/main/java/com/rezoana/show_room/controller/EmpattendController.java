/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.EmpattendService;
import com.rezoana.show_room.dao.EmployeeinfoService;
import com.rezoana.show_room.model.Empattend;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rezwana
 */
@Controller
public class EmpattendController {

    @Autowired
    EmpattendService es;
    @Autowired
    EmployeeinfoService eis;

    @InitBinder
    public void myInitBinder(WebDataBinder binder) {
        //binder.setDisallowedFields(new String[]{"empMobile"});
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        binder.registerCustomEditor(Date.class, "attenddate", new CustomDateEditor(format, false));
//        binder.registerCustomEditor(String.class, "ename", new EmployeeNameEditor());
    }

    @InitBinder
    public void myInitBinderr(WebDataBinder binder) {
        //binder.setDisallowedFields(new String[]{"empMobile"});
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        binder.registerCustomEditor(Date.class, "enddate", new CustomDateEditor(format, false));
//        binder.registerCustomEditor(String.class, "ename", new EmployeeNameEditor());
    }

    @RequestMapping("/showattendpage")
    public ModelAndView showAttended() {
        String empattendlist = es.viewEmpattend();
        String empinfoList = eis.viewEmployeeinfo();
        //User emaillist = sdao.viewUser( s);

        ModelAndView mv = new ModelAndView("addAttend", "newAttendObject", new Empattend());
        mv.addObject("empattendlist", empattendlist);
        mv.addObject("empinfoList", empinfoList);
        //mv.addObject("categorymodelobject", emaillist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addAttends", params = "Add")
    public String addAttended(@ModelAttribute("newAttendObject") Empattend eattend, HttpServletRequest request) {
        es.insertEmpattend(eattend);
        return "redirect:/showattendpage";
    }

    @RequestMapping(value = "/addAttends", params = "Edit")
    public String editAttended(@ModelAttribute("newAttendObject") Empattend eattend, HttpServletRequest request) {
        es.updateEmpattend(eattend.getEmpattendid(), eattend);

        return "redirect:/showattendpage";
    }

    @RequestMapping("removingAttend/{Id}")
    public String removeAttended(@PathVariable("Id") int categoryId) {
        es.deleteEmpattend(categoryId);
        return "redirect:/showattendpage";
    }

    @RequestMapping("/editingAttend")
    public ModelAndView editAttendeds(@RequestParam("getpid") int eid) {
        String empattendlist = es.viewEmpattend();
        String empinfoList = eis.viewEmployeeinfo();
        //User emaillist = sdao.viewUser( s);
        ModelAndView mv = new ModelAndView("addAttend", "newAttendObject", es.viewOneEmpattend(eid));
        mv.addObject("empattendlist", empattendlist);
        mv.addObject("empinfoList", empinfoList);
        // mv.addObject("categorymodelobject", emaillist);
        mv.addObject("check", "false");
        return mv;
    }

}
