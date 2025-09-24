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

@WebServlet("/LoginCheck")
public class SignInServlet extends HttpServlet{
@Override
protected void service(HttpServletRequest  request, HttpServletResponse response) throws ServletException, IOException {
	String userName=request.getParameter("username");
	String password=request.getParameter("password");
	
	HttpSession session=request.getSession();
	
	UserDAOImplement userImplement=new UserDAOImplement();
	User user=userImplement.getUser(userName);
	if((user.getPassWord()).equals(password))
	{
		System.out.println("User " + user);
		session.setAttribute("user", user);
		response.sendRedirect("GetAllRestaurantServlet");
	}
	
}
}
