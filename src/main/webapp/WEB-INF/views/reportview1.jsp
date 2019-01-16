<%-- 
    Document   : reportview1
    Created on : Jan 4, 2019, 11:39:06 AM
    Author     : Rezwana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .error {
                color: #ff0000;
            }

        </style>
    </head>
    <body>
        <h2>Report example</h2>

        <form:form method="POST" action="reportView1" commandName="reportInputForm">

            <table id="reptbl" width="350px" border="1">
                 <tr>
                    <td colspan="2"><form:errors path="supplierid" cssClass="error"/></td> </tr>
                <tr>
              
                    <td>
                        Enter Report Title <form:input path="supplierid" />
                        <input type="submit"  value="Generate Report"  />
                    </td> 

                </tr>
            </table>  
        </form:form>
    </body>
</html>

