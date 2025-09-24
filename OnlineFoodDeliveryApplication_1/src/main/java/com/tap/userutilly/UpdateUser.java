package com.tap.userutilly;

import java.util.*;

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
import com.tap.DAO.*;
public class UpdateUser {
	static Scanner sc=new Scanner(System.in);
public static void main(String[] args) {
//	updateMenu();
	updateUser();
//	updateOrders();
//	 updateOrderItem();
}

	public static void updateUser() {
		System.out.println("Enter the UserId:");
		int userId=sc.nextInt();
		sc.nextLine();
		System.out.println("Enter the email:");
		String email=sc.nextLine();
		
		UserDAOImplement imp=new UserDAOImplement();
		User user=imp.getUser(userId);
		System.out.println(user);
		user.setEmail(email);
		//user.setPassWord(password);
		imp.updateUser(user);
		System.out.println(user);
	}
	
	public static void updateRestaurant()
	{
		System.out.println("Enter the RestaurantId:");
		int userId=sc.nextInt();
		RestaurantDAOImplement imp= new RestaurantDAOImplement();
		Restaurant restaurant=imp.getRestaurant(userId);
		
		restaurant.setAddress("Dharmapuri");
		imp.updateRestaurant(restaurant);
	
	}
	public static void updateMenu()
	{
		System.out.println("Enter the MenuId:");
		int menuId=sc.nextInt();
		System.out.println("Enter the ItemName:");
		sc.nextLine();
		String itemName=sc.nextLine();
		
	  MenuDAOImplement imp=new MenuDAOImplement();
	  Menu menu= imp.getMenu(menuId);
	  
	  menu.setItemName(itemName);
	  imp.updateMenu(menu);
	}
	public static void updateOrders()
	{
		System.out.println("Enter the orderId:");
		int orderId=sc.nextInt();
		System.out.println("Enter the TotalAmount:");
		sc.nextLine();
		int totalAmount=sc.nextInt();
		
		OrdersDAOImplement imp=new OrdersDAOImplement();
		Orders order=imp.getOrder(orderId);
		order.setTotalAmount(totalAmount);
		imp.updateOrder(order);
		
	}
	public static void updateOrderItem()
	{
		System.out.println("Enter the OrderItemId:");
		int orderItemid=sc.nextInt();
		sc.nextLine();
		System.out.println("Enter the quatity:");
	    String quatity=sc.nextLine();
	    
	    OrderItemDAOImplement imp=new OrderItemDAOImplement();
	    OrderItem item=imp.getOrderItem(orderItemid);
	    item.setQuantity(quatity);
	    imp.updateOrderItem(item);
	    
	}
}