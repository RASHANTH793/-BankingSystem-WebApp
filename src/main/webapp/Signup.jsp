<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style>
.container-fluid {
	background-color: #1E1C68;
	color: white;
	
}
.error{   
                color:red;
            }
           
        h1{
            text-align: center;
            text-shadow: 2px 1px 2px black;
        }
        #msg{
                justify-content:center;
                background: red;
                color:white;
                border: 3px solid red;
                border-radius:5px;
                width:40%;
                font-weight: bold;
                font-size:30px;
                margin-top:10px;
                text-align:center; 
        }

</style>
<script>
jQuery.validator.addMethod("checkemail", function(value, element) {
    return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
});
jQuery(document).ready(function($) {
    $("#signup").validate({
        //ignore: [],
        rules: {
            name: {
                required: true
            },
            email: {
                required: true,
                checkemail: true
            },
            phone: {
                required: true,
                minlength: 10,
                maxlength: 10
            },
            pw: {
                required: true,
                minlength: 6
            },
            cp: {
                required: true,
                minlength: 6,
                equalTo: "#pw"
            }
        },
        messages: {
            name: {
                required: "Please enter the name."
            },
            email: {
                required: "Please enter the email.",
                email: "Please enter valid email id"
            },
            phone: {
                required: "Please enter the number.",
                minlength: "Please enter the  10 digit number.",
                maxlength: "more than 10 digits."
            },
            pw: {
                required: "Please enter the password.",
                minlength: "Please enter the password greater than or equal to  6.",
            },
            cp: {
                required: "Please reenter the password.",
                minlength: "Please enter the password greater than or equal to 6.",
                equalTo: "mismatch password"
            }
        }
    });
});
</script>
</head>
<body>
    
	
	<!-- Navbar -->
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand d-flex align-items-center" href="#"> <img
				src="https://th.bing.com/th/id/R.581085cb73bc58162228449ab576da89?rik=gd%2fvdG6C5d%2bc3g&riu=http%3a%2f%2fwww.thecivilindia.com%2fimages%2fbanking%2fhdfc-bank.jpg&ehk=iK0qH%2bRte6Wk%2fIdztpsdNeqUlJ46XejShJoVoJ%2by5Mg%3d&risl=&pid=ImgRaw&r=0"
				alt="HDFC Logo" class="mr-2" style="height: 50px; width: 60px;">
				<h2 class="m-2 text-white">HDFC</h2>
			</a>
			<div class="ml-auto">
				<a href="login.jsp" class="btn btn-outline-primary text-white mb-1">Login</a>
			</div>
		</nav>
	</div>
	<% if (request.getAttribute("status") != null) {%>
        <div id="msg" class="container"><%= request.getAttribute("status")%></div>
    <%} %>

	<!-- Registration Form -->
	<div class="container d-flex justify-content-center my-2">
		<div class="card p-4 shadow-lg" style="max-width: 500px; width: 100%;">
			<form method="post" id="signup" action="Signup">
				<div class="mb-4">
					<h4 class="title">Register Yourself to HDFC!</h4>
					<p class="message text-left">Signup now and get full access to
						our app.</p>
				</div>

				<div class="form-group">
					<label for="firstname">Fullname</label> <input type="text"
						class="form-control" id="firstname" placeholder="Enter Firstname"
						name="name">
				</div>
				<div class="form-group">
					<label for="password">Phone</label> 
					<input type="number" class="form-control" id="number" placeholder="Enter Password" name="phone">
				</div>

				<div class="form-group">
					<label for="email">Email</label> 
					<input type="email" class="form-control" id="email" placeholder="Enter Email" name="email">
				</div>

				
				<div class="form-group">
					<label for="password">Password</label> 
					<input type="password" class="form-control" id="pw" placeholder="Enter Password" name="pw">
				</div>

				<div class="form-group">
					<label for="confirm-password">Confirm Password</label> 
					<input type="password" class="form-control"  placeholder="Confirm Password" name="cp">
				</div>

				<button type="submit" class="btn btn-primary btn-block" name="Signup">Submit</button>

				<p class="text-center">
					Already have an account? <a href="login.jsp" class="text-primary">Login</a>
				</p>
			</form>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>