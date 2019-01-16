/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.ProductService;
import com.rezoana.show_room.dao.SaleDetailService;
import com.rezoana.show_room.dao.SaleService;
import com.rezoana.show_room.dao.ShowroomService;
import com.rezoana.show_room.dao.SupplierService;
import com.rezoana.show_room.model.Cart2;
import com.rezoana.show_room.model.Product;
import com.rezoana.show_room.model.Sale;
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
public class Cart2Controller {

    @Autowired
    ProductService productdao;
//    @Autowired
//    SupplierService supplier;
    @Autowired
    ShowroomService showroom;
    @Autowired
    SaleService saleService;
    @Autowired
    SaleDetailService saleDetailService;
    
     @RequestMapping("/showcartpage2")
    public ModelAndView showCartPage(HttpSession httpSession,Integer id) {
        //String phurchaselist = purchaseService.viewPurchase();
        String showroomslist = showroom.viewShowroom();
        String products = productdao.viewProduct();
        ModelAndView mv = new ModelAndView("addsale", "newsaleObject", new Sale());
        //mv.addObject("phurchaselist", phurchaselist);
        mv.addObject("showroomslist", showroomslist);
        mv.addObject("products", products);
        mv.addObject("check", "true");
        Gson g = new Gson();

        ArrayList<Cart2> c = (ArrayList<Cart2>) httpSession.getAttribute("usercart1");
        if (c.isEmpty()) {
            httpSession.setAttribute("cartempty", "true");
            mv.addObject("itemsincartt", "null");
            return mv;
        } else {
            String cartgson = g.toJson(c);
            mv.addObject("itemsincartt", cartgson);
            System.out.println(cartgson);
            httpSession.setAttribute("grandtotal2", getGrandTotal(c));
            httpSession.setAttribute("grandquantity1", getgrandquantity(c));
            httpSession.setAttribute("cartempty", "false");
            return mv;
        }
    }
    
     @RequestMapping("/addtocartt")
    public String addingToCart(HttpSession session, @ModelAttribute("newsaleObject") Sale sale) {

//        String phurchaselist = purchaseService.viewPurchase();
//        String vendorlist = vendor.viewVendorinfo();
//        String products = productdao.viewProduct();
//        ModelAndView mv = new ModelAndView("purchase", "newpurchaseObject", new Purchase());
//        mv.addObject("phurchaselist", phurchaselist);
//        mv.addObject("vendorlist", vendorlist);
//       mv.addObject("products", products);
//        mv.addObject("check", "true");
        Product pm = productdao.viewOneProduct(sale.getProductid());
        //Purchasedetail pd = purchaseDetailService.viewOnePurchasedetail(productId);
        //Purchase pp = purchaseService.viewOnePurchase(productId);
        //session.setAttribute("productid", productId);
        System.out.println(sale.getPrice());
        String flag = "not inserted";
        ArrayList<Cart2> cartarray = (ArrayList<Cart2>) session.getAttribute("usercart1");

        if (cartarray.isEmpty()) {
            cartarray.add(new Cart2(sale.getProductid(), pm.getProductname(),sale.getQuantity(), sale.getPrice(), sale.getQuantity()*sale.getPrice()));
            System.out.println(sale.getPrice());
            flag = "inserted";
        } else {
            Iterator<Cart2> lit = cartarray.iterator();
            while (lit.hasNext()) {
                Cart2 d = lit.next();
                if (d.getPid() == sale.getProductid()) {
                    int index = cartarray.indexOf(d);
                    String name = d.getPname();
                    int qty = d.getQty() + 1;
                    double price = d.getPrice();
                    cartarray.remove(index);
                    cartarray.add(index, new Cart2(sale.getProductid(), name, qty, price, ((qty) * price)));
                    session.setAttribute("usercart", cartarray);
                    flag = "inserted";
                    break;
                }
            }
            if (flag.equals("not inserted")) {
                cartarray.add(new Cart2(sale.getProductid(), pm.getProductname(), sale.getQuantity(), sale.getPrice(), sale.getQuantity()*sale.getPrice()  ));
                session.setAttribute("usercart", cartarray);
            }
        }
        session.setAttribute("grandquantity1", getgrandquantity(cartarray));
//        UserCartDetails usercart = new UserCartDetails();
//        Integer intcart = Integer.parseInt(session.getAttribute("Cartid").toString());
//        usercart.setCartid(Integer.parseInt(session.getAttribute("Cartid").toString()));
//        usercart.setProductsincart(cartarray.toString());
//        cdao.insertCartwithProducts(usercart);
        return "redirect:/showcartpage2";
    }
    
     public int getgrandquantity(ArrayList<Cart2> items) {
        int grandquant = 0;
        ListIterator<Cart2> itr = items.listIterator();
        while (itr.hasNext()) {
            Cart2 obj = (Cart2) itr.next();
            grandquant = grandquant + obj.getQty();
        }
        return grandquant;
    }
     
      public double getGrandTotal(ArrayList<Cart2> item) {
        double gtotal = 0;
        ListIterator<Cart2> itr = item.listIterator();
        while (itr.hasNext()) {
            Cart2 ob = (Cart2) itr.next();
            gtotal = gtotal + (ob.getQty() * ob.getPrice());
        }
        return gtotal;
    }
      
      @RequestMapping(value = "/editquantityy")
    public String editCart(@RequestParam("getproductid") int id, @RequestParam("value") String sign, HttpSession session) {
        ArrayList<Cart2> c = (ArrayList<Cart2>) session.getAttribute("usercart1");
        Iterator<Cart2> lit = c.iterator();
        while (lit.hasNext()) {
            Cart2 d = lit.next();
            int index = c.indexOf(d);
            if (d.getPid() == id) {
                String name = d.getPname();
                int qty = d.getQty();
                double price = d.getPrice();
                c.remove(index);
                if (sign.equals("decrease") && qty > 1) {
                    c.add(index, new Cart2(id, name, qty - 1, price, ((qty + 1) * price)));
                } else if (sign.equals("decrease") && qty == 1) {
                    c.add(index, new Cart2(id, name, 1, price, price));
                } else if (sign.equals("increase") && qty < 100) {
                    c.add(index, new Cart2(id, name, qty + 1, price, ((qty + 1) * price)));
                } else {
                    c.add(index, new Cart2(id, name, qty, price, ((qty) * price)));
                }
                break;
            }
        }
        session.setAttribute("grandquantity", getgrandquantity(c));
        session.setAttribute("usercart1", c);

        return "redirect:/showcartpage2";
    }

 @RequestMapping("/removeproductitemm")
    public String removeproductitemm(@RequestParam("pid") int productid, HttpSession session) {
        @SuppressWarnings("unchecked")
        ArrayList<Cart2> cartitems = (ArrayList<Cart2>) session.getAttribute("usercart1");
        Iterator<Cart2> list = (Iterator<Cart2>) cartitems.iterator();
        while (list.hasNext()) {
            Cart2 c = list.next();
            if (c.getPid() == productid) {
                cartitems.remove(cartitems.indexOf(c));
                break;
            }
        }
        session.setAttribute("grandquantity1", getgrandquantity(cartitems));
        session.setAttribute("usercart1", cartitems);
        return "redirect:/showcartpage2";
    }   


}
