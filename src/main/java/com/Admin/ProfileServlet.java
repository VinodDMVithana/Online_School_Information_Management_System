package com.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		String role = (String) session.getAttribute("role");

		try {
			// Validate the user using credentials
			List<Admin> adDetails = AdminDButil.validate(username, password, role);
			if (!adDetails.isEmpty()) {
				request.setAttribute("adDetails", adDetails);

				// Forward to the appropriate JSP based on the role
				if ("admin".equals(role)) {
					RequestDispatcher dis = request.getRequestDispatcher("Dilki/Admin1.jsp");
					dis.forward(request, response);
				} else if ("teacher".equals(role)) {
					RequestDispatcher dis = request.getRequestDispatcher("Dilki/teacher1.jsp");
					dis.forward(request, response);
				} else if ("student".equals(role)) {
					RequestDispatcher dis = request.getRequestDispatcher("Dilki/student1.jsp");
					dis.forward(request, response);
				} else if ("librarian".equals(role)) {
					RequestDispatcher dis = request.getRequestDispatcher("Dilki/librarian1.jsp");
					dis.forward(request, response);
				} else {
					response.sendRedirect("Dilki/login.jsp?error=invalidRole");
				}
			} else {
				response.sendRedirect("Dilki/login.jsp?error=invalidCredentials");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
