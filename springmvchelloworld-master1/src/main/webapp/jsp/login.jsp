<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="shortcut icon"
	href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
	type="image/x-icon" />
<link rel="stylesheet" href="./css/userLoginStyle.css">
<title>Login</title>
</head>
<body>
	<div id="login">
        <h3 class="text-center text-white pt-5">Stock Exchange Charting</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                       <%--  <form id="login-form" class="form" action="/adminLandingPage" method="post"> --%>
                       <form:form method="POST" action="/login" modelAttribute="l1" class="form" role="form" autocomplete="off" id="login-form">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <!-- <input type="text" name="username" id="username" class="form-control"> -->
                                 <form:input class="form-control" type="text" path="username" required="true"/>
							 </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <form:input class="form-control" type="password" path="password"  required="true"/>
                            </div>
                            
                            <div class="form-group">
                               <!--  <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br> -->
                               <%--  <spring:url value="/adminLandingPage" var="link10" htmlEscape="true" />
						<li><a href="${link5 }" style="color: lightblue;">Register
								New Stock Exchange</a></li> --%>
                                
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Submit" id="f1">
                                <spring:url value="/register" var="link11" htmlEscape="true" />
                                <button type="button"  onclick="location.href = '${link11}';" name="register" class="btn btn-info btn-md" value="Register" id="f2">Register</button>
                            </div>
                            
                            <!--  <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                
                            </div> -->
                            
                            <!-- <div id="register-link" class="text-right">
                                <a href="./userRegister.html" class="text-info">Register here</a>
                            </div> -->
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>