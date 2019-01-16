<%-- 
    Document   : addproduct
    Created on : Dec 9, 2018, 9:07:23 AM
    Author     : Rezwana
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin - Add Product</title>
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
            var productlist = ${productlist};
            var sl = ${supplierslist};
            var cl = ${categorymodelobject};

            angular.module('organocartpackage', []).controller('ProductController',
                    function ($scope) {
                        $scope.productangularobject = productlist;
                        $scope.slo = sl;
                        $scope.clo = cl;
                        console.log($scope.productangularobject);
//                        $scope.cars = {
//                            0: {supplierId: "1", supplierName: "TCLD", supplierAddress: "Dhaka", supplierPhone: "017654321"},
//                            1: {supplierId: "2", supplierName: "IBM", supplierAddress: "Dhaka", supplierPhone: "01765432"}
//                        }
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
                        <li class="breadcrumb-item active">Add Product</li>
                    </ol>
                    <!-- end panel heading -->
                    <div class="panel-body">
                        <div class="formcontainer ">

                            <form:form commandName="newProductObject" action="productadd"
                                       enctype="multipart/form-data">

                                <c:if test="${!check}">
                                    <div class="form-group">
                                        <form:input class="form-control" Placeholder="Product Id"
                                                    type="text" path="productid" readonly="true" required="true"></form:input>
                                        </div>
                                </c:if>
                                <div class="form-group">
                                    <div class="form-label-group">
                                        <form:input class="form-control" Placeholder="Product Name" type="text" path="productname" required="true" id="productname"></form:input>
                                            <label for="productname">Product Name</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-label-group">
                                        <form:input type="text" class="form-control" placeholder="Product Description" path="productdescription" required="true" id="productdescription"></form:input>
                                            <label for="productdescription">Product Description</label>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                <form:input type="text" class="form-control" Placeholder="Product price" path="productprice" required="true" id="productprice"></form:input>
                                                    <label for="productprice">Product price</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                <form:input type="text" class="form-control"  path="saleprice" placeholder="Sale Price" required="true" id="saleprice"></form:input>
                                                    <label for="saleprice">Sale Price</label>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            <form:select path="catid" cssClass="form-control" required="true" id="catid">
                                                <option value="">-- Choose Category --</option>
                                                <form:option ng-repeat="c in clo" value="{{c.catid}}">
                                                    {{c.catname}}
                                                </form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <select class="form-control" ng-model="supplierid" ng-options="x.supplierId as x.supplierName for x in slo" required="true">
                                                <option value="">-- Choose Supplier --</option>
                                            </select>
                                            <!--                                    <select ng-model="selectedCar" ng-options="y.supplierId as y.supplierName for (x, y) in cars">
                                                                                </select>
                                            
                                                                                <h1>You selected: {{selectedCar}}</h1>-->
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-label-group">
                                        <form:hidden  class="form-control" value="{{supplierid}}" path="supplierid"></form:hidden>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <div class="form-label-group">
                                                    <form:input type="number" class="form-control" placeholder="Stock" path="productquantity" required="true" id="productquantity"></form:input>
                                                        <label for="productquantity">Stock</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <div class="form-label-group">
                                                    <form:input type="text" class="form-control"  path="purchasedate" placeholder="Purchase Date" required="true" id="date" ></form:input>
                                                        <label for="date">Date</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--                            <input class="form-control" id="date" name="date" placeholder="MM/DD/YYY" type="text"/>-->

                                        <div class="form-group">
                                        <form:input type="file" name="fileToUpload" id="fileToUpload" path="pimage" required="true"></form:input>
                                        </div>
                                    <c:if test="${check}">
                                        <form:button id="editbuttons" type="submit" name="Add" class="btn btn-success">Add Details</form:button>
                                        <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset Details</form:button>
                                    </c:if>
                                    <c:if test="${!check}">
                                        <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-success">Edit Details</form:button>
                                        <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset Details</form:button>
                                    </c:if>
                                    <a href="showproductpage"><button id="show" type="button" class="btn btn-secondary">Cancel</button></a>        
                                </form:form>
                            </div>
                            <!-- panel body end -->
                        </div>

                        <!-- DataTables Example -->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fas fa-table"></i>
                                Product List</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Product Image</th>
                                                <th>Product Id</th>
                                                <th>Product Name</th>
                                                <th>Product Price</th>
                                                <th>Product Stock</th>
                                                <th>Supplier Id</th>
                                                <th>Category Id</th>
                                                <th>Purchase Date</th>
                                                <th>Manage Product</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Product Image</th>
                                                <th>Product Id</th>
                                                <th>Product Name</th>
                                                <th>Product Price</th>
                                                <th>Product Stock</th>
                                                <th>Supplier Id</th>
                                                <th>Category Id</th>
                                                <th>Purchase Date</th>
                                                <th>Manage Product</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr ng-repeat="product in productangularobject">
                                                <td><img class="img-responsive" style="width:100px ;height:100px" src="resources/pimage/{{product.productid}}.jpg" /></td>
                                                <td>{{product.productid}}</td>
                                                <td>{{product.productname}}</td>
                                                <td>{{product.productprice}}</td>
                                                <td>{{product.productquantity}}</td>
                                                <td>{{product.supplierid}}</td>
                                                <td>{{product.catid}}</td>
                                                <td>{{product.purchasedate}}</td>
                                                <td><a href="editingproduct?getpid={{product.productid}}"><button id="editbuttons" type="submit" class="btn btn-primary">Edit</button></a> <a href="removingproduct/{{product.productid}}"><button id="removebuttons" type="button" class="btn btn-danger">Remove</button></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                    <!-- Sticky Footer -->
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


            <!--<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>-->

            <!-- Include Date Range Picker -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

            <script>
                                                            $(document).ready(function () {
                                                                var date_input = $('input[name="purchasedate"]'); //our date input has the name "date"
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
