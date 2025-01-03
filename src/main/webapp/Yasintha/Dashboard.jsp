<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management Dashboard</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* Added a plain background color instead of the image */
        }

        .dashboard-container {
            display: flex;
            height: 100vh;
            background-color: rgba(255, 255, 255, 0.8); /* Add a slight white background for contrast */
        }

        /* Sidebar Styles */
        .sidebar {
            background-color: #34495e;
            width: 250px;
            padding: 20px;
            color: white;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-family: 'Verdana', sans-serif;
            font-size: 26px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 20px 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .sidebar ul li a:hover {
            background-color: #2c3e50;
            transform: translateX(5px);
        }

        /* Main Content Styles */
        .main-content {
            flex-grow: 1;
            padding: 40px;
        }

        .main-content h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #2c3e50;
            font-family: 'Georgia', serif;
        }

        .main-content p {
            font-size: 18px;
            color: #555;
            line-height: 1.6;
        }

        /* Button Styling */
        .add-student-button {
            background-color: #f39c12;
            color: white;
            padding: 15px 30px;
            border: none;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            display: inline-block;
            transition: background-color 0.3s, transform 0.3s;
        }

        .add-student-button:hover {
            background-color: #e67e22;
            transform: scale(1.05);
        }

        /* Footer Styling */
        .footer {
            background-color: #34495e;
            padding: 10px;
            text-align: center;
            color: white;
            position: absolute;
            bottom: 0;
            width: 100%;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>Admin Dashboard</h2>
            <ul>
                <li><a href="Manage Students.jsp"><span class="icon">👥</span> Manage Students</a></li>
                <li><a href="enrollments.jsp"><span class="icon">📚</span> Course Enrollments</a></li>
                <li><a href="reports.jsp"><span class="icon">📊</span> Performance Reports</a></li>
                <li><a href="settings.jsp"><span class="icon">⚙️</span> System Settings</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <h1>Welcome to the Student Registration System.</h1>
            <p>
              "Streamline student registration and track academic progress with our user-friendly dashboard. Easily add new students and manage course enrollments!"
            </p>
            <!-- Add Student Button -->
            <form action="insert.jsp" method="get">
                <button type="submit" class="add-student-button">➕ Add New Student</button>
            </form>
        </div>
    </div>
    
    <!-- Footer -->
    <div class="footer">
     <p>&copy; 2024 SIMS College Student Registration System | All rights reserved.</p>
    </div>
</body>
</html>
