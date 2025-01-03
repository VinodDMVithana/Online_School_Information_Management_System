package Schoolpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String registrationno = request.getParameter("registrationno");
		String name = request.getParameter("name");
		String emailaddress = request.getParameter("emailaddress");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String course = request.getParameter("course");
		String contactno = request.getParameter("contactno");

		boolean isTrue;

		// Validations
		if (registrationno == null || registrationno.trim().isEmpty()) {
			response.getWriter().println("<script>alert('Registration No is required.'); history.back();</script>");
			return;
		}

		if (name == null || name.trim().isEmpty()) {
			response.getWriter().println("<script>alert('Name is required.'); history.back();</script>");
			return;
		}

		if (emailaddress == null || !emailaddress.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
			response.getWriter().println("<script>alert('Valid Email Address is required.'); history.back();</script>");
			return;
		}

		if (birthday == null || birthday.trim().isEmpty()) {
			response.getWriter().println("<script>alert('Birthday is required.'); history.back();</script>");
			return;
		}

		if (gender == null || (!gender.equals("Male") && !gender.equals("Female") && !gender.equals("Other"))) {
			response.getWriter().println("<script>alert('Valid Gender is required.'); history.back();</script>");
			return;
		}

		if (course == null || course.trim().isEmpty()) {
			response.getWriter().println("<script>alert('Course is required.'); history.back();</script>");
			return;
		}

		if (contactno == null || !contactno.matches("\\d{10}")) {
			response.getWriter().println("<script>alert('Valid Contact No is required (10 digits).'); history.back();</script>");
			return;
		}

		// If validation passes,insert data
		isTrue = studentcontroller.insertdata(registrationno, name, emailaddress, birthday, gender, course, contactno);

		if (isTrue) {
			String alertMessage = "Data inserted successfully";
			response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href = 'GetAllServlet' </script>");
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Yasintha/unsuccess.jsp");
			dis2.forward(request, response);
		}
	}
}
