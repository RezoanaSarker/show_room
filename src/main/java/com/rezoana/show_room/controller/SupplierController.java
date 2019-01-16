/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.SupplierService;
import com.rezoana.show_room.model.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author B9
 */
@Controller
public class SupplierController {

    @Autowired
    SupplierService sdao;

    @RequestMapping("/showsupplier")
    public ModelAndView showsupplierpage() {
        String supplierslist = sdao.viewSupplier();
        //System.out.println("this is "+ supplierslist);
        ModelAndView mv = new ModelAndView("addsupplier", "newSupplierObject", new Supplier());
        mv.addObject("supplierslist", supplierslist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingsupplier", params = "Addingsupplier")
    public String addsupplierpage(@ModelAttribute("newSupplierObject") Supplier supplier) {
        sdao.insertSupplier(supplier);
        return "redirect:/showsupplier";

    }

    @RequestMapping(value = "/addingsupplier", params = "EditingSupplier")
    public String editsupplierpage(@ModelAttribute("newSupplierObject") Supplier supplier) {
        sdao.updateSupplier(supplier);
        return "redirect:/showsupplier";

    }

    @RequestMapping("removingsupplier/{supplierId}")
    public String removecategory(@PathVariable("supplierId") String supplierid) {
        sdao.deleteSupplier(supplierid);
        return "redirect:/showsupplier";
    }

    @RequestMapping("/editingsupplierbutton")
    public ModelAndView editsupplierbutton(@RequestParam("getsupplierid") String supplierid) {
        Supplier onesupplier = sdao.viewOneSupplier(supplierid);

        ModelAndView mv = new ModelAndView("addsupplier", "newSupplierObject", onesupplier);
        String suppliergsonlist = sdao.viewSupplier();
        mv.addObject("supplierslist", suppliergsonlist);
        mv.addObject("check", "false");
        return mv;
    }

}
