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
<title>Register</title>
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> 
<link rel="shortcut icon"
	href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
	type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="./css/userRegisterStyle.css">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="./script/registration.js"></script>  -->


	<!-- <script>
	function myFunction() {
		var username = $("#username").val();

		var password = $("#password").val();
		var email = $("#email").val();
		var mobilenumber = $("#mobilenumber").val();
		if (username == '' || password == '' || email == '' || mobilenumber == '') {
		alert("Please fill all fields...!!!!!!");
		} else if ((password.length) < 8) {
		alert("Password should atleast 8 character in length...!!!!!!");
		}
		else if ((mobilenumber.length) < 8) {
			alert("Mobilenumber should be 10 digits...!!!!!!");
			}
		else{
			alert("You have Successfully Registered.....");
		}
		};
		

	</script>
 -->
</head>
<body>
	<div class=" container login-container">
 <div class="row d-flex justify-content-center align-items-center">
  <div class="col-md-2"></div>
   <div class="col-md-8 login-form-1 ">
    <h2 class="display-3">Register Form</h2>
    
    <hr>
   <div class="row">
   <div class="col-md-3"></div>
  <div class="col-md-6">
  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Register as Admin</a></li>
    <li><a data-toggle="pill" href="#menu1">Register as User</a></li>
   
  </ul>
  </div>
  <div class="col-md-3"></div>
 </div>
  
  <div class="tab-content">
					<div id="home" class="tab-pane fade in active">

						<!-- Form1 goes here -->
						<div class="space"></div>
						<form:form method="POST" action="/register1" modelAttribute="r1"
							class="form" role="form" autocomplete="off" onsubmit="myFunction()">
							<div class="form-group">
								<form:input placeholder="Username" type="text"
									class="form-control" path="username" id="username1"/>
							</div>
							<div class="form-group">
								<form:input placeholder="Password" type="password"
									class="form-control" path="password" id="password1"/>
							</div>
							<div class="form-group">
								<form:input placeholder="Email" type="email"
									class="form-control" path="email" id="email1"/>
							</div>
					
					
					<div class="form-group">
						<form:input type="number" placeholder="Mobile Number"
							class="form-control" path="mobilenumber" id="mobilenumber1"/>
					</div>
					<div class="form-group">
						<form:input type="text" placeholder="Enter OTP" class="form-control" path="confirmed" />
					</div>

					<div class="row">
						<!-- <div class="col-md-4">
							<div class="form-group" id="f11">
								<button type="button" class="btn btn-primary">Send OTP</button>
							</div>
						</div> -->

						<div class="col-md-6">
							<div class="form-group" id="f33">
								<button type="submit" class="btn btn-primary" id="submit1">Create
									Account</button>

							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group" id="f22">
								<button type="reset" class="btn btn-primary" id="f2">Reset</button>
							</div>
						</div>
					</div>
					</form:form>

				</div>
    <div id="menu1" class="tab-pane fade">
      
       <div class="space"></div>
       <!-- Form 2 starts here -->
      <form:form method="POST" action="/register2" modelAttribute="r1" class="form" role="form" autocomplete="off"> <!-- onsubmit="myFunction()"> -->
     <div class="form-group">
      <form:input  placeholder="Username" type="text" class="form-control" path="username" id="username"/>
     </div>
     <div class="form-group">
      <form:input  placeholder="Password" type="password" class="form-control" path="password" id="password"/>
     </div>
     <div class="form-group">
      <form:input  placeholder="Email"  type="email" class="form-control" path="email" id="email"/>
     </div>
   
     <div class="form-group">
      <form:input type="number" placeholder="Mobile Number" class="form-control" path="mobilenumber" id="mobilenumber"/>
     </div>
     <div class="form-group">
      <form:input type="text" class="form-control" path="confirmed" placeholder="Enter OTP" />
     </div>
    
    <!--  <div class="form-group">
      <button type="submit" class="btn btn-primary btn-block">Create Account</button>
     </div> -->
     
     <div class="row">
						<!-- <div class="col-md-4">
							<div class="form-group" id="f11">
								<button type="button" class="btn btn-primary">Send OTP</button>
							</div>
						</div> -->

						<div class="col-md-6">
							<div class="form-group" id="f33">
								<button type="submit" class="btn btn-primary" id="submit1">Create
									Account</button>

							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group" id="f22">
								<button type="reset" class="btn btn-primary" id="f2">Reset</button>
							</div>
						</div>
					</div>
    </form:form>
     
    </div>
    
  </div>

    <!-- -->
   </div>
  <div class="col-md-2"></div>
 </div>
 </div>
</body>
</html>