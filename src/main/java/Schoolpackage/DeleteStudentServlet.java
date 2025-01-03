package Schoolpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String id = request.getParameter("id");
	    boolean isTrue;
	    isTrue = studentcontroller.deletedata(id);
	    if(isTrue == true) {
	    	String alertMassage = "Data Delete Successful";
	    	response.getWriter().println("<script>alert('"+alertMassage+"');"+"window.location.href='GetAllServlet';</script>");
	    }
	    else {
	    	List<studentmodel> studentdetails = studentcontroller.getById(id);
	    	request.setAttribute("studentdetails", studentdetails);
	    	
	    	RequestDispatcher dispacher =  request.getRequestDispatcher("Yasintha/unsuccess.jsp");
	    	dispacher.forward(request, response);
	    }
	}

}
