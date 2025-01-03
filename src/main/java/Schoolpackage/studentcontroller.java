package Schoolpackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class studentcontroller {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

//Insert data function
	public static boolean insertdata(String registrationno,String name,String emailaddress,String birthday,String gender,String course,String contactno) {
	
	boolean isSuccess = false;
	try {
		//DB Connection
		con=DBConnection.getConnection();
		stmt=con.createStatement();
		
		//SQL query
		String sql = "insert into student values(0,'"+registrationno+"','"+name+"','"+emailaddress+"','"+birthday+"','"+gender+"','"+course+"','"+contactno+"')";
	    int rs = stmt.executeUpdate(sql);
	    if(rs>0) {
	    	isSuccess = true;
	    }
	    else {
	    	isSuccess = false;
	    	
	    }
	}catch(Exception e) {
		e.printStackTrace();
	  }  
	   
return isSuccess;
}
	//GetById
	public static List<studentmodel> getById(String Id){
	
		int convertedID = Integer.parseInt(Id);
		ArrayList <studentmodel> student = new ArrayList<>();
		
		try {
			//DB Connection
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			//Query
			String sql = "select * from student where id'"+convertedID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String registrationno = rs.getString(2);
				String name = rs.getString(3);
				String emailaddress = rs.getString(4);
				String birthday = rs.getString(5);
				String gender = rs.getString(6);
				String course = rs.getString(7);
				String contactno = rs.getString(8);
				
				studentmodel sd = new studentmodel(id,registrationno,name,emailaddress,birthday,gender,course,contactno);
				student.add(sd);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return student;
		}
	//GetAll Data
	public static List<studentmodel> getAllstudent() {
	ArrayList <studentmodel> students = new ArrayList<>();
	try {
		//DB Connection
		con=DBConnection.getConnection();
		stmt=con.createStatement();
		
		//Query
		String sql = "select * from student";
		
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			int id = rs.getInt(1);
			String registrationno = rs.getString(2);
			String name = rs.getString(3);
			String emailaddress = rs.getString(4);
			String birthday = rs.getString(5);
			String gender = rs.getString(6);
			String course = rs.getString(7);
			String contactno = rs.getString(8);
			
			studentmodel sd = new studentmodel(id,registrationno,name,emailaddress,birthday,gender,course,contactno);
			students.add(sd);
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return students;
	}	
	//Update data
	public static boolean updatedata(String id,String registrationno,String name,String emailaddress,String birthday,String gender,String course,String contactno) {
		try {
			//DBConnection
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			String sql ="update student set registrationno='"+registrationno+"',name='"+name+"',emailaddress= '"+emailaddress+"',birthday='"+birthday+"',gender='"+gender+"',course='"+course+"',contactno='"+contactno+"'"
		           +"where id='"+id+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
		    	isSuccess = true;
		    }
		    else {
		    	isSuccess = false;
		    	
		    }
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	return isSuccess;
	}
		
	//Delete Data
	public static boolean deletedata(String id) {
		int convID = Integer.parseInt(id);
		try {
			//DB Connection
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			String sql = "delete from student where id= '"+convID+"'";
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
		    	isSuccess = true;
		    }
		    else {
		    	isSuccess = false;
		    	
		    }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	}
	
