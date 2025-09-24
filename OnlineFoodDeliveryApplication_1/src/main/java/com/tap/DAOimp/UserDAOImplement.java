package com.tap.DAOimp;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.tap.Connection.DBConnection;
import com.tap.DAO.UserDAO;
import com.tap.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
public class UserDAOImplement implements UserDAO{

	private static Connection con=null;
	private String INSERT="INSERT into `user` (`name`,`username`,`password`,`email`,`phone`,`address`,`role`,`crateddate`,`lastlongindate`) values "
			+ "(?,?,?,?,?,?,?,?,?)";
	private String SELECT_QUERY="SELECT * from `user` WHERE `userId` =?";
	private String SELECT_QUERY_1="SELECT * from `user` WHERE `username` =?";
	private String UPDATE = "UPDATE `user` SET `name`=?, `username`=?,`password`=?, `email`=? ,`phone`=? ,`address`=? ,`role`=? WHERE `userId`=? ";
	private String SELECT_ALL="SELECT * from `user`";
	private String DELETE_QUERY="DELETE from `user` WHERE `userId`=?";
	@Override
	public void addUser(User user) { 
		con=DBConnection.dbCon();
		try {
			PreparedStatement pstmt=con.prepareStatement(INSERT);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getUserName());
			pstmt.setString(3,user.getPassWord());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getAddress());
			pstmt.setString(7, user.getRole());
			pstmt.setTimestamp(8,new Timestamp(System.currentTimeMillis()) );
			pstmt.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
			
			int res=pstmt.executeUpdate();
			System.out.println(res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateUser(User user) {
     		con=DBConnection.dbCon();
     		try {
				PreparedStatement pstmt=con.prepareStatement(UPDATE);
				pstmt.setString(1,user.getName());
				pstmt.setString(2, user.getUserName());
				pstmt.setString(3, user.getPassWord());
				pstmt.setString(4, user.getEmail());
				pstmt.setString(5, user.getPhone());
				pstmt.setString(6, user.getAddress());
				pstmt.setString(7, user.getRole());
				pstmt.setInt(8, user.getUserId());
				
				int res=pstmt.executeUpdate();
				System.out.println("Rows affected: " + res);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	@Override
	public void deleteUser(int userId) {
		con=DBConnection.dbCon();
	
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, userId);
			int res=pstmt.executeUpdate();
			System.out.println(res);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public User getUser(int userId) {
		User user=null;
		con=DBConnection.dbCon();
		 try {
		PreparedStatement ptmt=con.prepareStatement(SELECT_QUERY);
		ptmt.setInt(1, userId);
		ResultSet res=ptmt.executeQuery();
		while(res.next())
		{
			int in=res.getInt("userId");
			String name=res.getString("name");
			String userName=res.getString("userName");
			String password=res.getString("passWord");
			String email=res.getString("email");
			String phone=res.getString("phone");
			String address = res.getString("address");
			String role=res.getString("role");
			Timestamp create_Date=res.getTimestamp("crateddate");
			Timestamp lostlogin_Date=res.getTimestamp("lastlongindate");
			user=new User(name, userName, password, email, phone, address, role, create_Date, lostlogin_Date);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public User getUser(String userName) {
		User user=null;
		con=DBConnection.dbCon();
		 try {
		PreparedStatement ptmt=con.prepareStatement(SELECT_QUERY_1);
		ptmt.setString(1, userName);
		ResultSet res=ptmt.executeQuery();
		while(res.next())
		{
			int id=res.getInt("userId");
			String name=res.getString("name");
			String userame=res.getString("userName");
			String password=res.getString("passWord");
			String email=res.getString("email");
			String phone=res.getString("phone");
			String address = res.getString("address");
			String role=res.getString("role");
			Timestamp create_Date=res.getTimestamp("crateddate");
			Timestamp lostlogin_Date=res.getTimestamp("lastlongindate");
			user=new User(id,name, userName, password, email, phone, address, role, create_Date, lostlogin_Date);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public List<User> getAllUsers() {
    con=DBConnection.dbCon();
    List<User> list=new ArrayList<User>();
    try {
		PreparedStatement pstmt=con.prepareStatement(SELECT_ALL);
		ResultSet res=pstmt.executeQuery();
		while(res.next())
		{
			int userId=res.getInt("userId");
			String name=res.getString("name");
			String userName=res.getString("userName");
			String password=res.getString("passWord");
			String email=res.getString("email");
			String phone=res.getString("address");
			String role=res.getString("role");
			Timestamp create_Date=res.getTimestamp("crateddate");
			Timestamp lostlogin_Date=res.getTimestamp("lastlongindate");
			User user=new User(userId,name, userName, password, email, phone, phone, role, create_Date, lostlogin_Date);
			list.add(user);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return list;
	}

}
