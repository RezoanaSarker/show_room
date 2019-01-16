/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.BillingAddressService;
import com.rezoana.show_room.dao.Userservice;
import com.rezoana.show_room.model.BillingAddress;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author B9
 */
@Controller
public class AddressController {
    @Autowired
    BillingAddressService bdao;
    @Autowired
    Userservice us;
    
    @RequestMapping("/billingaddresspage")
    public ModelAndView billingaddressPage(HttpSession httpSession) {
        String email = (String) httpSession.getAttribute("UserId");
        String addressesjson = bdao.viewBillingAddresses(email);
        //User urm = us.viewUser(email);
        BillingAddress bm = new BillingAddress();
        bm.setEmailid(email);
        ModelAndView mv = new ModelAndView("billingaddress", "billingAddressObj", bm);
        mv.addObject("addressesjson", addressesjson);
        httpSession.setAttribute("newobj", "true");
        return mv;
    }
    
     @RequestMapping(value = "/addnewaddress", params = "addnew")
    public String addnewaddress(@ModelAttribute("billingAddressObj") BillingAddress billingaddress, HttpSession httpSession) {
        String email = (String) httpSession.getAttribute("UserId");
        billingaddress.setEmailid(email);
        bdao.insertBillingAddress(billingaddress);
        httpSession.setAttribute("newobj", "false");
        return "redirect:/billingaddresspage";
    }
    
    @RequestMapping("/editaddress")
    public ModelAndView showeditaddresspage(@RequestParam("getaddressid") int addressid, HttpSession httpSession) {
        String email = (String) httpSession.getAttribute("UserId");
        String addressesjson = bdao.viewBillingAddresses(email);

        BillingAddress bm = (BillingAddress) bdao.viewOneBillingAddress(addressid);
        System.out.println("this is address line 1 " + bm.getAddresslineone());
        System.out.println("this is address line 2 " + bm.getAddresslinetwo());
        System.out.println("this is user " + bm.getEmailid());

        ModelAndView mv = new ModelAndView("billingaddress");
        mv.addObject("billingAddressObj", bm);
        mv.addObject("addressesjson", addressesjson);
        httpSession.setAttribute("newobj", "false");
        return mv;
    }
    
    @RequestMapping(value = "/addnewaddress", params = "edit")
    public String editingaddress(@ModelAttribute("billingAddressObj") BillingAddress billingaddress, HttpSession httpSession) {
        String email = (String) httpSession.getAttribute("UserId");
        //User urm = us.viewUser(email);
        billingaddress.setEmailid(email);
        int billingaddresid = billingaddress.getAddressid();
        bdao.updateBillingAddress(billingaddresid, billingaddress);
        httpSession.setAttribute("newobj", "false");
        return "redirect:/billingaddresspage";
    }
    
     @RequestMapping("/removeaddress")
    public String removeaddress(@RequestParam("getaddressid") int addressid, HttpSession httpSession) {

        bdao.deleteBillingAddress(addressid);
        httpSession.setAttribute("newobj", "false");
        return "redirect:/billingaddresspage";
    }
}
