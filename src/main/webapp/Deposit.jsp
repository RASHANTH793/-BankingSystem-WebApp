<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.BankModel"%>
<%@page import="com.model.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HDFC Deposit</title>
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
       .error{
                color:red;
                flex:column;
            }
       h1{
            text-align: center;
            text-shadow: 1px 1px 1px;
        }
        #msg{
                justify-content:center;
                color:blue;
                border-radius:5px;
                width:45%;
                font-weight: bold;
                font-size: 20px;
                margin-top:10px;
                text-align:center;
         }
         h4{
           text-align:center;
           font-family:"Geist", sans-serif;
           padding-top:30px;
        }
        #btn{
            font-size:20px;
            margin-left:10px;  
        }
        #data{
             margin-top:30px;
        }
        #chkbtn{
              margin-top:10px;
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
</head>
<body>
     <script>
	jQuery(document).ready(function($) {
        $("#Dep").validate({
            rules: {
                dpst: {
                    required: true     
                }
            },
            messages: {
                dpst: {
                    required: "Please enter Amount to Deposit."
                }
            }
        });
    });
	</script>
     <%@ include file="Header.jsp" %>
         
	     <% if (session.getAttribute("uname")!=null && session.getAttribute("id") != null) {%>
                <div id="data" class="container"> 
                     <h1 style="color:#1E1C68;font-weight:thin;text;font-size:30px;font-family:Apple Color Emoji">Welcome <%= session.getAttribute("uname")%><br> Your Account Id : <%=session.getAttribute("id") %></h1>
                 </div>
         <%}%>
         <a href="Home.jsp" id="btn" class="ml-5 text-decoration-none"> <img src="https://cdn-icons-png.flaticon.com/512/2985/2985162.png" style="height:25px;width:25px">  Back</a>
         
         <div class="container d-flex flex-column align-items-center  mt-3 pt-3" style="background-color:#E8E8E8; height:300px; width:800px;">
              <h4>Enter the amount to be deposited</h4>
              <form method="post" id="Dep" action="Login" class="d-flex flex-column align-items-center">
                      <input type="number" class="form-control  text-center" style="width:250px;" name="dpst">
                  <button id="chkbtn" name="deposit" type="submit" class="btn btn-primary">Deposit</button>
              </form>
              <% if (request.getAttribute("status") != null) {%>
                  <div id="msg" class="container"><%= request.getAttribute("status")%></div>
              <%} %>
         
         </div>
         

     <%@ include file="Footer.jsp" %>
</body>
</html>