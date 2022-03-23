package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAOImplement;
import DatabaseConnection.DataConnection;
import UserInterface.User;
@WebServlet("/Login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserDAOImplement userDAO=new UserDAOImplement(DataConnection.databaseConnection());
			HttpSession session=request.getSession();
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			if("Admin".equals(username) && "Admin@123".equals(password)) {
				User user=new User();
				user.setUsername("Admin");
				session.setAttribute("username", username);
				response.sendRedirect("ApplicationInterface/Admin.jsp");
			}else {
				User user=userDAO.login(username, password);
				if(user!=null) {
					session.setAttribute("username",username);
					response.sendRedirect("Home.jsp");
				}
				else {
					response.sendRedirect("Login.jsp?message=notexist");
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}