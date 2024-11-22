package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


import com.model.BankModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(name="Signup",urlPatterns = {"/Signup"})

public class RegisterServlet extends HttpServlet {
	
	Connection con;
	HttpSession se;
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, ClassNotFoundException, SQLException {
		
        HttpSession session = request.getSession();
        BankModel reg = new BankModel(session);
        
        
        if (request.getParameter("Signup") != null) {
        	String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String pw = request.getParameter("pw");
            String cp = request.getParameter("cp");
            
            if(cp.equals(pw)) {
            	String status = reg.Register(name, phone, email, pw);
            	if (status.equals("existed")) {
                    request.setAttribute("status", "Sry Account has already Registerd!..");
                    RequestDispatcher rd1 = request.getRequestDispatcher("Signup.jsp");
                    rd1.forward(request, response);

                } else if (status.equals("success")) {
                    request.setAttribute("status", "Successfully Registered");
                    RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Registration failed");
                    RequestDispatcher rd1 = request.getRequestDispatcher("Signup.jsp");
                    rd1.forward(request, response);
                }
            }
        }   
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        try {
			processRequest(request, response);
		} catch (IOException | ClassNotFoundException | SQLException e) {
	
			e.printStackTrace();
		}
    }

    
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
			processRequest(request, response);
		} catch (IOException | ClassNotFoundException | SQLException e) {
	
			e.printStackTrace();
		}
    }

}
