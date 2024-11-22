<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.model.BankModel"%>
<%@page import="com.model.Customer"%>
<%@page import="com.model.TransactionModel"%>
<%@page import="com.model.Transaction"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HDFC PassBook</title>
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
              margin-top:10px;
              background-color: #4CAF50;
              color: white; 
              padding: 10px 20px;
              border: none;
              border-radius: 5px;
              transition: all 0.3s ease;
              
        }
        #chkbtn:hover {
              background-color: #4CAF50; 
              color: #f9f9f9;
              transform: scale(1.05); 
              box-shadow: 0 0px 0px rgba(0, 0, 0, 0); 
        }
        #Pntbtn{
              margin-top:10px;
              background-color: red;
              color: white; 
              padding: 10px 20px;
              border: none;
              border-radius: 5px;
              transition: all 0.3s ease;
              
        }
        #Pntbtn:hover {
              background-color: red; 
              color: white;
              transform: scale(1.05); 
              box-shadow: 0 0px 0px rgba(0, 0, 0, 0); 
        }
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>

	   <a href="Home.jsp" id="btn" class="ml-5 text-decoration-none"> <img
		    src="https://cdn-icons-png.flaticon.com/512/2985/2985162.png"
		    style="height: 25px; width: 25px"> Back
	   </a>
	   <center>  
	           <font color="blue"  size="5" style:"text-align=center">
                    <h2>PassBook Details</h2>
               </font>
               <form method="post">
                    <button id="chkbtn">Fetch</button>
                    <button id="Pntbtn">Print</button>
               </form>
               
       <div class="container-fluid bg-white">
           <div class="container-fluid bg-white">
               <table class="table table-bordered table-responsive-lg table-hover" style:"boder-radius=5px">
                   <thead>
                       <tr style="background-color: black;text-align:center;color:white">
                   <br>
                           <th>Acc_No</th>
                           <th>Name</th>
                           <th>Transaction_Id</th>
                           <th>Transaction_Type</th>
                           <th>Transaction_Date</th>
                           <th>Credited/Debited Amount</th>
                           <th>Current Balance</th>
                           
                       </tr>
                   </thead>
                   <tbody id="table">
                        <%if(session.getAttribute("id") != null){ 
                        	Customer c = new Customer();
                        	 long ac = (long) session.getAttribute("id");
                             TransactionModel bm = new TransactionModel();
                             List<Transaction>  al = bm.getTransaction(ac);
                             Iterator<Transaction> itr = al.iterator();
                             while (itr.hasNext()) {
                            	
                            		 Transaction t = itr.next();
                            	 
                            	 
                             %>
                          <tr style="text-align:center">
                           <td><%=session.getAttribute("id")%></td>
                           <td><%=session.getAttribute("uname")%></td>
                           <td><%=t.getTransactionID()%></td>
                           <td><%=t.getTransaction()%></td>
                           <td><%=t.getDate()%></td>
                           <%if(t.getTransaction().equals("CREDITED")) { %>
                                <td><%="+"+t.getAmount()%></td>
                           <%} %>
                           <td><%=t.getBalance()%></td>
                       </tr>     
                       <%}%>
                       <%}%> 
                   </tbody>
               </table>
           </div>
       </div>
</center>
	   
	 
	<%@ include file="Footer.jsp"%>

</body>
</html>