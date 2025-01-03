package app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	public static Connection initializeConnection() throws SQLException, ClassNotFoundException {
		
		
		String dbDriver = "com.mysql.jdbc.Driver"; 
        String dbURL = "jdbc:mysql://localhost/school"; 
        String dbUsername = "root"; 
        String dbPassword = "yasintha"; 
		
        Class.forName(dbDriver);
		Connection connection = DriverManager.getConnection(dbURL,dbUsername,dbPassword);
		
		
		return connection;
	}

}
