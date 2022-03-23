package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.DAO.UserDAOImplement;
import DatabaseConnection.DataConnection;
import UserInterface.User;
@WebServlet("/SignUp")
public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String username=request.getParameter("username");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String repassword=request.getParameter("re-password");
			String phoneNumber=request.getParameter("phonenumber");
			String address=request.getParameter("address");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String pincode=request.getParameter("pincode");
			
			//System.out.println(username+" "+email+" "+password+" "+repassword+" "+phoneNumber);
			User user=new User();
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);
			user.setRepassword(repassword);
			user.setPhonenumber(phoneNumber);
			user.setAddress(address);
			user.setCity(city);
			user.setState(state);
			user.setPincode(pincode);
			
			UserDAOImplement userDAO=new UserDAOImplement(DataConnection.databaseConnection());
			boolean status=userDAO.userRegister(user);
			if(status) {
				response.sendRedirect("Login.jsp?message=valid");
			}
			else {
				response.sendRedirect("SignUp.jsp?message=invalid");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}