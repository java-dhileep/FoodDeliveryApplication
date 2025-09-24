package com.tap.userutilly;

import java.util.Scanner;

import com.tap.DAOimp.MenuDAOImplement;
import com.tap.DAOimp.OrderItemDAOImplement;
import com.tap.DAOimp.OrdersDAOImplement;
import com.tap.DAOimp.UserDAOImplement;

public class DeleteUser {
	static Scanner sc=new Scanner(System.in);
public static void main(String[] args) {
 //deleteUser(); 
 //deleteMenu();
//	deleteOrders();
	deleteOrderItem();
}
public static void deleteUser()
{
	System.out.println("Enter the userId:");
  	int userid=sc.nextInt();
  	
  	UserDAOImplement imp=new UserDAOImplement();
  	imp.deleteUser(userid);
}
public static void deleteMenu()
{
	System.out.println("Enter the menuId:");
	int menuId=sc.nextInt();
	
	MenuDAOImplement imp=new MenuDAOImplement();
	imp.deleteMenu(menuId);
}
public static void deleteOrders()
{
	System.out.println("Enter the ordersId:");
	int orderId=sc.nextInt();
	OrdersDAOImplement imp=new OrdersDAOImplement();
	imp.deleteOrder(orderId);
}
public static void deleteOrderItem()
{
	System.out.println("Enter the OrderItemId:");
	int orderItemId=sc.nextInt();
	OrderItemDAOImplement imp=new OrderItemDAOImplement();
	imp.deleteOrderItem(orderItemId);
}
}
