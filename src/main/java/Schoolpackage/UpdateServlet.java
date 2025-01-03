package Schoolpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String id= request.getParameter("id");
		String registrationno= request.getParameter("registrationno");
		String name= request.getParameter("name");
		String emailaddress= request.getParameter("emailaddress");
		String birthday= request.getParameter("birthday");
		String gender= request.getParameter("gender");
		String course= request.getParameter("course");
		String contactno= request.getParameter("contactno");
		
		boolean isTrue;
		isTrue = studentcontroller.updatedata( id, registrationno, name, emailaddress, birthday, gender, course, contactno);
		
		if(isTrue==true) {
			
			List<studentmodel> studentdetails = studentcontroller.getById(id);
			request.setAttribute("studentdetails",studentdetails);
			String alertMessage = "Data Update successfully";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href = 'GetAllServlet' </script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Yasintha/unsuccess.jsp");
			dis2.forward(request, response);
		}
		
		
	}

}
