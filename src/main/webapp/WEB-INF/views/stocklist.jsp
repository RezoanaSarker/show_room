<%-- 
    Document   : stocklist
    Created on : Dec 22, 2018, 4:29:00 AM
    Author     : Rezwana
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">

.form-control:FOCUS
{
	border: 2px solid #9ccc65;
	border-radius: 5px;
}

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
.list-group-item {
	overflow: hidden;
	margin: 3px;
	border-radius: 3px;
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
            var stockdetail = ${stockdetail};
            console.log(stockdetail);
            angular.module('myapp', []).controller('CategoryController',
                    function ($scope) {
                        $scope.stockdetail = stockdetail;
                    });
        </script>
        
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container-fluid"
             style="width: 80%; margin-top: 10px; margin-bottom: 10px">
            
            <!-- panel1 end -->
            <div class="panel animated fadeInUp delay-05s" id="panel-2">
                <div class="panel-heading">
                    <span class="lead">List Of Stock</span>
                     <a href="welcome">Admin</a>
                </div>
                  <p><input type="text" ng-model="test" class="form-control" placeholder="Search Stock"></p>
                <!-- end panel2 heading -->
                <div class="panel-body" ng-app="myapp"
                     ng-controller="CategoryController" width="100%">
                    <ul class="list-group ">
                        <li class="list-group-item" height="45px"
                            ng-repeat="s in stockdetail| filter:test">
                            <div class="pull-left">
                                <ul class="list-inline">
                                    <li><span><b>Stock Id: </b></span>{{s.stockid}}</li>
                                    <li><span><b>Product Id: </b></span>{{s.productid}}</li>
                                    <li><span><b>Total Stock :</b></span>{{s.totalstock}}</li>
                                </ul>
                            </div>
                            <div class="pull-right">
                                 <a
                                    href="removingstock/{{s.stockid}}"><button  id="removebuttons"
                                                                             type="button" class="btn">Remove</button></a>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- panel2 body end -->
            </div>
            <!-- panel2 end -->
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
