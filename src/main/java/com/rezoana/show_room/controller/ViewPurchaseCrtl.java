/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.ViewPurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rezwana
 */
@Controller
public class ViewPurchaseCrtl {
    @Autowired
    ViewPurchaseService vdao;
    
    @RequestMapping(value = "/showpurchase", method = RequestMethod.GET)
    public ModelAndView showAdmin() {
        String purchaselist = vdao.viewPurchase();
        ModelAndView mv = new ModelAndView("viewpurchase");
        mv.addObject("purchaselist", purchaselist);
        //logger.info("End of Landingpage in home controller");
        return mv;
    }
    
}
