package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import UserInterface.User;

public class UserDAOImplement implements UserDAO{
	
	private Connection connection;

	public UserDAOImplement(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean userRegister(User user) {
		boolean status=false;
		try {
			String userquery="insert into user(username,email,password,repassword,phonenumber,address,city,state,pincode) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparestatement=connection.prepareStatement(userquery);
			preparestatement.setString(1,user.getUsername());
			preparestatement.setString(2,user.getEmail());
			preparestatement.setString(3,user.getPassword());
			preparestatement.setString(4,user.getRepassword());
			preparestatement.setString(5,user.getPhonenumber());
			preparestatement.setString(6,user.getAddress());
			preparestatement.setString(7,user.getCity());
			preparestatement.setString(8,user.getState());
			preparestatement.setString(9,user.getPincode());
			int index=preparestatement.executeUpdate();
			if(index==1) {
				status=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public User login(String username, String password) {
		User user=null;
		try {
			String userquery="select * from user where username=? and password=?";
			PreparedStatement preparestatement=connection.prepareStatement(userquery);
			preparestatement.setString(1,username);
			preparestatement.setString(2,password);
			ResultSet resultset=preparestatement.executeQuery();
			while(resultset.next()) {
				user=new User();
				user.setId(resultset.getInt(1));
				user.setUsername(resultset.getString(2));
				user.setEmail(resultset.getString(3));
				user.setPassword(resultset.getString(4));
				user.setRepassword(resultset.getString(5));
				user.setPhonenumber(resultset.getString(6));
				user.setAddress(resultset.getString(7));
				user.setCity(resultset.getString(8));
				user.setState(resultset.getString(9));
				user.setPincode(resultset.getString(10));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}