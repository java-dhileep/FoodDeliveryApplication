package com.tap.userutilly;


import java.util.Scanner;

import com.tap.model.Restaurant;
import com.tap.model.User;
import com.tap.DAOimp.*;
public class GetUser {
	static Scanner sc=new Scanner(System.in);
	public static void main(String[] args) {
		
		//getMenu();
//		getOrder();
		getUser();
	}
	public static void getUser()
	{
		System.out.println("Enter the userId:");
		int userId=sc.nextInt();
		 UserDAOImplement imp=new UserDAOImplement();
		 User user=imp.getUser(userId);
		System.out.println(user);
		
		
//		Scanner sc=new Scanner(System.in);
//		System.out.println("Enter the userId:");
//		int userId=sc.nextInt();

		RestaurantDAOImplement res=new RestaurantDAOImplement();
		Restaurant restaurant= res.getRestaurant(userId);
		System.out.println(restaurant);
	}
	public static void getMenu()
	{
		System.out.println("Enter the menuId:");
		 int menuId=sc.nextInt();
		 MenuDAOImplement imp=new MenuDAOImplement();
		 imp.getMenu(menuId);
	}
	public static void getOrder()
	{
		System.out.println("Enter the orderId:");
		int orderId=sc.nextInt();
		OrdersDAOImplement imp=new OrdersDAOImplement();
		imp.getOrder(orderId);
	}
	public static void getOrderItem()
	{
		System.out.println("Enter the OrderItemId:");
		int orderItemId=sc.nextInt();
		OrderItemDAOImplement imp=new OrderItemDAOImplement();
		imp.getOrderItem(orderItemId);
	}
}
