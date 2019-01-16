<%-- 
    Document   : addpayment
    Created on : Dec 26, 2018, 9:36:09 AM
    Author     : Rezwana
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style type="text/css">

            .panel>.panel-heading {
                color: #558b2f;
                background-color: #aed581;
                border-color: #aed581;
            }
            .panel>.panel-body
            {
                background-color: #f1f8e9;
                border-color: #aed581;
            }

            .form-control:FOCUS
            {
                border: 2px thin #9ccc65;
                border-radius: 5px;
            }
            .list-group-item {
                overflow: hidden;
            }
            #removebuttons
            {
                color: #ffffff;
                background-color: #e57373;
            }
            #removebuttons:HOVER {
                color: #ffffff;
                background-color: #e53935;
            }
            #editbuttons{
                color: #ffffff;
                background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);	
            }
            #editbuttons:HOVER {
                color: #ffffff;
                background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);	
            }
        </style>
        <script src="resources/js/angular.js"></script>

        <script>
            var payment = ${payment};
            var supplierServicelist = ${supplierServicelist};
            var purchaseService = ${purchaseService};

            angular.module('organocartpackage', []).controller('ProductController',
                    function ($scope) {
                        $scope.payment = payment;
                        $scope.supplierServicelist = supplierServicelist;
                        $scope.purchaseService = purchaseService;
                        console.log($scope.purchaseService);
                    });
        </script>
    </head>
    <body ng-app="organocartpackage" ng-controller="ProductController">
        <jsp:include page="header.jsp" />
        <div class="container-fluid"
             style="width: 90%; margin-top: 10px; margin-bottom: 10px">

            <div class="panel animated fadeInDown delay-05s" id="panel-1">
                <div class="panel-heading">
                    <span class="lead">Managing Payment</span>
                    <a href="welcome">Admin</a>
                </div>
                <!-- end panel heading -->
                <div class="panel-body">
                    <div class="formcontainer ">

                        <form:form commandName="newpaymentObject" action="payadd"
                                   enctype="multipart/form-data">
                            <c:if test="${check}">
                                <div class="form-group">

                                    <form:input class="form-control" Placeholder="Payment Id"
                                                type="text" path="paymentid" required="true"></form:input>
                                </div>
                            </c:if>
                            <c:if test="${!check}">
                                <div class="form-group">
                                    <form:input class="form-control" Placeholder="Payment Id"
                                                type="text" path="paymentid" readonly="true" required="true"></form:input>
                                </div>
                            </c:if>
                            
                             
                                <div class="form-group">
                                <form:input type="text" class="form-control" Placeholder="Showroom Id" value="{{purchase.supplierid}}" path="supplierid"></form:input>
                                </div>
                                
                                <div class="form-group">
                                <form:input type="number" class="form-control"
                                            Placeholder="Bill-total " path="amount" value="{{purchase.billtotal}}" required="true" readonly="true"></form:input>
                                </div>
                                
                            
                                <div class="form-group">
                                <form:input type="text" class="form-control"  path="paydate" placeholder="Pay Date" required="true" id="date" ></form:input>

                                </div>
                                
                                <div class="form-group">
                                <form:input type="text" class="form-control"
                                            Placeholder="remarks " path="remarks" required="true"></form:input>
                                </div>
                                
                                <div class="form-group">
                                <select class="form-control" ng-model="purchase" ng-options="x.purchaseid   for x in purchaseService" required="true">
                                    <option value="">-- purchase id --</option>
                                </select>
                                </div>
                                <div class="form-group">
                                <form:hidden  class="form-control" value="{{purchase.purchaseid}}" path="purchaseid"></form:hidden>
                                </div>
                                 
                                
                            <c:if test="${check}">
                                <form:button id="editbuttons" type="submit" name="Add" class="btn">Add
                                    Details</form:button>
                                <form:button id="removebuttons" type="reset" class="btn">Reset
                                    Details</form:button>
                            </c:if>
                            <c:if test="${!check}">
                                <form:button id="editbuttons" type="submit" name="Edit" class="btn">Edit
                                    Details</form:button>
                                <form:button id="removebuttons" type="reset" class="btn">Reset
                                    Details</form:button>
                            </c:if>
                            <a href="showsalarytpage"><button id="show" type="button" class="btn">Cancel</button></a>        
                        </form:form>
                    </div>
                    <!-- panel body end -->
                </div>
            </div>
            <!-- panel end -->
            <div class="panel animated fadeInUp delay-05s" id="panel-2">
                <div class="panel-heading">
                    <span class="lead">Payment List</span>
                </div>
                <p><input type="text" ng-model="test" class="form-control" placeholder="Search payment"></p>
                <!-- end panel2 heading -->
                <div class="panel-body">
                    <ul class="list-group">
                        <li class="list-group-item" height="45px"
                            ng-repeat="s in payment| filter:test">
                            <table style="width: 100%">
                                <tr>
                                   
                                    <td>
                                        <ul>
                                            <li><span><b>payment Id: </b></span>{{s.paymentid}}</li>
                                            <li><span><b>Supplier Id </b></span>{{s.supplierid}}</li>
                                            <li><span><b>purchase Id </b></span>{{s.purchaseid}}</li>
                                            <li><span><b>pay Date </b></span>{{s.paydate}}</li>
                                             <li><span><b>Amount </b></span>{{s.amount}}</li>
                                            <li><span><b>remarks: </b></span>{{s.remarks}}</li>
                                            <li><span><b>Status </b></span>{{s.status}}</li>
                                            
                                        </ul>
                                    </td>
                                    <td><a href="editingpay?getpid={{s.paymentid}}"><button id="editbuttons"
                                                                                                      type="submit" class="btn">Edit</button></a> <a
                                            href="removingpay/{{s.paymentid}}"><button id="removebuttons"
                                                                                             type="button" class="btn">Remove</button></a></td>
                                </tr>
                            </table>
                        </li>
                    </ul>
                </div>
                <!-- panel2 body end -->
            </div>
            <!-- panel2 end -->
        </div>

        <jsp:include page="footer.jsp" />


        <!--<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>-->

        <!-- Include Date Range Picker -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

        <script>
                                                        $(document).ready(function () {
                                                            var date_input = $('input[name="paydate"]'); //our date input has the name "date"
                                                            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                                                            date_input.datepicker({
                                                                format: 'yyyy/mm/dd',
                                                                container: container,
                                                                todayHighlight: true,
                                                                autoclose: true,
                                                            })
                                                        })
        </script>

        <!--     Form code begins 
            <form method="post">
              <div class="form-group">  Date input 
                <label class="control-label" for="date">Date</label>
                <input class="form-control" id="date" name="date" placeholder="MM/DD/YYY" type="text"/>
              </div>
             </form>-->
    </body>
</html>
