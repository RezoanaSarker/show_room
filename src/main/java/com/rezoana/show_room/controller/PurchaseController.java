/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

import com.rezoana.show_room.dao.ProductService;
import com.rezoana.show_room.dao.PurchaseDetailService;
import com.rezoana.show_room.dao.PurchaseService;
import com.rezoana.show_room.dao.StockService;
import com.rezoana.show_room.dao.SupplierService;
import com.rezoana.show_room.model.Cart1;
import com.rezoana.show_room.model.Product;
import com.rezoana.show_room.model.Purchase;
import com.rezoana.show_room.model.Purchasedetail;
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

public class PurchaseController {
     @Autowired
    ProductService productdao;
    @Autowired
    SupplierService supplier;
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    StockService stock;
    @Autowired
    PurchaseDetailService purchaseDetailService;

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
    
      @RequestMapping("/purchasepage")
    public ModelAndView showsaletpage() {

        String purchaselist = purchaseService.viewPurchase();
        String supplierslist = supplier.viewSupplier();
        String products = productdao.viewProduct();

        ModelAndView mv = new ModelAndView("addpurchase", "newpurchaseObject", new Purchase());
        mv.addObject("purchaselist", purchaselist);
        mv.addObject("supplierslist", supplierslist);
        mv.addObject("products", products);
        mv.addObject("check", "true");
        return mv;
    }
    
     @RequestMapping(value = "/addpurchasepage", params = "Add")
    public String addproductpage(@ModelAttribute("newpurchaseObject") Purchase purchase, HttpServletRequest request, HttpSession httpSession) {
        
        ArrayList<Cart1> c = (ArrayList<Cart1>) httpSession.getAttribute("usercart2");
        String email = (String) httpSession.getAttribute("UserId");
        purchase.setAdmin(email);
        purchaseService.insertPurchase(purchase);
        System.out.println("start");
        Stock s=new Stock();
        Purchasedetail sorder1 = new Purchasedetail();
        int pq= sorder1.getPurchaseid();
        int xp= pq;
         ArrayList<Purchasedetail> odetail2 = new ArrayList<Purchasedetail>();
          ArrayList<Stock> detail = new ArrayList<Stock>();
        for (Cart1 cart : c) {
            System.out.println("fast");
            
            
            System.out.println("jslkjfldk");
            sorder1.setPurchaseid(purchase.getPurchaseid());
            if(sorder1.getPurchaseid() > xp){
                System.out.println("data is same");
                sorder1.setProductid(cart.getPid());
            sorder1.setQuantity(cart.getQty());
            sorder1.setPrice(cart.getPrice());
            System.out.println("end");
            odetail2.add(sorder1);
             purchaseDetailService.insertPurchasedetail(odetail2);
            
            s.setProductid(cart.getPid());
            s.setTotalstock(cart.getQty());
           detail.add(s);
           stock.insertStock(detail);
            }else{
              System.out.println(" done end");  
            }
            
            
            // get product and update quantity
//            Stock p = stock.viewOneStock(cart.getPid());
//            p.setTotalstock(p.getTotalstock()+ cart.getQty());
//           stock.updateStock(cart.getPid(), p);

 Product p = pdao.viewOneProduct(cart.getPid());
            p.setProductquantity(p.getProductquantity() + cart.getQty());
            pdao.updateProduct(cart.getPid(), p);




        }
         //purchaseDetailService.insertPurchasedetail(odetail2);
        odetail2.removeAll(odetail2);
        
        ModelAndView mv = new ModelAndView("addpurchase");
        
        mv.addObject("purchaseid", purchase.getPurchaseid());
        httpSession.setAttribute("usercart2", new ArrayList<Cart1>());
       
        return "redirect:/admin";
        
        
        
        
       // return "redirect:/phurchasepage";

    }
    
     @RequestMapping(value = "/addpurchasepage", params = "Edit")
    public String editProduct(@ModelAttribute("newpurchaseObject") Purchase purchase, HttpServletRequest request) {
        purchaseService.updatePurchase(purchase.getPurchaseid(), purchase);
      return "redirect:/purchasepage";
    }
    
     @RequestMapping("removingpurchase/{productId}")
    public String removeproduct(@PathVariable("productId") int productid) {
        purchaseService.deletePurchase(productid);
        return "redirect:/purchasepage";
    }
    
    @RequestMapping("/editingpurchase")
    public ModelAndView editproductpage(@RequestParam("getpid") int pid) {
        String purchaselist = purchaseService.viewPurchase();
        String supplierslist = supplier.viewSupplier();
        String products = productdao.viewProduct();
        ModelAndView mv = new ModelAndView("addpurchase", "newpurchaseObject", purchaseService.viewOnePurchase(pid));
        mv.addObject("purchaselist", purchaselist);
        mv.addObject("supplierslist", supplierslist);
        mv.addObject("products", products);
        mv.addObject("check", "false");
        return mv;
    }
    
}
