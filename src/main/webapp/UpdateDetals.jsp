<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.model.BankModel"%>
<%@page import="com.model.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HDFC Profile Update</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"href="https://fonts.googleapis.com/css2">
<link href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css" rel="stylesheet"/> 
<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style>
      #btn{
            font-size:20px;
            margin-left:10px;   
        }
      #chkbtn{
              margin-top:20px;
             
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
        td input{
            display:block;
        }
        #msg{
                justify-content:center;
                background: green;
                color:white;
                border: 3px solid green;
                border-radius:5px;
                width:40%;
                font-weight: bold;
                font-size:30px;
                margin-top:10px;
                text-align:center; 
        }
        
        
</style>
</head>
<body>
     
    <%@ include file="Header.jsp"%>
        <% if (request.getAttribute("status") != null) {%>
              <div id="msg" class="container"><%= request.getAttribute("status")%></div>
        <%}%>
        <%if(session.getAttribute("uname")!=null){ 
              BankModel b = new BankModel(session);
              Customer c = b.getInfo();%>
     <a href="Home.jsp" id="btn" class="ml-5 text-decoration-none"> <img src="https://cdn-icons-png.flaticon.com/512/2985/2985162.png" style="height:25px;width:25px">  Back</a>
    <center> 
     <font color="blue" size="5"><br>
        <h2> Edit Profile</h2>
        </font>
        <form action='Login' method='POST'>
            <div class="container ">
                <div>
                    <div class="form-group col-md-4">
                        <label >Name</label>
                        <input type="text" class="form-control"  name="name" value="<%=c.getName()%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label >Phone Number</label>
                        <input type="number" class="form-control"  name="pno" value="<%=c.getPhone()%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label >Email</label>
                        <input type="email" class="form-control"  name="email" value="<%=c.getMail()%>">
                    </div>
                    <button id="chkbtn" type="submit" class="btn btn-primary" name="submit">Update</button>
                </div>
            </div>
        </form>
        <%}%> 
    </center>
	<%@ include file="Footer.jsp"%>
</body>
</html>