package com.DAO;
import java.util.List; 
import UserInterface.Cart;

public interface CartDAO {
	public boolean addCart(Cart cart);
	
	public List<Cart> getProductByUser(int userId);
	
	public boolean deleteProduct(int productId);
}