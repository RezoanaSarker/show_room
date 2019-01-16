/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.ViewSaleService;
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
public class ViewSaleController {
     @Autowired
     ViewSaleService sdao;
     
      @RequestMapping(value = "/showsale", method = RequestMethod.GET)
    public ModelAndView showAdmin() {
        String salelist = sdao.viewSale();
        ModelAndView mv = new ModelAndView("viewsale");
        mv.addObject("salelist", salelist);
        //logger.info("End of Landingpage in home controller");
        return mv;
    }
    
}
