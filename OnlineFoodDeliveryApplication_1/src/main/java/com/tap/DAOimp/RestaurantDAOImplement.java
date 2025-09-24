package com.tap.DAOimp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.Connection.DBConnection;
import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
public class RestaurantDAOImplement implements RestaurantDAO{

	Connection con=null;
	private String INSERT="INSERT INTO `restaurant` (`name`,`address`,`rating`,`cusine_type`,`isActive`,`eta`,`adminUserId`,`imagePath`)"
			+ "values(?,?,?,?,?,?,?,?)";
	private String SELECT="SELECT * FROM `restaurant` where `restaurantId`=?";
	private String UPDATE="UPDATE `restaurant` SET `name`=?,`address`=?,`rating`=?,`cusine_type`=?,`isActive`=?,`eta`=?,`imagePath`=?"
			+ "WHERE `restaurantId`=?";
	private String DELETE="DELETE from `restaurant` WHERE `restaurantId`=?";
	private String SELECT_ALL="SELECT * FROM `restaurant`";
	@Override
	public void addRestaurant(Restaurant restaurant) {
		con=DBConnection.dbCon();
		try {
			PreparedStatement pstmt=con.prepareStatement(INSERT);
			pstmt.setString(1,restaurant.getName() );
			pstmt.setString(2,restaurant.getAddress() );
			pstmt.setString(3,restaurant.getRating() );
			pstmt.setString(4,restaurant.getCusineType());
			pstmt.setString(5,restaurant.getIsActive());
			pstmt.setString(6,restaurant.getEta());
			pstmt.setInt(7,restaurant.getAdminUserId());
			pstmt.setString(8,restaurant.getImagePath());
			
		    int res=pstmt.executeUpdate();
			System.out.println(res);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {
    con=DBConnection.dbCon();
    try {
		PreparedStatement pstmt=con.prepareStatement(UPDATE);
		pstmt.setString(1,restaurant.getName());
		pstmt.setString(2, restaurant.getAddress());
		pstmt.setString(3, restaurant.getRating());
		pstmt.setString(4,restaurant.getCusineType());
		pstmt.setString(5,restaurant.getIsActive());
		pstmt.setString(6, restaurant.getEta());
		pstmt.setString(7,restaurant.getImagePath());
		pstmt.setInt(8,restaurant.getRestaurantId());
		
		int res=pstmt.executeUpdate();
		System.out.println(res);
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
		
	}

	@Override
	public void deleteRestaurant(int restaurantId) {
		con=DBConnection.dbCon();
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, restaurantId);

			int res=pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		Connection con=DBConnection.dbCon();
		Restaurant restaurant=null;
		try {
			PreparedStatement pstmt=con.prepareStatement(SELECT);
			pstmt.setInt(1,restaurantId);
			
			ResultSet res=pstmt.executeQuery();
			while(res.next())
			{
				int id=res.getInt("restaurantId");
				String name=res.getString("name");
				String address=res.getString("address");
				String rating=res.getString("rating");
				String cusine_type=res.getString("cusine_type");
				String isActive=res.getString("isActive");
				String eta=res.getString("eta");
				int adminUserId=res.getInt("adminUserId");
				String imagePath=res.getString("imagePath");
				restaurant=new Restaurant(id, name, address, address, rating, cusine_type, isActive, eta, adminUserId, imagePath);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return restaurant;
	}

	@Override
	public List<Restaurant> getAllRestaurant() {
		Restaurant restaurant=null;
		List<Restaurant> list=new ArrayList<Restaurant>();
		try {
			Connection con=DBConnection.dbCon();
			PreparedStatement pstmt = con.prepareStatement(SELECT_ALL);
			ResultSet res=pstmt.executeQuery();
			while(res.next())
			{
				int id=res.getInt("restaurantId");
				String name=res.getString("name");
				String address=res.getString("address");
				String rating=res.getString("rating");
				String cusine_type=res.getString("cusine_type");
				String isActive=res.getString("isActive");
				String eta=res.getString("eta");
				int adminUserId=res.getInt("adminUserId");
				String imagePath=res.getString("imagePath");
				restaurant=new Restaurant(id, name, address, address, rating, cusine_type, isActive, eta, adminUserId, imagePath);
				list.add(restaurant);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
