package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DBManager {
	private static final String DBDriver = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/mysql";
	private static final String USER_NAME = "root";
	private static final String USER_PASSWORD = "root";
	private static Connection connection = null;
	
	public static Connection getconConnection () {
		try {
			
			Class.forName(DBDriver); 
//			Class.forName(Driver.class.getName());
		} catch (ClassNotFoundException e) {
			System.out.println("û���ҵ���");
		}
		
		
		try {
			connection = DriverManager.getConnection(URL, USER_NAME, USER_PASSWORD);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return connection;
	}
	
	public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
		try {
			resultSet.close();
			preparedStatement.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void close(Connection connection, PreparedStatement preparedStatement) {
		try {
			preparedStatement.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
}
