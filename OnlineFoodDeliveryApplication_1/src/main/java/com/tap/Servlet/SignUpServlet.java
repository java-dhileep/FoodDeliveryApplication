package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOimp.UserDAOImplement;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/signIn")
public class SignUpServlet extends HttpServlet{
	private User user=null;
	private UserDAOImplement userImplement=null; 
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String fullName= request.getParameter("fullName");
		String email=request.getParameter("email");
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String phoneNumber=request.getParameter("phoneNumber");
		String address=request.getParameter("address");
		String role=request.getParameter("role");
		
		user=new User(fullName, userName, password, email, phoneNumber, address, role);
		userImplement=new UserDAOImplement();
		userImplement.addUser(user);
		
	   HttpSession	session =request.getSession();
	   session.setAttribute("user", user);
	   
		response.sendRedirect("SignIn.jsp");
	}

}
