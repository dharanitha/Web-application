package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.DAO.CartDAOImplement;
import com.DAO.ProductDAOImplement;

import DatabaseConnection.DataConnection;
import UserInterface.Cart;
import UserInterface.Product;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int productId=Integer.parseInt(request.getParameter("productId"));
			int userId=Integer.parseInt(request.getParameter("userId"));
			ProductDAOImplement productDAO=new ProductDAOImplement(DataConnection.databaseConnection());
			Product product=productDAO.getProductById(productId);
			Cart cart=new Cart();
			cart.setProductId(productId);
			cart.setProductName(product.getProductName());
			cart.setUserId(userId);
			cart.setCategory(product.getCategory());
			cart.setPrice(Double.parseDouble(product.getProductPrice()));
			cart.setTotalPrice(Double.parseDouble(product.getProductPrice()));
			
			CartDAOImplement cartDAO=new CartDAOImplement(DataConnection.databaseConnection());
			boolean status=cartDAO.addCart(cart);
			if(status) {
				response.sendRedirect("Bouquet.jsp?message=valid");
			}
			else {
				response.sendRedirect("Bouquet.jsp?message=invalid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}