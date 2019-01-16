<%-- 
    Document   : index
    Created on : Dec 11, 2018, 3:39:44 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Showroom Homepage</title>

        <!-- Bootstrap core CSS -->
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="resources/cssnew/shop-homepage.css" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/animate.css">
        <link href="resources/img/logo.ico" rel="shortcut icon" />
        <script src="resources/js/angular.js"></script>
        <script>
            var productlist = ${productlist};
            angular.module('organocartpackage', []).controller('ProductController',
                    function ($scope) {
                        $scope.productangularobject = productlist;
                    });
        </script>

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top">
            <div class="container">
                <a class="navbar-brand card-header" href="#"> Fashion Fiesta Showroom </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="card-body badge-info" href="<%=request.getContextPath()%>">Home</a>
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="card-body badge-info" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="card-body badge-info" href="#">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="card-body badge-info" href="contact.jsp">Contact</a>
                        </li>
                        <c:if test="${sessionScope.UserLoggedIn ==null}">
                            <li class="nav-item">
                                <a class="card-body badge-info" href="login">Login</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.UserLoggedIn !=null}">
                            <li class="nav-item">
                                <a class="card-body badge-info" href="logout">Logout</a>
                            </li>
                            <li><a href="showcartpage" style="color: #9ccc65; font-size: 19px"> 
                                    <span class="glyphicon glyphicon-shopping-cart"></span> 
                                    <span class="badge">${sessionScope.grandquantity}</span>
                                </a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-lg-3">

                    <h1 class="my-4"> Fashion Fiesta Showroom</h1>
                    <div class="list-group">



                        <%--  <a href="#" class="list-group-item">Category 1 </a>--%>
                        <%--  <li class="nav-item dropdown">--%>
                        <a class="list-group-item" class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-fw fa-folder"></i>
                            <span> Category 1</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                            <h6 class="dropdown-header">Saree:</h6>
                            <a class="dropdown-item" href="#">Banarasi Sarees</a>
                            <a class="dropdown-item" href="#">Silk Sarees</a>
                            <a class="dropdown-item" href="#">Jamdani Sarees</a>
                            <a class="dropdown-item" href="#">Tant Sarees</a>
                            <a class="dropdown-item" href="#"> Kanjeevaram Sarees</a>
                            <a class="dropdown-item" href="#"> Batik Print Sarees</a>
                            <div class="dropdown-divider"></div>
                            <h6 class="dropdown-header">Collection:</h6>
                            <a class="dropdown-item" href="#">WEDDING</a>
                            <a class="dropdown-item" href="#">PARTY</a>
                            <a class="dropdown-item" href="#">FESTIVE</a>
                            <a class="dropdown-item" href="#">CASUAL</a>
                            <a class="dropdown-item" href="#">TRADITIONAL</a>
                            <a class="dropdown-item" href="#">BOLLYWOOD THEME</a>

                        </div>

                        <div class="list-group">
                            <!--   <ul class="nav-item dropdown">-->
                            <a class="list-group-item" class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-fw fa-folder"></i>
                                <span> Category 2</span>
                            </a>

                            <!-- <a href="#" class="list-group-item">Category 2</a>-->
                            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                                <h6 class="dropdown-header">Salwar Kameez:</h6>
                                <a class="dropdown-item" href="#">Partywear Salwar Kameez </a>
                                <a class="dropdown-item" href="#">Indian Salwar Kameez</a>
                                <a class="dropdown-item" href="#">Hoor pari salwar kameez </a>
                                <a class="dropdown-item" href="#">Stitching Salwar Kameez</a>
                                <a class="dropdown-item" href="#"> Pakistani Salwar Kameez </a>
                                <a class="dropdown-item" href="#"> Anarkali Salwar Kameez</a>
                                <a class="dropdown-item" href="#"> Cotton Salwar Kameez</a>
                                <a class="dropdown-item" href="#"> Lilen Silk Salwar Kameez</a>
                                <a class="dropdown-item" href="#"> Katan Silk Salwar Kameez</a>
                                <div class="dropdown-divider"></div>
                                <h6 class="dropdown-header">Collection:</h6>
                                <a class="dropdown-item" href="#">WEDDING</a>
                                <a class="dropdown-item" href="#">PARTY</a>
                                <a class="dropdown-item" href="#">FESTIVE</a>
                                <a class="dropdown-item" href="#">CASUAL</a>
                                <a class="dropdown-item" href="#">TRADITIONAL</a>
                                <a class="dropdown-item" href="#">BOLLYWOOD THEME</a>

                            </div>

                        </div>

                        <!--  <a href="#" class="list-group-item">Category 3</a>-->

                        <div class="list-group">
                            <!--   <ul class="nav-item dropdown">-->
                            <a class="list-group-item" class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-fw fa-folder"></i>
                                <span> Category 3</span>
                            </a>

                            <!-- <a href="#" class="list-group-item">Category 2</a>-->
                            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                                <h6 class="dropdown-header">Others:</h6>
                                <a class="dropdown-item" href="#">Skirt</a>
                                <a class="dropdown-item" href="#">Lehenga</a>
                                <a class="dropdown-item" href="#">Kurti</a>
                                <a class="dropdown-item" href="#">Punjabi</a>
                                <a class="dropdown-item" href="#">Abaya Custom</a>
                                <a class="dropdown-item" href="#">plazo</a>
                                <a class="dropdown-item" href="#">Gown</a>
                                <div class="dropdown-divider"></div>
                                <h6 class="dropdown-header">Collection:</h6>
                                <a class="dropdown-item" href="#">WEDDING</a>
                                <a class="dropdown-item" href="#">PARTY</a>
                                <a class="dropdown-item" href="#">FESTIVE</a>
                                <a class="dropdown-item" href="#">CASUAL</a>
                                <a class="dropdown-item" href="#">TRADITIONAL</a>
                                <a class="dropdown-item" href="#">BOLLYWOOD THEME</a>

                            </div>

                        </div>






                    </div><br><br><br>

                    <div class="list-group">
                        <img class="d-block img-fluid" src="resources/img/girl2.jpg" alt="First slide">
                    </div><br><br>
                    <div class="list-group">
                        <h2 font-color="red">Showroom</h2>
                        <p>The service is used for daily live-streams which may be viewed for free. As of March 2018, there are no paid or subscription-based memberships. Revenue is generated from paid virtual gift items given to the performer from registered members during live-streams. Earnings are shared with the performers based upon the number of points they accumulate for audience size, the number of comments and other factors,[7] and production companies may offer licensing deals or other music offers.[8][9]

                            Initially, it only allowed streaming by the DeNA headquarters studio and by officially-recognized entertainers. After September 13, 2014, any registered member could live-stream.[10] English language support was also added.[7]</p>
                    </div><br>
                    <div class="list-group">
                        <img class="d-block img-fluid" src="resources/img/07.jpg" alt="First slide">
                    </div><br><br>

                    <div class="list-group">
                        <img class="d-block img-fluid" src="resources/img/showroom.jpg" alt="First slide">
                    </div><br><br>

                    <div class="list-group">
                        <img class="d-block img-fluid" src="resources/img/C.jpg" alt="First slide">
                    </div>




                </div>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">

                    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img  src="resources/img/our.jpg" height="400" width="850" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img  src="resources/img/First.jpg" height="400" width="850" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img  src="resources/img/saree-showroom.jpg"  height="400" width="850"  alt="Third slide">
                            </div>
                            <div class="carousel-item">
                                <img  src="resources/img/Market.jpg" height="400" width="850" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                    <div class="row" ng-app="organocartpackage" ng-controller="ProductController">

                        <div class="col-lg-4 col-md-6 mb-4 animated fadeInUp delay-05s panel" ng-repeat="p in productangularobject| limitTo: 6">

                            <div class="card h-100">
                                <a href="viewproduct?getId={{p.productid}}">
                                    <img class="card-img-top" src="resources/pimage/{{p.productid}}.jpg" height="300px" width="200px" alt="">
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            {{p.productname}}
                                        </h4>
                                        <h5>Tk.{{p.productprice}}</h5>
                                        <p class="card-text"> {{p.productdescription}}</p>
                                    </div>
                                </a>
                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>                                    
                            </div>

                        </div>
                        <a href="buyproductpage" class="btn btn-primary" id="loginproductsbutton"> View More Products</a>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Fashion Fiesta 2018</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="resources/jquery/jquery.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
