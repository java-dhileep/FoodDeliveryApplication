package com.tap.userutilly;

import java.util.List;

import com.tap.DAOimp.MenuDAOImplement;
import com.tap.DAOimp.OrderItemDAOImplement;
import com.tap.DAOimp.OrdersDAOImplement;
import com.tap.DAOimp.RestaurantDAOImplement;
import com.tap.DAOimp.UserDAOImplement;
import com.tap.model.Menu;
import com.tap.model.OrderItem;
import com.tap.model.Orders;
import com.tap.model.Restaurant;
import com.tap.model.User;

public class GetAllUser {
	public static void main(String[] args) {

//		getAllMenu();
//		getAllOrders();
//		getAllOrderItem();
//		getAllRestaurant();
		getAllOrders_Specific_Id();
	}
	public static void getAllUser()
	{
		UserDAOImplement imp=new UserDAOImplement();
		
		List<User> list=imp.getAllUsers();
		for(User user:list)
		{
			System.out.println(user);
		}
	}
	public static void getAllRestaurant()
	{
		RestaurantDAOImplement imp=new RestaurantDAOImplement();
		List<Restaurant> list=imp.getAllRestaurant();
		for(Restaurant res:list)
		{
			System.out.println(res);
		}
	}
	public static void getAllMenu()
	{
		MenuDAOImplement imp=new MenuDAOImplement();
		List<Menu> list=imp.getAllMenus();
		for(Menu menu: list)
		{
			System.out.println(menu);
		}
	}
	public static void getAllOrders()
	{
		OrdersDAOImplement imp=new OrdersDAOImplement();
		List<Orders> list=imp.getAllOrders();
		for(Orders order:list)
		{
			System.out.println(order);
		}
	}
	public static void getAllOrderItem()
	{
		OrderItemDAOImplement imp=new OrderItemDAOImplement();
		List<OrderItem> list=imp.getAllOrderItem();
	    for(OrderItem item:list)
	    {
	       System.out.println(item);
	    }
	}
	public static void getAllOrders_Specific_Id()
	{
		OrdersDAOImplement imp=new OrdersDAOImplement();
		List<Orders> list=imp.getAllOrders_SpecificId(50);
		for(Orders order:list)
		{
			System.out.println(order);
		}
	}
}
