package ScheduleClassPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertServelet")
public class InsertServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classname = request.getParameter("classname");
		String subject = request.getParameter("subject");
		String teachername = request.getParameter("teachername");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String link = request.getParameter("link");
		
		boolean isTrue;
		
		isTrue = ScheduleClassController.insertdata(classname, subject, teachername, date, time, link);
		
		if(isTrue == true) {
			String alertMessage = "Data insert Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllClass'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Dilshan/wrong.jsp");
			dis2.forward(request, response);
		}
			
	}

}
