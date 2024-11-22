<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Bank Management</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style type="text/css">
body {
	background-image: url(https://wallpapercave.com/wp/wp4316550.jpg);
	background-attachment: fixed;
	background-size: cover;
	position:fixed;
	width: 100%;
}
.error{
                color:red;
            }
            
            
            .button{
                padding: 5px;
                width: 6%;
                background: cornflowerblue;
                color: white;
            }

            #msg
            {
                justify-content:center;
                background: green;
                color:white;
                border: 3px solid green;
                border-radius:5px;
                width:24%;
                font-weight: bold;
                font-size: 30px;
                margin-top:10px;
                text-align:center;
            }
            td input{
                display:block;
            }
            .container{
               margin-top:60px;
            }
       
            
</style>

</head>
<body>
	<script>
	jQuery(document).ready(function($) {
        $("#login").validate({
            rules: {
                email: {
                    required: true,
                    checkaccno: true
                },
                pass: {
                    required: true,
                    minlength: 6
                },
            },
            messages: {
                email: {
                    required: "Please enter Email.",
                    checkaccno:"Please enter the correct Email"
                },
                pass: {
                    required: "Please enter the password.",
                    minlength: "Please enter the password greater than or equal to 6."
                },
            }
        });
    });
	</script>
	<%@ include file="Header.jsp"%>
	<% if (request.getAttribute("status") != null) {%>
        <div id="msg" class="container"><%= request.getAttribute("status")%></div>
    <%} %>
	
	<!-- Welcome Section -->
	<div class="container my-2 ">
		<div class="jumbotron text-center">
			<h2 class="display-4">Welcome to HDFC Bank!</h2>
			<p class="lead">HDFC Bank where secure and easy online banking is
				at your fingertips.</p>
		</div>
	</div>

	<!-- Login Form -->
	<div class="container d-flex justify-content-center ">
		<div class="card p-3 shadow-lg" style="max-width: 400px; width: 100%;">
			<form method="post" id="login" action="Login">
				<h4 class="form-title mb-4 text-center">Sign in to Your Account</h4>
				<div class="form-group">
					<input type="text" class="form-control"placeholder="Enter email Number" name="email">
				</div>
				<div class="form-group">
					<input type="password" class="form-control"placeholder="Enter Password" name="pass">
				</div>
				<button type="submit" class="btn btn-primary btn-block" name="Login">Signin</button>
				<p class="text-dark mt-3 ">
					No account? <a href="Signup.jsp" class="text-primary" >Signup</a>
				</p>
			</form>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
