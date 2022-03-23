package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import UserInterface.Cart;

public class CartDAOImplement implements CartDAO{
	private Connection connection;
	
	public CartDAOImplement(Connection connection) {
		this.connection=connection;
	}

	public boolean addCart(Cart cart) {
		boolean status=false;
		try {
			String sql="insert into cart(ProductId,UserId,ProductName,Category,Price,TotalPrice) values(?,?,?,?,?,?)";
			PreparedStatement preparestatement=connection.prepareStatement(sql);
			preparestatement.setInt(1, cart.getProductId());
			preparestatement.setInt(2, cart.getUserId());
			preparestatement.setString(3, cart.getProductName());
			preparestatement.setString(4, cart.getCategory());
			preparestatement.setDouble(5, cart.getPrice());
			preparestatement.setDouble(6, cart.getTotalPrice());
			int index=preparestatement.executeUpdate();
			if(index==1) {
				status=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public List<Cart> getProductByUser(int userId) {
		List<Cart> list=new ArrayList<Cart>();
		Cart cart=null;
		double totalPrice=0;
		try {
			String sql="select * from cart where UserId=?";
			PreparedStatement preparestatement=connection.prepareStatement(sql);
			preparestatement.setInt(1, userId);
			ResultSet resultSet=preparestatement.executeQuery();
			while(resultSet.next()) {
				cart=new Cart();
				cart.setCartId(resultSet.getInt(1));
				cart.setProductId(resultSet.getInt(2));
				cart.setUserId(resultSet.getInt(3));
				cart.setProductName(resultSet.getString(4));
				cart.setCategory(resultSet.getString(5));
				cart.setPrice(resultSet.getDouble(6));
				totalPrice=totalPrice+resultSet.getDouble(7);
				cart.setTotalPrice(totalPrice);
				list.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteProduct(int productId) {
		boolean status=false;
		try {
			String sql="delete from cart where ProductId=?";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, productId);
			int index=preparedStatement.executeUpdate();
			if(index==1) {
				status=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	

}