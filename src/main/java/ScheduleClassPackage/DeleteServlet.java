package ScheduleClassPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String id = request.getParameter("id");
	boolean isTrue;
	isTrue = ScheduleClassController.deletedata(id);
	if(isTrue == true) {
		String alertMessage = "Data delete successful";
		response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='GetAllClass';</script>");
	}
	else {
		List<ClassModel> scheduleclassdetails = ScheduleClassController.getById(id);
		request.setAttribute("scheduleclassdetails",scheduleclassdetails);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Dilshan/wrong.jsp");
		dispatcher.forward(request, response);
	}
	}

}
