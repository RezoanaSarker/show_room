<%-- 
    Document   : addreceive
    Created on : Dec 28, 2018, 9:02:32 PM
    Author     : Rezwana
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin - Add Receive</title>
        <link href="resources/img/logo.ico" rel="shortcut icon" />
        <!-- Bootstrap core CSS-->
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template-->
        <link href="resources/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="resources/datatables/dataTablesbootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="resources/cssnew/sb-admin.css" rel="stylesheet">
        <script src="resources/js/angular.js"></script>
        <script>
            var receivepayment = ${receivepayment};
            var showroomService = ${showroomService};
            var saleService = ${saleService};

            angular.module('organocartpackage', []).controller('ProductController',
                    function ($scope) {
                        $scope.receivepayment = receivepayment;
                        $scope.showroomService = showroomService;
                        $scope.saleService = saleService;
                        console.log($scope.saleService);
                    });
        </script>
        
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
        

    </head>
    <body id="page-top" ng-app="organocartpackage" ng-controller="ProductController">
        <nav class="navbar navbar-expand navbar-dark bg-info static-top">

            <a class="navbar-brand mr-1 card-header" href="admin"> Fashion Fiesta Showroom</a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Navbar Search -->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>

            <!-- Navbar -->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-bell fa-fw"></i>
                        <span class="badge badge-danger">9+</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-envelope fa-fw"></i>
                        <span class="badge badge-danger">7</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle fa-fw"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Hello ${sessionScope.UserLoggedIn}</a>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>">Home</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
                    </div>
                </li>
            </ul>

        </nav>
                         <div id="wrapper">
        <ul class="sidebar navbar-nav bg-info">
            <li class="nav-item active">
                <a class="nav-link" href="admin">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span class="card-body badge-info">Dashboard</span>
                </a>
            </li>
            <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span class=" card-body badge-info">Pages</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <h6 class="dropdown-header">Settings:</h6>
                        <a class="dropdown-item" href="showingcategorypage">Add Category</a>
                        <a class="dropdown-item" href="showsupplier">Add Supplier</a>
                        <a class="dropdown-item" href="showingshowroom">Add Showroom</a>
                        <a class="dropdown-item" href="showproductpage">Add Product</a>
                        
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Report:</h6>
                        <a class="dropdown-item" href="productdateview">Product Report(date)</a>
<!--                        <a class="dropdown-item" href="SaledetailReportView">product list</a>-->
                        <a class="dropdown-item" href="ProductReportView" target="_blank">Product Report</a>
                    </div>
                </li><br>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span class=" card-body badge-info">Purchase</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <h6 class="dropdown-header">Settings:</h6>
                        <a class="dropdown-item" href="showcartpage1">Add Purchase</a>
                        <a class="dropdown-item" href="showpurchase">View Purchase </a>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Report:</h6>
<!--                        <a class="dropdown-item" href="viewShowpurchase">View Purchase</a>-->
                        <a class="dropdown-item" href="PurchasedetailReportView">Purchase Details</a>
                        <a class="dropdown-item" href="purchasedateview" target="_blank">Purchase Report(date)</a>
                    </div>
                </li><br>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span class=" card-body badge-info">Sale</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <h6 class="dropdown-header">Settings:</h6>
                        <a class="dropdown-item" href="showcartpage2">Add Sale</a>
                        <a class="dropdown-item" href="showsale">View Sale </a>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Report:</h6>
<!--                        <a class="dropdown-item" href="showsale">View Sale</a>
                        <a class="dropdown-item" href="#">Manage Sale</a>-->
                        <a class="dropdown-item" href="saledateview">Sale Report(date)</a>
                        <a class="dropdown-item" href="SaledetailReportView">Sale Details</a>
                    </div>
                </li><br>
                
                 <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span class=" card-body badge-info">Transaction</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <h6 class="dropdown-header">Settings:</h6>
                        <a class="dropdown-item" href="showpaymentpage">Payment</a>
                        <a class="dropdown-item" href="showreceivepaytpage">Receive</a>
                        <a class="dropdown-item" href="receiveview">Receive Report</a>
                        
                        <h6 class="dropdown-header">Report:</h6>
<!--                        <a class="dropdown-item" href="viewShowpurchase">View Purchase</a>-->
                        <a class="dropdown-item" href="paymentView">Payment Report</a>
                        <a class="dropdown-item" href="receiveview" target="_blank">Receive Report</a>
                        
                    </div>
                </li><br>



                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span class="card-body badge-info"> Staff</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <h6 class="dropdown-header">Settings:</h6>
                        <a class="dropdown-item" href="showingEmployeeinfo">Add Staff</a>
                        <a class="dropdown-item" href="showattendpage">Staff Attendance</a>
                        <a class="dropdown-item" href="showsalarytpage">Staff Salary</a>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Report:</h6>
<!--                        <a class="dropdown-item" href="showingEmployeeinfo">View Staff</a>
                        <a class="dropdown-item" href="showingEmployeeinfo">Manage Staff</a>-->
                        <a class="dropdown-item" href="SalaryReportView" target="_blank">Staff Report</a>
                        <a class="dropdown-item" href="salarydateview" target="_blank">Staff Report(date)</a>
                    </div>
                </li><br>

            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span class="card-body badge-info">Charts</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span class="card-body badge-info">Tables</span></a>
            </li>
        </ul>
        <div id="content-wrapper">

            <div class="container-fluid">

                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="#">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Receive System</li>
                </ol>      

                <!-- end panel heading -->
               <div class="panel-body">
                    <div class="formcontainer ">

                        <form:form commandName="newreceiveObject" action="receiveadd"
                                   enctype="multipart/form-data">
                            <c:if test="${check}">
                                <div class="form-group">

                                    <form:input class="form-control" Placeholder="Receive Id"
                                                type="text" path="receiveid" required="true"></form:input>
                                    </div>
                            </c:if>
                            <c:if test="${!check}">
                                <div class="form-group">
                                    <form:input class="form-control" Placeholder="Receive Id"
                                                type="text" path="receiveid" readonly="true" required="true"></form:input>
                                    </div>
                            </c:if>
                             <div class="form-group">
                                    <select class="form-control" ng-model="sale" ng-options="x.saleid  for x in saleService" required="true">
                                        <option value="">-- Sale id --</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                <form:hidden  class="form-control" value="{{sale.saleid}}" path="saleid"></form:hidden>
                                </div>


                            <div class="form-group">
                                <form:input type="text" class="form-control" Placeholder="Showroom Id" value="{{sale.showroomid}}" path="showroomid" required="true"></form:input>
                                </div>

                                <div class="form-group">
                                <form:input type="number" class="form-control"
                                            Placeholder="Bill-Total " path="amount" value="{{sale.billtotal}}" required="true" readonly="true"></form:input>
                                </div>


                                <div class="form-group">
                                <form:input type="text" class="form-control"  path="date" placeholder="Receive Date" required="true" id="date" ></form:input>

                                </div>

                                <div class="form-group">
                                <form:input type="text" class="form-control"
                                            Placeholder="Remarks " path="remarks" required="true"></form:input>
                                </div>

                               


                            <c:if test="${check}">
                                <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Add
                                    Details</form:button>
                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                    Details</form:button>
                            </c:if>
                            <c:if test="${!check}">
                                <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-success">Edit
                                    Details</form:button>
                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                    Details</form:button>
                            </c:if>
                            <a href="showsalarytpage"><button id="show" type="button" class="btn btn-secondary">Cancel</button></a>        
                        </form:form>
                    </div>
               </div>
            </div><br>

                <!-- panel end -->
                <!--            <div class="panel animated fadeInUp delay-05s" id="panel-2">
                                <div class="panel-heading">
                                    <span class="lead">Payment List</span>
                                </div>
                                <p><input type="text" ng-model="test" class="form-control" placeholder="Search payment"></p>
                                 end panel2 heading 
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
                                 panel2 body end 
                            </div>-->
                <!-- panel2 end -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-table"></i>
                        Receive List</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Receive Id</th>
                                        <th>Sale Id</th>
                                        <th>Showroom Id</th>
                                        <th>Total Bill</th>
                                        <th>Receive Date</th>
                                        <th>Remarks</th>
                                        <th>Status</th>
                                        <th>Manage Receive</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                         <th>Receive Id</th>
                                        <th>Sale Id</th>
                                        <th>Showroom Id</th>
                                        <th>Total Bill</th>
                                        <th>Receive Date</th>
                                        <th>Remarks</th>
                                        <th>Status</th>
                                        <th>Manage Receive</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr ng-repeat="s in receivepayment">
                              
                                        <td>{{s.receiveid}}</td>
                                        <td>{{s.saleid}}</td>
                                        <td>{{s.showroomid}}</td>
                                        <td>{{s.amount}}</td>
                                        <td>{{s.date}}</td>
                                        <td>{{s.remarks}}</td>
                                        <td>{{s.status}}</td>
                                        <td><a href="editingreceive?getpid={{s.receiveid}}"><button id="editbuttons" type="submit" class="btn btn-primary">Edit</button></a> <a href="removingreceive/{{s.receiveid}}"><button id="removebuttons" type="button" class="btn btn-danger">Remove</button></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                </div>
            </div>
                


            

            <!--form container --->
            <footer class="sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © Fashion Fiesta 2018</span>
                    </div>
                </div>
            </footer>

        </div>
        <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout">Logout</a>
                </div>
            </div>
        </div>
    </div>



    <!-- Bootstrap core JavaScript-->
    <script src="resources/jquery/jquery.min.js"></script>
    <script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="resources/chart/Chartmin.js"></script>
    <script src="resources/datatables/jquerydataTables.js"></script>
    <script src="resources/datatables/dataTablesbootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/jsnew/sb-adminmin.js"></script>

    <!-- Demo scripts for this page-->
    <script src="resources/jsnew/demo/datatablesdemo.js"></script>
    <script src="resources/jsnew/demo/chartareademo.js"></script>

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

    <script>
                                            $(document).ready(function () {
                                                var date_input = $('input[name="date"]'); //our date input has the name "date"
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
