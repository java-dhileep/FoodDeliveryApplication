package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOimp.OrdersDAOImplement;
import com.tap.model.Orders;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		 HttpSession session=request.getSession();
		 User user=(User)session.getAttribute("user");
		 OrdersDAOImplement ordersImp=new OrdersDAOImplement();
		 List<Orders> orderList=ordersImp.getAllOrders_SpecificId(user.getUserId());
		 session.setAttribute("ordersList", orderList);
		 System.out.println(orderList);
		 response.sendRedirect("Orders.jsp");
		 
	}

}
