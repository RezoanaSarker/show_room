<%-- 
    Document   : welcome
    Created on : Nov 20, 2018, 4:20:01 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="resources/css/default.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>

        <jsp:include page="header.jsp" />
        <h1>Welcome ${sessionScope.UserLoggedIn}</h1>
        <!-- <a href="logout">Logout</a>
         <a href="showingcategorypage">Add Category</a>
         <a href="showsupplier">Add Showroom</a>
         <a href="showproductpage">Add Product</a>
         <a href="<%=request.getContextPath()%>">Home</a>
         <img src='resources/img/First.jpg' style='width:100%;height:80%' alt='[]' />-->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">WebSiteName</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<%=request.getContextPath()%>">Home</a></li>
                    <!--  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="showingcategorypage">Add Category <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a href="showingcategorypage">Add Category</a></li>
                          <li><a href="showsupplier">Add Showroom</a></li>
                          <li><a href="showproductpage">Add product</a></li>
                        </ul>
                      </li>-->
                    <li><a href="showingcategorypage">Add Category</a></li>
                    <li><a href="showsupplier">Add Showroom</a></li>
                    <li><a href="showproductpage">Add product</a></li>
                    <li><a href="showingEmployeeinfo">Add Employee</a></li>
                    <li><a href="showcartpage1">Purchase</a></li>
                    <li><a href="showcartpage2">Sale</a></li>
                    <li><a href="showstock">Stock</a></li>
                    <li><a href="viewShowpurchase">Purchase History</a></li>
                    <li><a href="showpaymentpage">Payment</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                    <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">

            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="resources/img/First.jpg" alt="images" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/img/Mrignayani-Showroom.jpg" alt="images" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/img/-41260_89201.jpg" alt="imges" style="width:100%;">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>


        <jsp:include page="footer.jsp" />
    </body>
</html>
