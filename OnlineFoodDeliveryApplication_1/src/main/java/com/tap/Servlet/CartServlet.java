package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOimp.Cart;
import com.tap.DAOimp.MenuDAOImplement;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session=req.getSession();
		Cart cart=(Cart)session.getAttribute("cart");

		Integer newRestaurantId=Integer.parseInt(req.getParameter("restaurantId"));
		Integer currentRestaurantId=(Integer)session.getAttribute("restaurantId");

		if(cart==null || newRestaurantId != currentRestaurantId)
		{
			cart=new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", newRestaurantId);
		}

		String action=req.getParameter("action");
		if(action.equals("add"))
		{
			addItemToCart(req,cart);
		}
		else if(action.equals("update"))
		{
			updateCartItem(req,cart);
		}
		else if(action.equals("remove"))
		{
			removeCartItem(req,cart);
		}
    resp.sendRedirect("cart.jsp");
    
	}
	private void addItemToCart(HttpServletRequest request,Cart cart)
	{
		int menuId=Integer.parseInt(request.getParameter("menuId"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));

		MenuDAOImplement menuImp=new MenuDAOImplement();
		Menu menuItem=menuImp.getMenu(menuId);
		CartItem item=null;

		if(menuItem!=null)
		{
			item=new CartItem(
					menuId,
					menuItem.getItemName(),
					menuItem.getRestaurantId(),
					menuItem.getPrice(),
					quantity);
		}

		cart.addItem(item);
	}
	private void updateCartItem(HttpServletRequest request, Cart cart) {
		int menuId=Integer.parseInt(request.getParameter("itemId"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		cart.updateItem(menuId,quantity);
	}
	private void removeCartItem(HttpServletRequest request, Cart cart) {
      int menuId= Integer.parseInt(request.getParameter("itemId"));
      cart.removeItem(menuId);
	}
}
