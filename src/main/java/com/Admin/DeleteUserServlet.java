package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("userid");

		boolean isTrue = AdminDButil.deleteuser(id);

		if (isTrue == true) {
			request.setAttribute("message", "Account deleted successfully!");
			request.setAttribute("alertType", "success");
		} else {
			request.setAttribute("message", "Unsuccessful attempt. Please try again.");
			request.setAttribute("alertType", "error");
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/Dilki/results.jsp");
		dispatcher.forward(request, response);
	}

}
