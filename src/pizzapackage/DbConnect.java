package pizzapackage;
import java.sql.*;
public class DbConnect {
public static Connection getConnection() throws Exception
{
	String login="root";
	String password="";
	String url="jdbc:mysql://localhost:3306/pizzadb";
	Connection cnx=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	cnx= (Connection) DriverManager.getConnection(url, login, password);
	return cnx;
	
	}
}
