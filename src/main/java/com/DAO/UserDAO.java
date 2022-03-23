package com.DAO;

import UserInterface.User;

public interface UserDAO {
	public boolean userRegister(User user);
	public User login(String username,String password);
}