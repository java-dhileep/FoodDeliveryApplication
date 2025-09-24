package com.tap.Servlet;
import java.io.IOException;
import java.util.List;

import com.tap.DAOimp.Cart;
import com.tap.DAOimp.MenuDAOImplement;
import com.tap.DAOimp.OrderItemDAOImplement;
import com.tap.DAOimp.OrdersDAOImplement;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.OrderItem;
import com.tap.model.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ReorderServlet")
public class ReorderServlet extends HttpServlet{
	
	private OrderItemDAOImplement orderItemImp;
	private MenuDAOImplement menuDaoImp;
	private OrdersDAOImplement ordersDaoImp;
	private Cart cart;
	private HttpSession session;
	List<OrderItem> orderItemList;

	@Override
	public void init() throws ServletException {
		orderItemImp = new OrderItemDAOImplement();
		menuDaoImp = new MenuDAOImplement();
		ordersDaoImp = new OrdersDAOImplement();
		cart = new Cart();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		session = req.getSession();
		session.setAttribute("cart", cart);
		
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		
		Orders order = ordersDaoImp.getOrder(orderId);
		orderItemList = orderItemImp.getAllOrderItemSpecificOrderId(orderId);
		
		session.setAttribute("restaurantId", order.getRestaurantId());
		
		for(OrderItem oi :orderItemList) {			
			Menu menu = menuDaoImp.getMenu(oi.getMenuId());
			
			CartItem cartItem = new CartItem(oi.getMenuId(), menu.getItemName(), menu.getPrice(), oi.getQuantity() ,order.getRestaurantId());
			cart.addItemsFromReorder(oi.getMenuId(), cartItem);
		}
		resp.sendRedirect("cart.jsp");
	}

}