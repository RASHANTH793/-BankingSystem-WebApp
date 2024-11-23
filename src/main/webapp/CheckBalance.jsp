<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="com.model.BankModel"%>
<%@page import="com.model.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HDFC</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"href="https://fonts.googleapis.com/css2">
<link href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css" rel="stylesheet"/> 
<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
</head>
<style>
<<<<<<< HEAD
      body{
         position:fixed;
         width:100%;
      }
=======
>>>>>>> c0102665f43274db5c55f2496141a58bbf9b002a
      h1{
            text-align: center;
            text-shadow: 1px 1px 1px;
        }
        #btn{
            font-size:20px;
            margin-left:10px;   
        }
        h4{
           text-align:center;
           margin-top:20px;
           font-family:"Geist", sans-serif;
           padding-top:30px;
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
        #chkbtn{
              margin-top:20px;
              margin-left:315px;
              background-color: #4CAF50;
              color: white; 
              padding: 10px 20px;
              border: none;
              border-radius: 5px;
              transition: all 0.3s ease;
        }
        #chkbtn:hover {
              background-color: #45a049; 
              color: #f9f9f9;
              transform: scale(1.05); 
              box-shadow: 0 0px 0px rgba(0, 0, 0, 0); 
        }
        
        
</style>
<body class="chkbal">
	<%@ include file="Header.jsp"%>
	
	     <% if (request.getAttribute("status") != null) {%>
                  <div id="msg" class="container"><%= request.getAttribute("status")%></div>
         <%} %>
	     <% if (session.getAttribute("uname")!=null ) {%>
                <div id="data" class="container"> 
                     <h1 style="color:#1E1C68;font-weight:thin;text;font-size:30px;font-family:Apple Color Emoji">Welcome <%= session.getAttribute("uname")%><br> Your Account Id : <%=session.getAttribute("id") %></h1>
                 </div>
         <%}%>
      <a href="Home.jsp" id="btn" class="ml-5 text-decoration-none"> <img src="https://cdn-icons-png.flaticon.com/512/2985/2985162.png" style="height:25px;width:25px">  Back</a>
      <div class="container text-align-center mt-3" style="background-color:#E8E8E8;height:300px;width:800px">
           <h4>Your Current Balance</h4>
           <form method="post" action="Login">
                <button id="chkbtn" name="Amount" type="check">Check Balance</button>
           </form>
           
           <%if(session.getAttribute("bal")!=null){ %>
                <div class="container">
                       <h4><%= session.getAttribute("bal") %></h4>
                </div>
           <%} %>
           
           
      </div>


	<%@ include file="Footer.jsp"%>

</body>
</html>