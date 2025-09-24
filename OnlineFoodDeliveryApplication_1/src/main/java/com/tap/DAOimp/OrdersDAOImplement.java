package com.tap.DAOimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.Connection.DBConnection;
import com.tap.DAO.OrdersDAO;
import com.tap.model.Orders;
public class OrdersDAOImplement implements OrdersDAO{
	private static Connection con=null;
	private String INSERT="INSERT into `orders` (`userId`,`restaurantId`,`orderDate`,`totalAmount`,`status`,`payMentMode`,`deliveryAddress`)"
			+ "values (?,?,?,?,?,?,?)";
	private String SELECT="SELECT * FROM `orders` WHERE `orderId`=?";
	private String SELECT_ALL="SELECT * FROM `orders`";
	private String DELETE="DELETE FROM `orders` WHERE `orderId`=?";
	private String UPDATE="UPDATE `orders` SET `totalAmount`=?,`status`=?,`payMentMode`=?,`deliveryAddress`=? WHERE `orderId`=?";
	private String SELECT_SPECIFIC_USER="SELECT * FROM `orders` WHERE `userId`=?";

	@Override
	public int addOrder(Orders orders) {
    con=DBConnection.dbCon();
    int order_Id=0;
    try {
//		PreparedStatement pstmt=con.prepareStatement(INSERT);
		PreparedStatement pstmt=con.prepareStatement(INSERT,Statement.RETURN_GENERATED_KEYS);
		pstmt.setInt(1, orders.getUserId());
		pstmt.setInt(2,orders.getRestaurantId());
		pstmt.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
		pstmt.setDouble(4, orders.getTotalAmount());
		pstmt.setString(5, orders.getStatus());
		pstmt.setString(6,orders.getPayMentMode());
		pstmt.setString(7,orders.getDeliveryAddress());
		
		int res=pstmt.executeUpdate();
		ResultSet keys=pstmt.getGeneratedKeys();
		while(keys.next())
		{
			order_Id=keys.getInt(1);
		}
		//System.out.println(res);
	} catch (SQLException e) {
		e.printStackTrace();
	}
    return order_Id;
	}

	@Override
	public void updateOrder(Orders orders) {
     con=DBConnection.dbCon();
     try {
		PreparedStatement pstmt=con.prepareStatement(UPDATE);
		pstmt.setDouble(1, orders.getTotalAmount());
		pstmt.setString(2, orders.getStatus());
		pstmt.setString(3, orders.getPayMentMode());
		pstmt.setString(4, orders.getDeliveryAddress());
		pstmt.setInt(5, orders.getOrderId());
		
		int res=pstmt.executeUpdate();
		System.out.println(res);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

	@Override
	public void deleteOrder(int orderId) {
		con=DBConnection.dbCon();
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, orderId);
			
			int res=pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Orders getOrder(int orderId) {
		con=DBConnection.dbCon();
		Orders orders=null;
		try {
			PreparedStatement pstmt=con.prepareStatement(SELECT);
			pstmt.setInt(1, orderId);
			ResultSet res=pstmt.executeQuery();
			
			while(res.next())
			{
				int orderid=res.getInt("orderId");
				int userId=res.getInt("userId");
				int restaurantId=res.getInt("restaurantId");
				Timestamp orderDate=res.getTimestamp("orderDate");
				double totalAmount=res.getInt("totalAmount");
				String status=res.getString("status");
				String payMentMode=res.getString("payMentMode");
				String deliveryAddress=res.getString("deliveryAddress");
				
				orders=new Orders(orderid, userId, restaurantId, orderDate, totalAmount, status, payMentMode,deliveryAddress);
				System.out.println(orders);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public List<Orders> getAllOrders() {
	    con=DBConnection.dbCon();
		Orders order=null;
		List<Orders> list=new ArrayList<Orders>();
		try {
		PreparedStatement pstmt=con.prepareStatement(SELECT_ALL);
		ResultSet res=pstmt.executeQuery();
		while(res.next())
		{
			int orderId=res.getInt("orderId");
			int userId=res.getInt("userId");
			int restaurantId=res.getInt("restaurantId");
			Timestamp orderDate=res.getTimestamp("orderDate");
			double totalAmount=res.getInt("totalAmount");
			String status=res.getString("status");
			String payMentMode=res.getString("payMentMode");
			String deliveryAddress=res.getString("deliveryAddress");
			order=new Orders(orderId, userId, restaurantId, orderDate, totalAmount, status, payMentMode,deliveryAddress);
			list.add(order);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Orders> getAllOrders_SpecificId(int userId) {
      con=DBConnection.dbCon();
      Orders order=null;
      List<Orders> list=new ArrayList<Orders>();
      try {
		PreparedStatement pstmt=con.prepareStatement(SELECT_SPECIFIC_USER);
		pstmt.setInt(1, userId);
		ResultSet res=pstmt.executeQuery();
		while(res.next())
		{
			int orderId=res.getInt("orderId");
			int user_Id=res.getInt("userId");
			int restaurantId=res.getInt("restaurantId");
			Timestamp orderDate=res.getTimestamp("orderDate");
			double totalAmount=res.getInt("totalAmount");
			String status=res.getString("status");
			String payMentMode=res.getString("payMentMode");
			String deliveryAddress=res.getString("deliveryAddress");
			order=new Orders(orderId, user_Id, restaurantId, orderDate, totalAmount, status, payMentMode,deliveryAddress);
			list.add(order);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return list;
	}

}
