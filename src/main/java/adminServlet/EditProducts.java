package adminServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.DAO.ProductDAOImplement;

import DatabaseConnection.DataConnection;
import UserInterface.Product;

@WebServlet("/EditProduct")
public class EditProducts extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String productId=request.getParameter("id");
			String productName=request.getParameter("productName");
			String productPrice=request.getParameter("productPrice");
			String status=request.getParameter("status");
			Product product=new Product();
			product.setProductId(productId);
			product.setProductName(productName);
			product.setProductPrice(productPrice);
			product.setStatus(status);
			ProductDAOImplement productDAO=new ProductDAOImplement(DataConnection.databaseConnection());
			boolean edit=productDAO.updateEditProduct(product);
			if(edit) {
				response.sendRedirect("ApplicationInterface/Add-Edit product.jsp?message=done");
			}
			else {
				response.sendRedirect("ApplicationInterface/Add-Edit product.jsp?message=wrong");
			}
			
		}
		catch(Exception e) {
			
		}
	}

}