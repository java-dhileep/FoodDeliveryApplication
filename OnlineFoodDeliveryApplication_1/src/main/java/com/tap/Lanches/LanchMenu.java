package com.tap.Lanches;


	import java.util.Scanner;

import com.tap.DAOimp.MenuDAOImplement;
import com.tap.model.Menu;

	public class LanchMenu {
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		
		System.out.println("Enter the RestaurantId:");
		int restaurantId=sc.nextInt();
		sc.nextLine();
		System.out.println("Enter the ItemName:");
		String itemName=sc.nextLine();
		System.out.println("Enter the Description:");
		String description=sc.nextLine();
		System.out.println("Enter the price");
	    int price=sc.nextInt();
		System.out.println("Enter the rating");
		int rating=sc.nextInt();
		sc.nextLine();
		System.out.println("Enter the isAvailable");
		String isAvailabe=sc.nextLine();
		System.out.println("Enter the ImagePath");
		String imagePath=sc.nextLine();
		
		Menu menu=new Menu(restaurantId, itemName, description, price, description, isAvailabe, imagePath);
	
		MenuDAOImplement menuImp=new MenuDAOImplement();
		menuImp.addMenu(menu);
		
	}
	}
