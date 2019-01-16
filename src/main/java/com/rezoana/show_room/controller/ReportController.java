package com.rezoana.show_room.controller;

import com.rezoana.show_room.daoimple.JasperReportDAO;
import com.rezoana.show_room.model.Payment;
import com.rezoana.show_room.reportmodel.PaymentReport;
import com.rezoana.show_room.reportmodel.ProductReportDatemodel;
import com.rezoana.show_room.reportmodel.PurchaseReportdatemodel;
import com.rezoana.show_room.reportmodel.ReceivepaymentReport;
import com.rezoana.show_room.reportmodel.SalaryDateReportmodel;
import com.rezoana.show_room.reportmodel.SaleReportdatemodel;
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

/**
 *
 * @author User
 */
@Controller
public class ReportController {
    
    @RequestMapping(value = "/reportView", method = RequestMethod.GET)
    public String loadSurveyPg(
            @ModelAttribute("reportInputForm") Salereportmodel  reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "reportview";
    }
    
    @RequestMapping(value = "/reportView", method = RequestMethod.POST)
    public String generateReport(@ModelAttribute("reportInputForm") Salereportmodel  reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "report";
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
    
    
    @RequestMapping(value = "/paymentView", method = RequestMethod.GET)
    public String loadSupveyPg(
            @ModelAttribute("reportInputForm") PaymentReport  reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "paymentreport";
    }
    
    @RequestMapping(value = "/paymentView", method = RequestMethod.POST)
    public String generatpReport(@ModelAttribute("reportInputForm") PaymentReport  reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "payment";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            int pid = reportInputForm.getPid();
             String  sname = reportInputForm.getSname();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("pid", pid);
             hmParams.put("sname", sname);
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
    
    
     @RequestMapping(value = "/receiveview", method = RequestMethod.GET)
    public String loadreceivePg(
            @ModelAttribute("reportInputForm") ReceivepaymentReport reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "receiveReport";
    }
    
    @RequestMapping(value = "/receiveview", method = RequestMethod.POST)
    public String generatereceiveReport(@ModelAttribute("reportInputForm") ReceivepaymentReport reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "receivepayreport";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            int sid = reportInputForm.getSid();
             String sname = reportInputForm.getSname();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("sid", sid);
             hmParams.put("sname", sname);
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
    
    
      @RequestMapping(value = "/productdateview", method = RequestMethod.GET)
    public String loadProductdatePg(
            @ModelAttribute("reportInputForm") ProductReportDatemodel reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "productdatereport";
    }
    
    @RequestMapping(value = "/productdateview", method = RequestMethod.POST)
    public String generateProductdateReport(@ModelAttribute("reportInputForm") ProductReportDatemodel reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "productreportdate";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String start_date = reportInputForm.getStart_date();
             String end_date = reportInputForm.getEnd_date();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("start_date", start_date);
             hmParams.put("end_date", end_date);
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
    
    
       @RequestMapping(value = "/purchasedateview", method = RequestMethod.GET)
    public String loadPurchasedatePg(
            @ModelAttribute("reportInputForm") PurchaseReportdatemodel reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "purchasedatereport";
    }
    
    @RequestMapping(value = "/purchasedateview", method = RequestMethod.POST)
    public String generatePurchasedateReport(@ModelAttribute("reportInputForm") PurchaseReportdatemodel reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "purchasereport";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String start_date = reportInputForm.getStart_date();
             String end_date = reportInputForm.getEnd_date();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("start_date", start_date);
             hmParams.put("end_date", end_date);
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
    
    
       @RequestMapping(value = "/saledateview", method = RequestMethod.GET)
    public String loadSaledatePg(
            @ModelAttribute("reportInputForm") SaleReportdatemodel reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "saledatereportview";
    }
    
    @RequestMapping(value = "/saledateview", method = RequestMethod.POST)
    public String generateSaledateReport(@ModelAttribute("reportInputForm") SaleReportdatemodel reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "saledatereport";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String start_date = reportInputForm.getStart_date();
             String end_date = reportInputForm.getEnd_date();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("start_date", start_date);
             hmParams.put("end_date", end_date);
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
    
         @RequestMapping(value = "/salarydateview", method = RequestMethod.GET)
    public String loadSalarydatePg(
            @ModelAttribute("reportInputForm") SalaryDateReportmodel reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "salarydatereportview";
    }
    
    @RequestMapping(value = "/salarydateview", method = RequestMethod.POST)
    public String generateSalarydateReport(@ModelAttribute("reportInputForm") SalaryDateReportmodel reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "salarydatereport";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String start_date = reportInputForm.getStart_date();
             String end_date = reportInputForm.getEnd_date();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("start_date", start_date);
             hmParams.put("end_date", end_date);
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
