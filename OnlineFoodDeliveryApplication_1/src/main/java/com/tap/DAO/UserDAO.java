package com.tap.DAO;

import java.util.List;

import com.tap.model.User;

public interface UserDAO {
	void addUser(User user);
	void updateUser(User user);
	void deleteUser(int userId);
	User getUser(int userId);
	User getUser(String userName);
	List<User> getAllUsers();
}
