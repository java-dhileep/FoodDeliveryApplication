package com.tap.DAOimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.Connection.DBConnection;
import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;

public class OrderItemDAOImplement implements OrderItemDAO {
private static Connection con=null;
private String INSERT="INSERT into `orderitem` (`orderId`,`menuId`,`quantity`,`totalPrize`)"
		+ "values (?,?,?,?)";
private String DELETE="DELETE FROM `orderitem` WHERE `orderItemId`=?";
private String SELECT="SELECT * FROM `orderitem` WHERE `orderId`=?";
private String SELECT_ALL="SELECT * FROM `orderitem`";
private String UPDATE="UPDATE `orderitem` SET `quantity`=? , `totalPrize`=? WHERE `orderItemId`=?";
private String SELECT_ALL_SPECIFIC_ORDER="SELECT * FROM `orderitem` WHERE `orderId`=?";
	@Override
	public void addOrderItem(OrderItem orderItem) {
     con=DBConnection.dbCon();
     try {
		PreparedStatement pstmt=con.prepareStatement(INSERT);
		pstmt.setInt(1,orderItem.getOrderId() );
		pstmt.setInt(2, orderItem.getMenuId());
		pstmt.setInt(3, orderItem.getQuantity());
		pstmt.setDouble(4, orderItem.getTotalPrize());
		
		int res=pstmt.executeUpdate();
		System.out.println(res);
	} catch (SQLException e) {
		e.printStackTrace();
	}
		
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
     		con=DBConnection.dbCon();
     		try {
				PreparedStatement pstmt=con.prepareStatement(UPDATE);
				pstmt.setInt(1,orderItem.getQuantity());
				pstmt.setDouble(2, orderItem.getTotalPrize());
				pstmt.setInt(3, orderItem.getOrderItemId());
				int res=pstmt.executeUpdate();
				System.out.println(res);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	@Override
	public void deleteOrderItem(int orderId) {

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
	public OrderItem getOrderItem(int orderId) {
		con=DBConnection.dbCon();
		OrderItem orderItem=null;
		try {
			PreparedStatement pstmt=con.prepareStatement(SELECT);
			pstmt.setInt(1, orderId);
			ResultSet res=pstmt.executeQuery();
			while(res.next())
			{
				int orderItemId=res.getInt("orderItemId");
				int orderid=res.getInt("orderId");
				int menuId=res.getInt("menuId");
				int quantity=res.getInt("quantity");
				double totalPrize=res.getDouble("totalPrize");
				
				orderItem=new OrderItem(orderItemId, orderid, menuId, quantity, totalPrize);
				System.err.println(orderItem);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderItem;
	}

	@Override
	public List<OrderItem> getAllOrderItemSpecificOrderId(int orderId) {
		con=DBConnection.dbCon();
		OrderItem orderItem=null;
		List<OrderItem> list=new ArrayList<OrderItem>();
		try {
			PreparedStatement pstmt=con.prepareStatement(SELECT_ALL_SPECIFIC_ORDER);			
			pstmt.setInt(1, orderId);
			ResultSet res=pstmt.executeQuery();
			while(res.next())
			{
				int orderItemId=res.getInt("orderItemId");
				int orderid=res.getInt("orderId");
				int menuId=res.getInt("menuId");
				int quantity=res.getInt("quantity");
				double totalPrize=res.getDouble("totalPrize");
				
				orderItem=new OrderItem(orderItemId, orderid, menuId, quantity, totalPrize);
				System.err.println(orderItem);
				list.add(orderItem);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<OrderItem> getAllOrderItem() {
		con=DBConnection.dbCon();
		OrderItem orderItem=null;
		List<OrderItem> list=new ArrayList<OrderItem>();
		try {
			PreparedStatement pstmt=con.prepareStatement(SELECT_ALL);
			ResultSet res=pstmt.executeQuery();
			while(res.next())
			{
				int orderItemId=res.getInt("orderItemId");
				int orderid=res.getInt("orderId");
				int menuId=res.getInt("menuId");
				int quantity=res.getInt("quantity");
				double totalPrize=res.getDouble("totalPrize");
				
				orderItem=new OrderItem(orderItemId, orderid, menuId, quantity, totalPrize);
				System.err.println(orderItem);
				list.add(orderItem);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
