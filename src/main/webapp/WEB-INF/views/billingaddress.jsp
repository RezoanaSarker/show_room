

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shipping Address-Showroom</title>

        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="resources/cssnew/shop-homepage.css" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/animate.css">
        <link href="resources/img/logo.ico" rel="shortcut icon" />
        <script src="resources/js/angular.js"></script>

        <script type="text/javascript">
            var addresses = ${addressesjson};
            angular.module('organocartpackage', []).controller('AddressController',
                    function ($scope) {
                        $scope.addressitems = addresses;
                    })
        </script>
        <style>
            .input-group {
                margin: 20px 0px 20px;
                width: 75%;
                border-radius: 10px;
            }

            input[type=text]:focus {
                border: 2px solid #9ccc65;
                border-radius: 10px;
            }

            #leftdiv {
                border-right: 2px solid #9ccc65;
            }

            #holder {
                display: inline-block;
                background-color: #ffffff;
                border-radius: 5px;
                box-shadow: 2px 2px 20px #dcedc8;
                margin: 10px;
            }

            #top-block {
                padding-top: 4px;
            }

            #bottom-block {
                padding: 15px 20px;
            }

            #submitbtn, #resetbtn {
                width: 34.5%;
                margin-right: 4px;
                background-color: #9ccc65;
                color: #ffffff;
                background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);	
            }

            #paybutton {
                width: 100%;
                margin-right: 4px;
                color: #ffffff;
                background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);	
            }

            #submitbtn:hover, #resetbtn:hover, #paybutton:HOVER {
                background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);
                color: #ffffff;
            }

            #editlink, #removelink {
                color: #9ccc65;
                font-size: 15px;
            }
        </style>
    </head>

    <body ng-app="organocartpackage" ng-controller="AddressController">
       <%-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#"> Showroom </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                        <c:if test="${sessionScope.UserLoggedIn ==null}">
                            <li class="nav-item">
                                <a class="nav-link" href="login">Login</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.UserLoggedIn !=null}">
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>
                            <li><a href="showcartpage" style="color: #9ccc65; font-size: 19px"> 
                                    <span class="glyphicon glyphicon-shopping-cart"></span> 
                                    <span class="badge">${sessionScope.grandquantity}</span>
                                </a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </nav>--%>

        <jsp:include page="header.jsp"></jsp:include>



            <div id="mainBody" class="container">
            <form:form action="addnewaddress" method="post"
                       modelAttribute="billingAddressObj">
                <div id="leftdiv" class="col-sm-6">
                    <h3>
                        <b>ShippingAddress</b>
                    </h3>
                    <div class="input-group">
                        <form:input type="hidden" class="form-control" id="" name=""
                                    aria-describedby="basic-addon1" path="addressid"></form:input>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"> <i
                                    class="fa fa-user-o" aria-hidden="true"></i>
                            </span>
                        <form:input type="text" class="form-control"
                                    placeholder="Email" id="" name=""
                                    aria-describedby="basic-addon1" path="emailid"></form:input>
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"> <i
                                    class="fa fa-address-card" aria-hidden="true"></i>
                            </span>
                        <form:input type="text" class="form-control"
                                    placeholder="AddresssLine 1" id="" name=""
                                    aria-describedby="basic-addon1" path="addresslineone"></form:input>
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"> <i
                                    class="fa fa-address-card" aria-hidden="true"></i>

                            </span>
                        <form:input type="text" class="form-control"
                                    placeholder="AddresssLine 2" id="" name=""
                                    aria-describedby="basic-addon1" path="addresslinetwo"></form:input>
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1">
                                <div class="glyphicon glyphicon-inbox"></div>
                            </span>
                        <form:input type="text" class="form-control" placeholder="city"
                                    id="" name="" aria-describedby="basic-addon1" path="city"></form:input>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1">
                                <div class="glyphicon glyphicon-inbox"></div>
                            </span>
                        <form:input type="text" class="form-control" placeholder="state"
                                    id="" name="" aria-describedby="basic-addon1" path="statename"></form:input>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"> <i
                                    class="fa fa-globe" aria-hidden="true"></i>
                            </span>
                        <form:input type="text" class="form-control" placeholder="country"
                                    id="" name="" aria-describedby="basic-addon1" path="country"></form:input>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1">
                                <div class="glyphicon glyphicon-phone"></div>
                            </span>
                        <form:input type="text" class="form-control"
                                    placeholder="Phone number" id="" name=""
                                    aria-describedby="basic-addon1" path="phone"></form:input>
                        </div>
                    <c:if test="${newobj}">
                        <button name="addnew" id="submitbtn" class="btn" type="submit">
                            <i class="fa fa-credit-card" aria-hidden="true"></i> Add Address
                        </button>
                        <button id="resetbtn" class="btn" type="Reset">
                            <i class="fa fa-times" aria-hidden="true"></i> Reset Address
                        </button>
                    </c:if>
                    <c:if test="${!newobj}">
                        <button name="edit" id="submitbtn" class="btn" type="submit">
                            <i class="fa fa-credit-card" aria-hidden="true"></i> Edit Address
                        </button>
                        <button id="resetbtn" class="btn" type="Reset">
                            <i class="fa fa-times" aria-hidden="true"></i> Reset Address
                        </button>
                    </c:if>
                </div>
            </form:form>

            <div id="rightDiv" class="holder col-sm-6">

                <div id="holder" ng-repeat="a in addressitems">
                    <div id="top-block">
                        <a href="editaddress?getaddressid={{a.addressid}}" class="btn"
                           id="editlink"><span class="glyphicon glyphicon-pencil"></span></a>
                        <a href="removeaddress?getaddressid={{a.addressid}}"
                           class="btn pull-right" id="removelink"><span
                                class="glyphicon glyphicon-remove"></span></a>
                    </div>
                    <div id="bottom-block">
                        <div class="lead">{{a.emailid}}</div>
                        <div>{{a.addresslineone}}</div>
                        <div>{{a.addresslinetwo}}</div>
                        <div>{{a.city}}</div>
                        <div>{{a.statename}}</div>
                        <div>{{a.country}}</div>
                        <div><i class="fa fa-mobile" aria-hidden="true"></i>
                            {{a.phone}}</div>
                        <div>
                            <a href="generatinginvoice?getaddressid={{a.addressid}}" id="paybutton" class="btn"> 
                                <i class="fa fa-truck" aria-hidden="true"></i> Deliver Here
                            </a>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; SRS Showroom 2017</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="resources/jquery/jquery.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
