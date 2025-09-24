package com.tap.DAOimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.Connection.DBConnection;
import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
public class MenuDAOImplement implements MenuDAO{

	private String INSERT ="INSERT into `menu` (`restaurantId`,`itemName`,`description`,`price`,`ratings`,`isAvailable`,`imagePath`) values"
			+ "(?,?,?,?,?,?)";
	private String SELECT="SELECT * from `menu` where `menuid`= ?";
	private String SELECT_ALL="SELECT * from `menu`";
	private String DELETE="DELETE FROM `menu` WHERE `menuid`=?";
	private String UPDATE="UPDATE `menu` SET `itemName`=?, `description`=? ,`price`=? ,`ratings`=? ,`isAvailable`=?,`imagePath`=? WHERE "
			+ "`menuId`=?";
	private String SELECT_MENU_BY_RESTAURNT ="SELECT * FROM `menu` WHERE `restaurantId`=?";

	@Override
	public void addMenu(Menu menu) {
		Connection con=DBConnection.dbCon();
	   try {
		PreparedStatement stmtm= con.prepareStatement(INSERT);
		stmtm.setInt(1, menu.getRestaurantId());
		stmtm.setString(2,menu.getItemName());
		stmtm.setString(3, menu.getDescription());
		stmtm.setInt(4, menu.getPrice());
		stmtm.setString(5,menu.getRatings());
		stmtm.setString(6, menu.getIsAvailable());
		stmtm.setString(7, menu.getImagePath());
		
		int res=stmtm.executeUpdate();
		System.out.println(res);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

	@Override
	public void updateMenu(Menu menu) {
		Connection con=DBConnection.dbCon();
		try {
			PreparedStatement pstmt=con.prepareStatement(UPDATE);
			pstmt.setString(1,menu.getItemName() );
			pstmt.setString(2, menu.getDescription());
			pstmt.setInt(3, menu.getPrice());
			pstmt.setString(4, menu.getRatings());
			pstmt.setString(5, menu.getIsAvailable());
			pstmt.setString(6, menu.getImagePath());
			
			pstmt.setInt(7, menu.getMenuId());
			
			int res=pstmt.executeUpdate();
			
			System.out.println(res);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId) {
		Connection con=DBConnection.dbCon();
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, menuId);
			int res=pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menuId) {
		Connection con=DBConnection.dbCon();
		Menu menu=null;
		try {
			PreparedStatement pstmt=con.prepareStatement(SELECT);
			pstmt.setInt(1,menuId);
			ResultSet res=pstmt.executeQuery();
		     while(res.next())
			{
			 int menuid=res.getInt("menuId");
			 int restaurantId=res.getInt("restaurantId");
			 String itemName=res.getString("itemName");
			 String description=res.getString("description");
			 int price=res.getInt("price");
			 String ratings=res.getString("ratings");
			 String isAvailable=res.getString("isAvailable");
			 String imagePath=res.getString("imagePath");
			 
          menu=new Menu(menuid,restaurantId,itemName,description,price,ratings,isAvailable,imagePath);
         // System.out.println(menu);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public List<Menu> getAllMenus() {
  Connection con=DBConnection.dbCon();
  List<Menu> list=new ArrayList<Menu>();
  try {
	PreparedStatement pstmt=con.prepareStatement(SELECT_ALL);
	ResultSet res=pstmt.executeQuery();
	while(res.next())
	{
		int menuid=res.getInt("menuId");
		int restaurantId=res.getInt("restaurantId");
		String itemName=res.getString("itemName");
		String description=res.getString("description");
		int price=res.getInt("price");
		String ratings=res.getString("ratings");
		String isAvailable=res.getString("isAvailable");
		String imagePath=res.getString("imagePath");
		Menu menu=new Menu(menuid, restaurantId, itemName, description, price, ratings, isAvailable, imagePath);
		list.add(menu);
	}
} catch (SQLException e) {
	e.printStackTrace();
}
		return list;
	}

	@Override
	public List getAllMenuByRestaurant(int restaurantId) {
     Connection con=DBConnection.dbCon();
     List<Menu> list=new ArrayList<Menu>();
    try {
		PreparedStatement pstmt=con.prepareStatement(SELECT_MENU_BY_RESTAURNT);
		pstmt.setInt(1, restaurantId);
		ResultSet res=pstmt.executeQuery();
		while(res.next())
		{
			int menuid=res.getInt("menuId");
			int restaurantId1=res.getInt("restaurantId");
			String itemName=res.getString("itemName");
			String description=res.getString("description");
			int price=res.getInt("price");
			String ratings=res.getString("ratings");
			String isAvailable=res.getString("isAvailable");
			String imagePath=res.getString("imagePath");
			Menu menu=new Menu(menuid, restaurantId1, itemName, description, price, ratings, isAvailable, imagePath);
			list.add(menu);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
    return list;
	}

}
