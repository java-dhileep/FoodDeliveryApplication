package com.tap.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection  {

	private static String URL="jdbc:mysql://localhost:3306/onlinefooddelivery";
	private static String USERNAME="root";
	private static String PASSWORD="root";
	private static Connection con;
	public static Connection dbCon()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}

