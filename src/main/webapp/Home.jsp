<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HDFC Bank</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"href="https://fonts.googleapis.com/css2">
<link href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css" rel="stylesheet"/> 
<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    
<style>

        h1{
            text-align: center;
            text-shadow: 1px 1px 1px;
        }
        #msg{
                justify-content:center;
                background: green;
                color:white;
                border: 3px solid green;
                border-radius:5px;
                width:24%;
                font-weight: bold;
                font-size:30px;
                margin-top:10px;
                text-align:center; 
        }
        #data{
             
             
        }
        
        .scrolling-text {
            display: inline-block;
            white-space: nowrap;
            animation: scroll-left 15s linear infinite;
        }
        

        @keyframes scroll-left {
            from {
                transform: translateX(100%);
            }
            to {
                transform: translateX(-100%);
            }
        }
       h4{
          color:white;
       }
       .home{
          position:fixed;
          width:100%
       }
        
       
        
</style>
</head>
<body class="home">
<%@ include file="Header.jsp" %>
        <% if (request.getAttribute("status") != null) {%>
        <div id="msg" class="container"><%= request.getAttribute("status")%></div>
        <%}%>
        <br>
        <% if (session.getAttribute("uname")!=null && session.getAttribute("id") != null) {%>
        <div id="data" class="container"> 
              <h1 style="color:#1E1C68;font-weight:thin;text;font-size:30px;font-family:Apple Color Emoji";>Welcome <%= session.getAttribute("uname")%><br> Your Account Id : <%=session.getAttribute("id") %></h1>
        </div>
          
        <%}%>
        <div class="container mt-4">
              <div class="bg-thick  overflow-hidden">
                   <h2 class="scrolling-text " style="color:red;font-family:Open Sans;font-size:28px;font-weight:bold">Welcome <%= session.getAttribute("uname")%>, Now Your are Part of HDFC Organization.Your Security is in our hands feel free to use our services.</h2>
              </div>
            
        </div>
        <div class="container-fluid mt-5" style="background: rgb(39,38,68);background: linear-gradient(90deg, rgba(39,38,68,1) 0%, rgba(170,164,215,1) 0%, rgba(92,126,104,1) 100%, rgba(75,122,118,1) 100%);">
             <div class="row d-flex justify-content-center p-4">
                  <div class="col-lg-2 mx-2" style="border: 2px solid black;height:300px">
                       <img src="https://cdn.iconscout.com/icon/premium/png-256-thumb/balance-check-1-974285.png" style="height:170px;width:160px;margin-top:10px">
                       <h4>Check Balance</h4>
                       <button><a href="CheckBalance.jsp" style="text-decoration:none">Click Here</a></button>
                  </div>
                  <div class="col-lg-2 mx-2" style="border: 2px solid black;height:300px">
                       <img src="https://cdn-icons-png.flaticon.com/512/7377/7377207.png"style="height:170px;width:160px;margin-top:10px">
                       <h4>Deposit</h4>
                       <button><a href="Deposit.jsp" style="text-decoration:none" >Click Here</a></button>
                  </div>
                  
                  <div class="col-lg-2 mx-2" style="border: 2px solid black;height:300px">
                       <img src="https://cdn-icons-png.flaticon.com/512/9405/9405698.png"style="height:170px;width:160px;margin-top:10px">
                       <h4>Transfer Amount</h4>
                       <button><a href="TransferAmount.jsp"style="text-decoration:none">Click Here</a></button>
                  </div>
                  <div class="col-lg-2 mx-2" style="border: 2px solid black;height:300px">
                       <img src="https://cdn-icons-png.flaticon.com/512/5566/5566864.png"style="height:170px;width:160px;margin-top:10px">
                       <h4>PassBook Amount</h4>
                       <button><a href="Passbook.jsp" style="text-decoration:none">Click Here</a></button>
                  </div>
                  <div class="col-lg-2 mx-2" style="border: 2px solid black; height:300px">
                       <img src="https://cdn-icons-png.flaticon.com/512/12002/12002176.png"style="height:170px;width:160px;margin-top:10px">
                       <h4>Update Account</h4>
                       <button><a href="UpdateDetals.jsp" style="text-decoration:none">Click Here</a></button>
                  </div>
                  
                  
             </div>
         
        </div>
<%@ include file ="Footer.jsp" %>

</body>
</html>