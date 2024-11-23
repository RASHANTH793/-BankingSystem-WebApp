<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HDFC Transfer Account</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"href="https://fonts.googleapis.com/css2">
<link href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css" rel="stylesheet"/> 
<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style>

body{
         position:fixed;
         width:100%;
      }

.error {
	color: red;
	
}

h1 {
	text-align: center;
	text-shadow: 1px 1px 1px;
}

#msg {
	justify-content: center;
	color: blue;
	border-radius: 5px;
	width: 45%;
	font-weight: bold;
	font-size: 20px;
	margin-top: 10px;
	text-align: center;
}

h4 {
	text-align: center;
	font-family: "Geist", sans-serif;
	padding-top: 30px;
}

#btn {
	font-size: 20px;
	margin-left: 10px;
}

#data {
	margin-top: 30px;
}

#chkbtn {
    width:120px;
	margin-top: 25px;
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	transition: all 0.3s ease;
	margin-left:300px;
}

#chkbtn:hover {
	background-color: #45a049;
	color: #f9f9f9;
	transform: scale(1.05);
	box-shadow: 0 0px 0px rgba(0, 0, 0, 0);
}

</style>
</head>
<body>
     <script>
	jQuery(document).ready(function($) {
        $("#Trans").validate({
            rules: {
            	Amnt: {
                    required: true,
                    
                },
                Acnt: {
                    required: true,
                    
                },
                Password: {
                    required: true,
                    
                },
            },
            messages: {
                Amnt: {
                    required: "Please enter Amount.",
                    
                },
                Acnt: {
                    required: "Please enter Benificiery Accno.",
                    
                },
                Password: {
                    required: "Please enter the password.",
                    
                },
            }
        });
    });
	</script>
	<%@ include file="Header.jsp"%>
	    <% if (session.getAttribute("uname")!=null ) {%>
                <div id="data" class="container"> 
                     <h1 style="color:#1E1C68;font-weight:thin;text;font-size:30px;font-family:Apple Color Emoji">Welcome <%= session.getAttribute("uname")%><br> Your Account Id : <%=session.getAttribute("id") %></h1>
                 </div>
         <%}%>

         <% if (request.getAttribute("status") != null) {%>
                  <div id="msg" class="container"><%= request.getAttribute("status")%></div>
              <%} %>

	    <a href="Home.jsp" id="btn" class="ml-5 text-decoration-none"> <img src="https://cdn-icons-png.flaticon.com/512/2985/2985162.png" style="height:25px;width:25px">  Back</a>
	    <div class="container d-flex flex-column  mt-3 pt-3" style="background-color:#E8E8E8; height:300px; width:800px;">
              <h4 style:"font-weight=bold">Enter the Fields to Transfer the Amount</h4>
              
              <form method="post" id="Trans" action="Login" class="d-flex flex-column justify-content-space-between  mt-3">
                    <div class="d-flex flex-row">
                      <div class="col-4">
                           <label>Enter the Amount</label>
                           <input type="number" class="form-control  text-center " style="width:180px" name="Amnt">
                           
                      </div>
                      <div class="col-4">
                           <label>Enter the Benificiery Account</label>
                           <input type="number" class="form-control  text-center" style="width:180px" name="Acnt">
                          
                      </div>
                      <div class="col-4">
                           <label>Enter the Password</label>
                           <input type="password" class="form-control  text-center" style="width:180px" name="Password">  
                      </div>
                      
                    </div>
                    <button id="chkbtn" name="transferAmount" type="submit">Transfer</button>
                    <% if (request.getAttribute("Status") != null) {%>
                         <div id="msg" class="container"><%= request.getAttribute("Status")%></div>
                    <%} %>                   
                    </div>                   

              </form>
              
         </div>
	<%@ include file="Footer.jsp"%>
</body>
</html>