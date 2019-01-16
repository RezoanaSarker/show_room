/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.PaymentService;
import com.rezoana.show_room.dao.PurchaseService;
import com.rezoana.show_room.dao.SupplierService;
import com.rezoana.show_room.model.Payment;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
public class PaymentController {
     @Autowired
    PaymentService vps;
    @Autowired
    SupplierService vs;
    @Autowired
    PurchaseService ps;
    @Autowired
    private ServletContext servletContext;
    
     @InitBinder
    public void myInitBinder(WebDataBinder binder) {
        //binder.setDisallowedFields(new String[]{"empMobile"});
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        binder.registerCustomEditor(Date.class, "paydate", new CustomDateEditor(format, false));
//        binder.registerCustomEditor(String.class, "ename", new EmployeeNameEditor());
    }
    
     @RequestMapping("/showpaymentpage")
    public ModelAndView showpaytpage() {
        
        String  payment = vps.viewPayment();
        String supplierServicelist = vs.viewSupplier();
        String purchaseService = ps.viewPurchase();

        ModelAndView mv = new ModelAndView("addpayment1", "newpaymentObject", new Payment());
        mv.addObject("payment", payment);
        mv.addObject("supplierServicelist", supplierServicelist);
        mv.addObject("purchaseService", purchaseService);
        mv.addObject("check", "true");
        return mv;
    }
    @RequestMapping(value = "/payadd", params = "Add")
    public String addproductpage(@ModelAttribute("newpaymentObject") Payment payment, HttpServletRequest request , HttpSession httpSession) {
       String email = (String) httpSession.getAttribute("UserId");
        payment.setUser(email);
        vps.insertPayment(payment);
        
        return "redirect:/showpaymentpage";
    }
    
     @RequestMapping(value = "/payadd", params = "Edit")
    public String editProduct(@ModelAttribute("newpaymentObject") Payment payment, HttpServletRequest request) {
        vps.updatePayment(payment.getPaymentid(), payment);
        
        return "redirect:/showpaymentpage";
    }
    
     @RequestMapping("removingpay/{productId}")
    public String removeproduct(@PathVariable("productId") int productid) {
        vps.deletePayment(productid);
        return "redirect:/showpaymentpage";
    }
    
     @RequestMapping("/editingpay")
    public ModelAndView editproductpage(@RequestParam("getpid") int pid) {
        String  payment = vps.viewPayment();
        String supplierServicelist = vs.viewSupplier();
        String purchaseService = ps.viewPurchase();
        ModelAndView mv = new ModelAndView("addpayment1", "newpaymentObject", vps.viewOnePayment(pid));
       mv.addObject("payment", payment);
        mv.addObject("supplierServicelist", supplierServicelist);
        mv.addObject("purchaseService", purchaseService);
        mv.addObject("check", "false");
        return mv;
    }  

    
}
