package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOimp.MenuDAOImplement;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/menuServlet")
public class GetAllMenusServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int restaurantId=Integer.parseInt(req.getParameter("restaurantId"));
    
    MenuDAOImplement menuImp=new MenuDAOImplement();
    
    List<Menu> list=menuImp.getAllMenuByRestaurant(restaurantId); 
   req.setAttribute("menus", list);
   RequestDispatcher rd=req.getRequestDispatcher("Menu.jsp");
   rd.forward(req, resp);
	}

}
