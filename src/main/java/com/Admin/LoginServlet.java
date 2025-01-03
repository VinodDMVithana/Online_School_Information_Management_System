package com.Admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("user1");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		try {
			List<Admin> adDetails = AdminDButil.validate(username, password, role);
			if (!adDetails.isEmpty()) {
				// Set session attributes
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				session.setAttribute("role", role);

				// Redirect to the main page after successful login
				response.sendRedirect("Dilki/index2.jsp");
			} else {
				response.sendRedirect("Dilki/login.jsp?error=invalidCredentials");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
