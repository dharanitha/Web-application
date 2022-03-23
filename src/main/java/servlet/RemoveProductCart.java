package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.DAO.CartDAOImplement;

import DatabaseConnection.DataConnection;
@WebServlet("/remove_product")
public class RemoveProductCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId=Integer.parseInt(request.getParameter("productId"));
		CartDAOImplement cartDAO=new CartDAOImplement(DataConnection.databaseConnection());
		boolean status=cartDAO.deleteProduct(productId);
		if(status) {
			response.sendRedirect("Checkout.jsp?message=valid");
		}
		else {
			response.sendRedirect("Checkout.jsp?message=invalid");
		}
	}
	
	
	
}