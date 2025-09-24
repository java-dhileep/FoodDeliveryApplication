package com.tap.userutilly;

import java.sql.Timestamp;
import java.util.Scanner;

import com.tap.model.Menu;
import com.tap.model.OrderItem;
import com.tap.model.Orders;
import com.tap.model.Restaurant;
import com.tap.model.User;
import com.tap.DAOimp.MenuDAOImplement;
import com.tap.DAOimp.OrderItemDAOImplement;
import com.tap.DAOimp.OrdersDAOImplement;
import com.tap.DAOimp.RestaurantDAOImplement;
import com.tap.DAOimp.UserDAOImplement;

public class LanchUser {
	static Scanner sc=new Scanner(System.in);
	public static void main(String[] args) {
	//user();
	//restaurant();
	//menu();	
//	orders();
//		orderItem();
		orders();
	}
	public static void user()
	{
		System.out.println("Enter the name:");
		 String name=sc.nextLine();
		 System.out.println("Enter the userName:");
		 String userName=sc.nextLine();
		 System.out.println("Enter the PassWord:");
		 String passWord=sc.nextLine();
		 System.out.println("Enter the Email:");
		 String email=sc.nextLine();
		 System.out.println("Enter the Phone:");
		 String phone=sc.nextLine();
		 System.out.println("Enter the Address:");
		 String address=sc.nextLine();
		 System.out.println("Enter the Address:");
		 String role=sc.nextLine();
		
		 User user=new User(name, userName, passWord, email, phone, address, role);
		 UserDAOImplement imp=new UserDAOImplement();
		 imp.addUser(user);
				
	}
	public static void restaurant()
	{
		System.out.println("Enter the name:");
		 String name=sc.nextLine();
		 System.out.println("Enter the address:");
		 String address=sc.nextLine();
		 System.out.println("Enter the phone:");
		 String phone=sc.nextLine();
		 System.out.println("Enter the rating:");
		 String rating=sc.nextLine();
		 System.out.println("Enter the cusineType:");
		 String cusineType=sc.nextLine();
		 System.out.println("Enter the isActive:");
		 String isActive=sc.nextLine();
		 System.out.println("Enter the eta:");
		 String role=sc.nextLine();
		 System.out.println("Enter the adminUserId:");
		 int adminUserId=sc.nextInt();
		 sc.nextLine();
		 System.out.println("Enter the imagePath:");
		 String imagePath=sc.nextLine();
		 
     Restaurant restaurant= new Restaurant( name, address, phone, rating, cusineType, isActive, cusineType, adminUserId, imagePath);
     RestaurantDAOImplement imp=new  RestaurantDAOImplement();
     imp.addRestaurant(restaurant);
	}
	public static void menu()
	{
	 System.out.println("Enter the menuId:");
	 int restaurantId=sc.nextInt();
	 
//	  System.out.println("Enter the itemName:");
//	  String itemName=sc.nextLine();
//	  System.out.println("Enter the description:");
//	  String description=sc.nextLine();
//	  System.out.println("Enter the price:");
//	  int price=sc.nextInt();
//	  sc.nextLine();
//	  System.out.println("Enter the ratings:");
//	  String ratings=sc.nextLine();
//	  System.out.println("Enter the isAvailable:");
//	  String isAvailable=sc.nextLine();
//	  System.out.println("Enter the imagePath:");
//	  String imagePath=sc.nextLine();
	  
	//  Menu menu=new Menu(restaurantId,itemName, description, price, ratings, isAvailable, imagePath);
	 // MenuDAOImplement imp=new MenuDAOImplement();
     //imp.addMenu(menu);
	  
	
	 
	}
	public static void orders()
	{
		System.out.println("Enter the userId:");
		int userId=sc.nextInt();
		System.out.println("Enter the restaurantId:");
		int restaurantId=sc.nextInt();
		
		System.out.println("Enter the totalAmount:");
	    int totalAmount=sc.nextInt();
		System.out.println("Enter the status:");
		sc.nextLine();
		String status=sc.nextLine();
		System.out.println("Enter the payMentMode:");
		String payMentMode=sc.nextLine();
		System.out.println("Enter the delivery address:");
		String deliveryAddress=sc.nextLine();
		Orders orders=new Orders(userId, restaurantId,new Timestamp(System.currentTimeMillis()) ,totalAmount, status, payMentMode,deliveryAddress);
		OrdersDAOImplement imp=new OrdersDAOImplement();
		 int res=imp.addOrder(orders);
		
		System.out.println(res);
		
	}
	public static void orderItem()
	{
		System.out.println("Enter the orderId :");
		int orderId=sc.nextInt();
		System.out.println("Enter the menuId:");
		int menuId=sc.nextInt();
		sc.nextLine();
		System.out.println("Enter the quantity:");
		String quantity=sc.nextLine();
		System.out.println("Enter the totalPrize:");
		int totalPrize=sc.nextInt();
		
//	   OrderItem orderItem= new	OrderItem(orderId, menuId, quantity, totalPrize);
//	   OrderItemDAOImplement imp=new OrderItemDAOImplement();
//	   imp.addOrderItem(orderItem);
//	    
	}
}
