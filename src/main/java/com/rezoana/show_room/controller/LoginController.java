package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.Userservice;
import com.rezoana.show_room.dao.ViewProductOrderService;
import com.rezoana.show_room.model.Cart;
import com.rezoana.show_room.model.Cart1;
import com.rezoana.show_room.model.Cart2;
import com.rezoana.show_room.model.User;
import com.rezoana.show_room.model.UserRole;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @Autowired
    Userservice user;
     @Autowired
    ViewProductOrderService vdao;

   @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLogin() {
        return "login";
    }
    
    @RequestMapping("/perlogcheck")
    public String prologin(HttpSession session, @RequestParam("getProductId") int id) {
        //logger.info("Inside prologin method in login controller");
        session.setAttribute("pId", id);
        //logger.info("end of prologin method in login controller");
        return "login";
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String showWelcome() {
        return "welcome";
    }
      @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView showAdmin() {
        String orderlist = vdao.viewProductOrder();
        ModelAndView mv = new ModelAndView("admin");
        mv.addObject("orderlist", orderlist);
        //logger.info("End of Landingpage in home controller");
        return mv;
    }

    @RequestMapping(value = "/loginsuccess")
    public String loginsuccess(HttpSession session) {
        System.out.println("success..........");

        String userid = SecurityContextHolder.getContext().getAuthentication().getName();
        User us = user.viewUser(userid);
        Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        String page = "";
        String role = "ROLE_USER";
        for (GrantedAuthority authority : authorities) {
            if (authority.getAuthority().equals(role)) {
                session.setAttribute("UserLoggedIn", us.getUsername());
                session.setAttribute("UserId", userid);
                session.setAttribute("usercart", new ArrayList<Cart>());
                session.setAttribute("usercart2", new ArrayList<Cart1>());
                session.setAttribute("usercart1", new ArrayList<Cart2>());
                page= "redirect:/welcome";
            }
            else if (authority.getAuthority().equals("ROLE_ADMIN")) {
                session.setAttribute("UserLoggedIn", us.getUsername());
                session.setAttribute("UserId", userid);
                session.setAttribute("usercart", new ArrayList<Cart>());
                session.setAttribute("usercart2", new ArrayList<Cart1>());
                session.setAttribute("usercart1", new ArrayList<Cart2>());
               // session.setAttribute("usercart2", new ArrayList<Cart1>());
                page= "redirect:/admin";
            }
            else{
            page= "redirect:/";
            }
        }
        return page;
    }
}
