<%-- 
    Document   : productdatereport
    Created on : Jan 9, 2019, 12:02:43 AM
    Author     : Rezwana
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin - Product Report</title>
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
    </head>
    <body id="page-top" ng-app="organocartpackage" ng-controller="ProductController">
       <nav class="navbar navbar-expand navbar-dark bg-info static-top">

            <a class="navbar-brand mr-1 card-header" href="admin">Fashion Fiesta Showroom</a>

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
            <!-- Sidebar -->
            <ul class="sidebar navbar-nav bg-info">
                <li class="nav-item active">
                    <a class="nav-link" href="admin">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span class="card-body badge-info">Dashboard</span>
                    </a>
                </li><br>
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
                </li><br>
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
                        <li class="breadcrumb-item active">Product-Report</li>
                    </ol>

                    <div class="panel-body">

                        <form:form method="POST" action="productdateview" commandName="reportInputForm">

                            <table id="reptbl" width="350px" border="1">
                                <div class="form-group ">
                                    <label for="StartDate" class="control-label col-lg-3">Start Date :</label>
                                    <div class="col-lg-6">
                                        <form:input class="form-control"
                                                    Placeholder="Start Date" type="text" path="start_date" required="true"></form:input>
                                        </div>
                                    </div>  

                                    <div class="form-group ">
                                        <label for="EndDate" class="control-label col-lg-3">End Date :</label>
                                        <div class="col-lg-6">
                                        <form:input class="form-control"
                                                    Placeholder="End Date" type="text" path="end_date" required="true"></form:input>
                                        </div>
                                    </div> 



                                    <div class="col-lg-offset-3 col-lg-6">
                                    <form:button  type="submit" 
                                                  class="btn btn-info">Search</form:button>

                                    </div>




                                </table>  
                        </form:form>
                    </div>

                    <!-- Sticky Footer -->
                    <footer class="sticky-footer">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright © Fashion Fiesta 2018</span>
                            </div>
                        </div>
                    </footer>   

                </div>
            </div>

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

    </body>
</html>
