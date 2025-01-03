package ScheduleClassPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateClass")
public class UpdateClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String classname = request.getParameter("classname");
		String subject = request.getParameter("subject");
		String teachername = request.getParameter("teachername");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String link = request.getParameter("link");
		
		boolean isTrue;
		isTrue = ScheduleClassController.updatedata(id, classname, subject, teachername, date, time, link);
		
		if(isTrue == true) {
			List<ClassModel> scheduleclassdetails = ScheduleClassController.getById(id);
			request.setAttribute("scheduleclassdetails",scheduleclassdetails);
			
			String alertMessage = "Data update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllClass'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Dilshan/wrong.jsp");
			dis2.forward(request, response);
		}
		
	}

}
