/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.google.gson.Gson;
import com.rezoana.show_room.dao.ProductService;
import com.rezoana.show_room.dao.PurchaseDetailService;
import com.rezoana.show_room.dao.SaleDetailService;
import com.rezoana.show_room.dao.SaleService;
import com.rezoana.show_room.dao.ShowroomService;
import com.rezoana.show_room.dao.StockService;
import com.rezoana.show_room.dao.SupplierService;
import com.rezoana.show_room.model.Cart2;
import com.rezoana.show_room.model.Product;
import com.rezoana.show_room.model.Sale;
import com.rezoana.show_room.model.Saledetail;
import com.rezoana.show_room.model.Stock;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class SaleController {

    @Autowired
    SaleService saleService;
//    @Autowired
//    SupplierService supplier;
    @Autowired
    ShowroomService showroom;
    @Autowired
    ProductService productdao;
    @Autowired
    PurchaseDetailService purchaseDetailService;

    @Autowired
    SaleDetailService saleDetailService;

    @Autowired
    StockService stockservice;

    @Autowired
    private ServletContext servletContext;
     @Autowired
    ProductService pdao;

    @InitBinder
    public void myInitBinder(WebDataBinder binder) {
        //binder.setDisallowedFields(new String[]{"empMobile"});
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        binder.registerCustomEditor(Date.class, "saledate", new CustomDateEditor(format, false));
//        binder.registerCustomEditor(String.class, "ename", new EmployeeNameEditor());
    }

    @RequestMapping("/salepage")
    public ModelAndView showsaletpage() {

        String salelist = saleService.viewSale();
        String showroomslist = showroom.viewShowroom();
        String productlist = productdao.viewProduct();

        ModelAndView mv = new ModelAndView("addsale", "newsaleObject", new Sale());
        mv.addObject("salelist", salelist);
        mv.addObject("showroomslist", showroomslist);
        mv.addObject("productlist", productlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addsaleshow", params = "Add")
    public String addproductpage(@ModelAttribute("newsaleObject") Sale sale, HttpServletRequest request, HttpSession httpSession) {
        ArrayList<Cart2> c = (ArrayList<Cart2>) httpSession.getAttribute("usercart1");
        String email = (String) httpSession.getAttribute("UserId");
        sale.setAdmin(email);
        saleService.insertSale(sale);
        System.out.println("start");
        Saledetail sorder = new Saledetail();
        int pq = sorder.getSaleid();
        int xp = pq;
        ArrayList<Saledetail> odetail = new ArrayList<Saledetail>();
        for (Cart2 cart : c) {
            System.out.println("fast");

            System.out.println("jslkjfldk");
            sorder.setSaleid(sale.getSaleid());
            if (sorder.getSaleid() > xp) {
                System.out.println("data is same");
                sorder.setProductid(cart.getPid());
                sorder.setQuantity(cart.getQty());
                sorder.setPrice(cart.getPrice());
                System.out.println("end");
                odetail.add(sorder);
                saleDetailService.insertSaledetail(odetail);
            } else {
                System.out.println(" done end");
            }

//            // get product and update quantity
//            Stock p = stockservice.viewOneStock(cart.getPid());
//            p.setTotalstock(p.getTotalstock() - cart.getQty());
//            stockservice.updateStock(cart.getPid(), p);


 Product p = pdao.viewOneProduct(cart.getPid());
            p.setProductquantity(p.getProductquantity() - cart.getQty());
            pdao.updateProduct(cart.getPid(), p);

        }
        //purchaseDetailService.insertPurchasedetail(odetail2);
        odetail.removeAll(odetail);

        ModelAndView mv = new ModelAndView("addpurchase");

        mv.addObject("saleid", sale.getSaleid());
        httpSession.setAttribute("usercart1", new ArrayList<Cart2>());

        return "redirect:/admin";

    }

    @RequestMapping(value = "/addsaleshow", params = "Edit")
    public String editProduct(@ModelAttribute("newsaleObject") Sale sale, HttpServletRequest request) {
        saleService.updateSale(sale.getSaleid(), sale);

        return "redirect:/salepage";
    }

    @RequestMapping("removingsale/{productId}")
    public String removeproduct(@PathVariable("productId") int productid) {
        saleService.deleteSale(productid);
        return "redirect:/salepage";
    }

    @RequestMapping("/editingsale")
    public ModelAndView editproductpage(@RequestParam("getpid") int pid) {
        String salelist = saleService.viewSale();
        String showroomslist = showroom.viewShowroom();
        String products = productdao.viewProduct();
        ModelAndView mv = new ModelAndView("addsale", "newsaleObject", saleService.viewOneSale(pid));
        mv.addObject("salelist", salelist);
        mv.addObject("showroomslist", showroomslist);
        mv.addObject("product", products);
        mv.addObject("check", "false");
        return mv;
    }

   // @RequestMapping("/viewproduct")
   // public ModelAndView viewproductdata(@RequestParam("getId") int productid, HttpSession session) {
    // Gson g = new Gson();
    // String productdata = g.toJson(purchaseDetailService.viewOnePurchasedetail(productid));
    //session.setAttribute("productid", productid);
   //  ModelAndView mv = new ModelAndView("addsale");
   //  mv.addObject("pro", productdata);
   // return mv;
    // }
}
