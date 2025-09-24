package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOimp.RestaurantDAOImplement;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GetAllRestaurantServlet")
public class GetAllRestaurantServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDAOImplement resImplement=new RestaurantDAOImplement();
		List<Restaurant> listOfRestaurant=resImplement.getAllRestaurant();
		req.setAttribute("restaurants", listOfRestaurant);
		RequestDispatcher rd=req.getRequestDispatcher("Restaurant.jsp");
        rd.forward(req, resp);
	}
}
