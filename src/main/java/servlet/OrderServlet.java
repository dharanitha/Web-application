package servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.DAO.CartDAOImplement;

import DatabaseConnection.DataConnection;
import UserInterface.Cart;
@WebServlet("/order")
public class OrderServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("username");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String address=request.getParameter("address");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String pincode=request.getParameter("pincode");
			String payment=request.getParameter("payment");
			String fullAddress=address+","+city+","+state+","+pincode;
			System.out.println(name+" "+email+" "+phone+" "+fullAddress+" "+payment);
			CartDAOImplement cartDAO=new CartDAOImplement(DataConnection.databaseConnection());
			List<Cart> list=cartDAO.getProductByUser(id);
			
			if("select".equals(payment)) {
				response.sendRedirect("Payment.jsp");
			}
			else {
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}