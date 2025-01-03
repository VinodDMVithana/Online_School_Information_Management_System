package ScheduleClassPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ScheduleClassController {
	
	//connectdb
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//insertdatafunction
	public static boolean insertdata(String classname,String subject,String teachername,String date,String time,String link) {
		boolean isSuccess = false;
		try {
			//dbconnectioncall
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//sqlquery
			String sql = "insert into scheduleclass values(0,'"+classname+"','"+subject+"','"+teachername+"','"+date+"','"+time+"','"+link+"')";
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	//getbyid
	public static List<ClassModel> getById (String Id){
		
		int convertedId = Integer.parseInt(Id);
		
		ArrayList <ClassModel> scheduleclass = new ArrayList<>();
		
		try {
			//DBConnection 
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from scheduleclass where id='"+convertedId+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String classname = rs.getString(2);
				String subject = rs.getString(3);
				String teachername = rs.getString(4);
				String date = rs.getString(5);
				String time = rs.getString(6);
				String link = rs.getString(7);
				
				ClassModel cm= new ClassModel(id,classname,subject,teachername,date,time,link);
				scheduleclass.add(cm);
			}
			
			}
		catch(Exception e) {
			e.printStackTrace();
		}
		return scheduleclass;
	}
	//getalldata
	public static List<ClassModel> getAllClass (){
		ArrayList <ClassModel> scheduleclasses = new ArrayList<>();
		
		try {
			//DBConnection 
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from scheduleclass";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String classname = rs.getString(2);
				String subject = rs.getString(3);
				String teachername = rs.getString(4);
				String date = rs.getString(5);
				String time = rs.getString(6);
				String link = rs.getString(7);
				
				ClassModel cm= new ClassModel(id,classname,subject,teachername,date,time,link);
				scheduleclasses.add(cm);
			}
			
			}
		catch(Exception e) {
			e.printStackTrace();
		}
		return scheduleclasses;
	}
	
	//updateController
	public static boolean updatedata(String id,String classname,String subject,String teachername,String date,String time,String link) {
		
		try {
			//DBConnection 
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//sqlQuery
			String sql = "update scheduleclass set classname='"+classname+"',subject='"+subject+"',teachername='"+teachername+"',date='"+date+"',time='"+time+"',link='"+link+"'"
					+"where id= '"+id+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//deletedata
	public static boolean deletedata(String id) {
		
		int convID = Integer.parseInt(id);
		try {
			//DBConnection 
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//sqlQuery
			String sql = "delete from scheduleclass where id='"+convID+"'";

			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
}
