package com.DAO;

import java.util.List;

import UserInterface.Product;

public interface ProductDAO {
	public boolean addProduct(Product product);
	public List<Product> getAllProduct();
	public Product getProductById(int id);
	public boolean updateEditProduct(Product product);
	public boolean deleteProduct(int id);
	public List<Product> getBouquetProduct();
	public List<Product> getPotProduct();
	public List<Product> getAllBouquetProduct();
	public List<Product> getAllPotProduct();
}