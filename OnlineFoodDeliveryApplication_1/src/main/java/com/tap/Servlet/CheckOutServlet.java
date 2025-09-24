package com.tap.Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.tap.DAOimp.Cart;
import com.tap.DAOimp.OrderItemDAOImplement;
import com.tap.DAOimp.OrdersDAOImplement;
import com.tap.model.CartItem;
import com.tap.model.OrderItem;
import com.tap.model.Orders;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckOutServlet extends HttpServlet{

	private OrdersDAOImplement orderImp=null;
	private OrderItemDAOImplement orderItemDAO=null;
	@Override
	public void init()  {
		orderImp=new OrdersDAOImplement();
		orderItemDAO=new OrderItemDAOImplement();
		}	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     HttpSession session=request.getSession();
	     
	     //cart 
	     Cart cart=(Cart)session.getAttribute("cart");
	     //user
	     User user=(User)session.getAttribute("user");
	     
	     if(cart != null && user != null && !cart.getItems().isEmpty())
	     {
	    	 //Extract form data
	    	 String paymentMethod=request.getParameter("paymentMethod");
	    	 String address=request.getParameter("address");
	    	 
	    	 //create and populate order object
	    	 Orders order =new Orders();
	    	 
	    	 order.setUserId(user.getUserId());
	    	 order.setRestaurantId((Integer)session.getAttribute("restaurantId"));
	    	 order.setOrderDate(new Timestamp(System.currentTimeMillis()));
	    	 order.setStatus("Conform");
	    	 order.setPayMentMode(paymentMethod);
	    	 order.setDeliveryAddress(address);
	    	 
	    	 //Calculate total amount
	    	 double totalAmount=0;
	    	 for(CartItem item :cart.getItems().values())
	    	 {
	    		 totalAmount +=item.getPrice() * item.getQuantity();
	    	 }
	    	 order.setTotalAmount(totalAmount);
	    	 
	    	 //add order to db
	    	 int orderId=orderImp.addOrder(order);
	    	 //add to orderItem table
	    	 for(CartItem item :cart.getItems().values())
	    	 {
	    		 int itemId=item.getId();
	    		 double price=item.getPrice();
	    		 int quantity=item.getQuantity();
	    		 double totolPrice=price*quantity;
	             OrderItem orderItem=new OrderItem(orderId, itemId, quantity, totolPrice);
	    		 
	             
	    		 orderItemDAO.addOrderItem(orderItem);
	    	 }
	    	 
	    	
	    	 session.setAttribute("orderId", orderId);
	    	 session.removeAttribute("cart");
	    	 session.setAttribute("order", order);
	    	 response.sendRedirect("Order_Confirmation.jsp");
	     }
	     else
	     {
	    	 response.sendRedirect("SignIn.jsp");
	     }
	}
	}	
