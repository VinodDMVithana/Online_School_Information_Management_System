package com.Admin;

import java.sql.DriverManager;
import java.sql.Connection;

public class ADBconnection {

	private static String url = "jdbc:mysql://localhost:3306/school";
	private static String user = "root";
	private static String pass1 = "yasintha";
	private static Connection con;

	public static Connection getConnection() {

		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass1);

		} catch (Exception e) {

			System.out.println("database connection error");

		}

		return con;
	}

}
