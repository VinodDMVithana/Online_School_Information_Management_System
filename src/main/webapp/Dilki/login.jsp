<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - SIMS College</title>
<link rel="stylesheet" href="../css/Astyles.css">
<link rel="stylesheet" href="../css/Astyles2.css">

</head>
<body>

	<header>
		<h2>Welcome to SIMS College</h2>
	</header>

	<div class="form-container">
		<h3>Login</h3>
		<form action="../LoginServlet" method="post">
			<label for="user1">User Name:</label> <input type="text" id="user1"
				name="user1" required> <label for="password">Password:</label>
			<input type="password" id="password" name="password" required>

			<label for="role">Role:</label> <select id="role" name="role"
				required>
				<option value="">Select Role</option>
				<option value="admin">Admin</option>
				<option value="teacher">Teacher</option>
				<option value="student">Student</option>
				<option value="librarian">Librarian</option>
			</select> <input type="submit" name="submit" value="Login">
		</form>

		<div class="signup-link">
			No account? <a href="register.jsp">Register here</a>
		</div>
	</div>

	<footer>
		<p>&copy; 2024 SIMS System. All rights reserved. We are Y2S1
			SE/OOP/WD/MLB/G7 students</p>
	</footer>

</body>
</html>
