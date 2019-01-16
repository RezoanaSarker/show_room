/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.ProductService;
import com.rezoana.show_room.dao.PurchaseDetailService;
import com.rezoana.show_room.dao.PurchaseService;
import com.rezoana.show_room.dao.SupplierService;
import com.rezoana.show_room.model.Cart1;
import com.rezoana.show_room.model.Product;
import com.rezoana.show_room.model.Purchase;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rezwana
 */
@Controller
public class Cart1Controller {
     @Autowired
    ProductService productdao;
    @Autowired
    SupplierService supplier;
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    PurchaseDetailService purchaseDetailService;
    
     @RequestMapping("/showcartpage1")
    public ModelAndView showCartPage(HttpSession httpSession) {
        //String phurchaselist = purchaseService.viewPurchase();
        String supplierslist = supplier.viewSupplier();
        String products = productdao.viewProduct();
        ModelAndView mv = new ModelAndView("addpurchase", "newpurchaseObject", new Purchase());
        //mv.addObject("phurchaselist", phurchaselist);
        mv.addObject("supplierslist", supplierslist);
        mv.addObject("products", products);
        mv.addObject("check", "true");
        Gson g = new Gson();

        ArrayList<Cart1> c = (ArrayList<Cart1>) httpSession.getAttribute("usercart2");
        if (c.isEmpty()) {
            httpSession.setAttribute("cartempty", "true");
            mv.addObject("itemsincart1", "null");
            return mv;
        } else {
            String cartgson = g.toJson(c);
            mv.addObject("itemsincart1", cartgson);
            System.out.println(cartgson);
            httpSession.setAttribute("grandtotal1", getGrandTotal1(c));
            httpSession.setAttribute("grandquantity2", getgrandquantity2(c));
            httpSession.setAttribute("cartempty", "false");
            return mv;
        }
    }
    
     @RequestMapping("/addtocart1")
    public String addingToCart(HttpSession session, @ModelAttribute("newpurchaseObject") Purchase purchase) {

//        String phurchaselist = purchaseService.viewPurchase();
//        String vendorlist = vendor.viewVendorinfo();
//        String products = productdao.viewProduct();
//        ModelAndView mv = new ModelAndView("purchase", "newpurchaseObject", new Purchase());
//        mv.addObject("phurchaselist", phurchaselist);
//        mv.addObject("vendorlist", vendorlist);
//       mv.addObject("products", products);
//        mv.addObject("check", "true");
        Product pm = productdao.viewOneProduct(purchase.getProductid());
        //Purchasedetail pd = purchaseDetailService.viewOnePurchasedetail(productId);
        //Purchase pp = purchaseService.viewOnePurchase(productId);
        //session.setAttribute("productid", productId);
        System.out.println(purchase.getPrice());
        String flag = "not inserted";
        ArrayList<Cart1> cartarray = (ArrayList<Cart1>) session.getAttribute("usercart2");

        if (cartarray.isEmpty()) {
            cartarray.add(new Cart1(purchase.getProductid(), pm.getProductname(),purchase.getQuantity(), purchase.getPrice(), purchase.getQuantity()*purchase.getPrice()));
            System.out.println(purchase.getPrice());
            flag = "inserted";
        } else {
            Iterator<Cart1> lit = cartarray.iterator();
            while (lit.hasNext()) {
                Cart1 d = lit.next();
                if (d.getPid() == purchase.getProductid()) {
                    int index = cartarray.indexOf(d);
                    String name = d.getPname();
                    int qty = d.getQty() + 1;
                    double price = d.getPrice();
                    cartarray.remove(index);
                    cartarray.add(index, new Cart1(purchase.getProductid(), name, qty, price, ((qty) * price)));
                    session.setAttribute("usercart2", cartarray);
                    flag = "inserted";
                    break;
                }
            }
            if (flag.equals("not inserted")) {
                cartarray.add(new Cart1(purchase.getProductid(), pm.getProductname(), purchase.getQuantity(), purchase.getPrice(), purchase.getQuantity()*purchase.getPrice()  ));
                session.setAttribute("usercart2", cartarray);
            }
        }
        session.setAttribute("grandquantity2", getgrandquantity2(cartarray));
//        UserCartDetails usercart = new UserCartDetails();
//        Integer intcart = Integer.parseInt(session.getAttribute("Cartid").toString());
//        usercart.setCartid(Integer.parseInt(session.getAttribute("Cartid").toString()));
//        usercart.setProductsincart(cartarray.toString());
//        cdao.insertCartwithProducts(usercart);
        return "redirect:/showcartpage1";
    }
     public int getgrandquantity2(ArrayList<Cart1> items) {
        int grandquant = 0;
        ListIterator<Cart1> itr = items.listIterator();
        while (itr.hasNext()) {
            Cart1 obj = (Cart1) itr.next();
            grandquant = grandquant + obj.getQty();
        }
        return grandquant;
    }
     
     public double getGrandTotal1(ArrayList<Cart1> item) {
        double gtotal = 0;
        ListIterator<Cart1> itr = item.listIterator();
        while (itr.hasNext()) {
            Cart1 ob = (Cart1) itr.next();
            gtotal = gtotal + (ob.getQty() * ob.getPrice());
        }
        return gtotal;
    }
     
      @RequestMapping(value = "/editquantity1")
    public String editCart(@RequestParam("getproductid") int id, @RequestParam("value") String sign, HttpSession session) {
        ArrayList<Cart1> c = (ArrayList<Cart1>) session.getAttribute("usercart2");
        Iterator<Cart1> lit = c.iterator();
        while (lit.hasNext()) {
            Cart1 d = lit.next();
            int index = c.indexOf(d);
            if (d.getPid() == id) {
                String name = d.getPname();
                int qty = d.getQty();
                double price = d.getPrice();
                c.remove(index);
                if (sign.equals("decrease") && qty > 1) {
                    c.add(index, new Cart1(id, name, qty - 1, price, ((qty + 1) * price)));
                } else if (sign.equals("decrease") && qty == 1) {
                    c.add(index, new Cart1(id, name, 1, price, price));
                } else if (sign.equals("increase") && qty < 100) {
                    c.add(index, new Cart1(id, name, qty + 1, price, ((qty + 1) * price)));
                } else {
                    c.add(index, new Cart1(id, name, qty, price, ((qty) * price)));
                }
                break;
            }
        }
        session.setAttribute("grandquantity2", getgrandquantity2(c));
        session.setAttribute("usercart1", c);

        return "redirect:/showcartpage1";
    }
    
      @RequestMapping("/removeproductitem1")
    public String removeproductitem(@RequestParam("pid") int productid, HttpSession session) {
        @SuppressWarnings("unchecked")
        ArrayList<Cart1> cartitems = (ArrayList<Cart1>) session.getAttribute("usercart2");
        Iterator<Cart1> list = (Iterator<Cart1>) cartitems.iterator();
        while (list.hasNext()) {
            Cart1 c = list.next();
            if (c.getPid() == productid) {
                cartitems.remove(cartitems.indexOf(c));
                break;
            }
        }
        session.setAttribute("grandquantity2", getgrandquantity2(cartitems));
        session.setAttribute("usercart2", cartitems);
        return "redirect:/showcartpage1";
    }
    
}
