package com.tap.model;

import java.sql.Timestamp;

public class User {
 
	private int userId;
	private String name;
	private String userName;
	private String passWord;
	private String email;
	private String phone;
	private String address;
	private String role;
	private Timestamp createdDate;
	private Timestamp lastLoginDate;
	
	public User(int userId, String name, String userName, String passWord, String email, String phone, String address,
			String role, Timestamp createdDate, Timestamp lastLoginDate) {
		super();
		this.userId = userId;
		this.name = name;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.createdDate = createdDate;
		this.lastLoginDate = lastLoginDate;
	}

	public User() {
		
	}
	
	public User(String name, String userName, String passWord, String email, String phone, String address,
			String role) {
		super();
		this.name = name;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
	}

	public User( String name, String userName, String passWord, String email, String phone, String address,
			String role, Timestamp createdDate, Timestamp lastLoginDate) {
		super();
		this.name = name;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.createdDate = createdDate;
		this.lastLoginDate = lastLoginDate;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserId() {
		return userId;
	}
	public  String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUsername(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", userName=" + userName + ", passWord=" + passWord
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", role=" + role + ", createdDate="
				+ createdDate + ", lastLoginDate=" + lastLoginDate + "]";
	}
	
	
	
	

	
}
