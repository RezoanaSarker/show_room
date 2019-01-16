/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.ProductService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author B9
 */
@Controller
public class IndexController {
     @Autowired
    ProductService pdao;
     
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView landingPage(HttpSession httpSession) {
        //logger.info("Inside Landingpage in home controller");
        String productlist = pdao.viewProduct();
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("productlist", productlist);
        //logger.info("End of Landingpage in home controller");
        return mv;
    }
    
}
