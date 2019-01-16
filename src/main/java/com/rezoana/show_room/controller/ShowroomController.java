/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.ShowroomService;
import com.rezoana.show_room.model.Showroom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class ShowroomController {
     @Autowired
     ShowroomService shdao;
     
     @RequestMapping("/showingshowroom")
    public ModelAndView showshowroompage() {
        String showroomslist = shdao.viewShowroom();
        //System.out.println("this is "+ supplierslist);
        ModelAndView mv = new ModelAndView("addshowroom", "newShowroomObject", new Showroom());
        mv.addObject("showroomslist", showroomslist);
        mv.addObject("check", "true");
        return mv;
    }
    
     @RequestMapping(value = "/addingshowroom", params = "Addingshowroom")
    public String addshowroompage(@ModelAttribute("newShowroomObject") Showroom showroom) {
        shdao.insertShowroom(showroom);
        return "redirect:/showingshowroom";

    }
    
    
    @RequestMapping(value = "/addingshowroom", params = "EditingShowroom")
    public String editshowroompage(@ModelAttribute("newShowroomObject") Showroom showroom) {
        shdao.updateShowroom(showroom);
        return "redirect:/showingshowroom";

    }
    
    
     @RequestMapping("removingshowroom/{showroomId}")
    public String removecategory(@PathVariable("showroomId") String showroomid) {
        shdao.deleteShowroom(showroomid);
        return "redirect:/showingshowroom";
    }

    @RequestMapping("/editingshowroombutton")
    public ModelAndView editshowroombutton(@RequestParam("getshowroomid") String showroomid) {
        Showroom oneshowroom = shdao.viewOneShowroom(showroomid);

        ModelAndView mv = new ModelAndView("addshowroom", "newShowroomObject", oneshowroom);
        String showroomgsonlist = shdao.viewShowroom();
        mv.addObject("showroomslist", showroomgsonlist);
        mv.addObject("check", "false");
        return mv;
    }
     
    
}
