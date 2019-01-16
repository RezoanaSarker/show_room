/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.controller;

/**
 *
 * @author Rezwana
 */

import com.rezoana.show_room.daoimple.JasperReportDAO;
import com.rezoana.show_room.reportmodel.ProductReportmodel;
import com.rezoana.show_room.reportmodel.PurchaseMainReportmodel;
import com.rezoana.show_room.reportmodel.SalaryReportmodel;
import com.rezoana.show_room.reportmodel.SaleMainReportmodel;
import com.rezoana.show_room.reportmodel.Salereportmodel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;


@Controller
public class ReportController1 {
    
    
      @RequestMapping(value = "/reportView1", method = RequestMethod.GET)
    public String loadSurveyPg(
            @ModelAttribute("reportInputForm") Salereportmodel  reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "reportview1";
    }
    
    @RequestMapping(value = "/reportView1", method = RequestMethod.POST)
    public String generateReport(@ModelAttribute("reportInputForm") Salereportmodel  reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "report1";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            int supplierid = reportInputForm.getSupplierid();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("supplierid", supplierid);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
       @RequestMapping(value = "/ProductReportView", method = RequestMethod.GET)
    public String loadProductPg(
            @ModelAttribute("reportInputForm") ProductReportmodel  reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "productreportview";
    }
    
    @RequestMapping(value = "/ProductReportView", method = RequestMethod.POST)
    public String generateProductReport(@ModelAttribute("reportInputForm") ProductReportmodel  reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "productreport";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            int productprice = reportInputForm.getProductprice();
           // String suppliername = reportInputForm.getSuppliername();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("productprice", productprice);
           // hmParams.put("suppliername", suppliername);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
            @RequestMapping(value = "/SalaryReportView", method = RequestMethod.GET)
    public String loadSalaryPg(
            @ModelAttribute("reportInputForm") SalaryReportmodel  reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "salaryreportview";
    }
    
    @RequestMapping(value = "/SalaryReportView", method = RequestMethod.POST)
    public String generateSalaryReport(@ModelAttribute("reportInputForm") SalaryReportmodel  reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "salaryreport2";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            int empid = reportInputForm.getEmpid();
           // String suppliername = reportInputForm.getSuppliername();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("empid", empid);
           // hmParams.put("suppliername", suppliername);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
             @RequestMapping(value = "/SalaryReportVieww", method = RequestMethod.GET)
    public String loadSalarPg(
            @ModelAttribute("reportInputForm") SalaryReportmodel  reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "salaryreportview";
    }
    
    @RequestMapping(value = "/SalaryReportVieww", method = RequestMethod.POST)
    public String generateSalarReport(@ModelAttribute("reportInputForm") SalaryReportmodel  reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "salaryreport1";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            int bas = reportInputForm.getBas();
           // String suppliername = reportInputForm.getSuppliername();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("bas", bas);
           // hmParams.put("suppliername", suppliername);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
            @RequestMapping(value = "/SaledetailReportView", method = RequestMethod.GET)
    public String loadSalemainPg(
            @ModelAttribute("reportInputForm") SaleMainReportmodel  reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "saledetailreportview";
    }
    
    @RequestMapping(value = "/SaledetailReportView", method = RequestMethod.POST)
    public String generateSalemainReport(@ModelAttribute("reportInputForm") SaleMainReportmodel  reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "mainreportsale";
       // String reportFileName = "mainreportsale_subreport";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String sid = reportInputForm.getSid();
           // String SUBREPORT_DIR = reportInputForm.getSUBREPORT_DIR();
           // String suppliername = reportInputForm.getSuppliername();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("sid", sid);
           // hmParams.put("SUBREPORT_DIR", SUBREPORT_DIR);
           // hmParams.put("suppliername", suppliername);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
                @RequestMapping(value = "/PurchasedetailReportView", method = RequestMethod.GET)
    public String loadPurchasemainPg(
            @ModelAttribute("reportInputForm") PurchaseMainReportmodel  reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "purchasedetailreportview";
    }
    
    @RequestMapping(value = "/PurchasedetailReportView", method = RequestMethod.POST)
    public String generatePurchasemainReport(@ModelAttribute("reportInputForm") PurchaseMainReportmodel  reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "mainpurchasereport";
       // String reportFileName = "mainreportsale_subreport";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String pid = reportInputForm.getPid();
           // String SUBREPORT_DIR = reportInputForm.getSUBREPORT_DIR();
           // String suppliername = reportInputForm.getSuppliername();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("pid", pid);
           // hmParams.put("SUBREPORT_DIR", SUBREPORT_DIR);
           // hmParams.put("suppliername", suppliername);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
}
