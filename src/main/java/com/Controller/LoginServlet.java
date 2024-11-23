package com.Controller;

import java.io.IOException;
import java.sql.SQLException;


import com.model.BankModel;
import com.model.TransactionModel;
import com.model.Transaction;
import com.model.Customer;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="Login", urlPatterns = {"/Login"})
public class LoginServlet  extends HttpServlet{

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        BankModel bm = new BankModel(session);
        
        
        if (request.getParameter("Login") != null) {
        	
            String mail = request.getParameter("email");
            String pass = request.getParameter("pass");
            
            
            String status = bm.login(mail, pass);
            if (status.equals("success")) {
            	request.setAttribute("status", "Login Success");
                RequestDispatcher rd1 = request.getRequestDispatcher("Home.jsp");
                rd1.forward(request, response);

            } else if (status.equals("failure")) {
                request.setAttribute("status", "Oops..Login failed!!");
                RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                rd1.forward(request, response);
            }
        }else if (request.getParameter("logout") != null) {
            session.invalidate();
            RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
            rd1.forward(request, response);
            
            
        } else if( request.getParameter("deposit") != null) {
        	String money = request.getParameter("dpst");
        	BankModel b = new BankModel(session);
        	String status = b.AmountDeposit(money);
        	if(status.equals("success")) {
        		request.setAttribute("status", "Sucessfully deposited! Please Check The Balance");
        		RequestDispatcher rd1 = request.getRequestDispatcher("Deposit.jsp");
        		rd1.forward(request, response);
        	}else  {
        		request.setAttribute("status", "Deposit Unsucessfull.Try Again!...");
        		RequestDispatcher rd1 = request.getRequestDispatcher("Deposit.jsp");
        		rd1.forward(request, response);
        	}	
        }else if(request.getParameter("transferAmount") != null) {
        	double Amount = Double.parseDouble(request.getParameter("Amnt"));
        	long AccountNumber = Long.parseLong(request.getParameter("Acnt"));
        	String Ps = request.getParameter("Password");
        	BankModel b1 = new BankModel(session);
        	String Status = b1.CheckDetails(Amount,AccountNumber,Ps);	
        	String message = "";
        	switch (Status) {
        	    case "SameAccountError":
        	        message = "Within Same Account Can't Transfer!";
        	        break;
        	    case "InsufficientFunds":
        	        message = "Please Check Your Current Balance or Entered Balance!";
        	        break;
        	    case "PasswordError":
        	        message = "Please Check Your Account Password!";
        	        break;
        	    case "Success":
        	        message = "Funds Successfully Transferred!";
        	        break;
        	    case "failure":
        	        message = "Funds Didn't Transfer!";
        	        break;
        	}
        	request.setAttribute("Status", message);
        	RequestDispatcher rd = request.getRequestDispatcher("TransferAmount.jsp");
        	rd.forward(request, response);
        }else if (session.getAttribute("uname") != null && request.getParameter("submit") != null) {
            String name = request.getParameter("name");
            String pno = request.getParameter("pno");
            String email = request.getParameter("email");
            BankModel b = new BankModel(session);
            String status = b.update(name, pno, email);
            if (status.equals("success")) {
                request.setAttribute("status", "Profile successfully Updated");
                RequestDispatcher rd1 = request.getRequestDispatcher("UpdateDetals.jsp");
                rd1.forward(request, response);
            } else {
                request.setAttribute("status", "Updation failure");
                RequestDispatcher rd1 = request.getRequestDispatcher("UpdateDetals.jsp");
                rd1.forward(request, response);
            }
        }  
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        try {
			processRequest(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
	
			e.printStackTrace();
		}
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
			processRequest(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
	
			e.printStackTrace();
		}
    }

}
