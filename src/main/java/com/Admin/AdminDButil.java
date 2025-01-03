package com.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ScheduleClassPackage.ClassModel;
import ScheduleClassPackage.DBConnection;

import java.sql.ResultSet;

public class AdminDButil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static List<Admin> validate(String username, String password, String role) {
		ArrayList<Admin> admin = new ArrayList<>();

		// Validate login credentials
		try {

			con = ADBconnection.getConnection();
			stmt = con.createStatement();

			// SQL query that checks username, password, and role
			String sql = "SELECT * FROM school.users WHERE username = '" + username + "' AND password = '" + password
					+ "' AND role = '" + role + "'";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String user2 = rs.getString(5);
				String pass2 = rs.getString(6);
				String role1 = rs.getString(7);

				Admin a = new Admin(id, name, email, phone, user2, pass2, role1);
				admin.add(a);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return admin;
	}

	public static boolean insertuser(String name, String email, String phone, String username, String password,
			String role) {
		boolean isSuccess = false;

		try {
			con = ADBconnection.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO school.users VALUES (0, '" + name + "', '" + email + "', '" + phone + "', '"
					+ username + "', '" + password + "', '" + role + "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static boolean updateuser(String id, String name, String email, String phone, String username,
			String password, String role) {

		try {

			con = ADBconnection.getConnection();
			stmt = con.createStatement();
			String sql = "UPDATE school.users SET name = '" + name + "', email = '" + email + "', phone = '" + phone
					+ "', username = '" + username + "', password = '" + password + "' WHERE id = '" + id + "'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		return isSuccess;

	}

	public static boolean deleteuser(String id) {

		int convId = Integer.parseInt(id);

		try {

			con = ADBconnection.getConnection();
			stmt = con.createStatement();
			String sql = "DELETE FROM users WHERE id = '" + convId + "'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return isSuccess;
	}
}
