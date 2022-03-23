package DatabaseConnection;
import java.sql.*;
public class DataConnection{
	public static Connection databaseConnection() {
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
      		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","Aspire@123");
      		return connection;
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
}