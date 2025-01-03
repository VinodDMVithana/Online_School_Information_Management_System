<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Class</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            margin: 0 auto;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="date"], input[type="time"], input[type="url"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[readonly] {
            background-color: #e9e9e9;
        }

        button {
            padding: 10px;
            border: none;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        @media (max-width: 600px) {
            .container {
                padding: 15px;
            }

            input, select, button {
                font-size: 14px;
                padding: 8px;
            }

            button {
                font-size: 15px;
            }
        }
    </style>

    <script>
        function setTodayDate() {
            var today = new Date();
            var day = String(today.getDate()).padStart(2, '0');
            var month = String(today.getMonth() + 1).padStart(2, '0');
            var year = today.getFullYear();
            var todayDate = year + '-' + month + '-' + day;
            var dateInput = document.getElementById("date");
            dateInput.min = todayDate;
        }

        window.onload = setTodayDate;
    </script>
</head>
<body>

<%
    String id = request.getParameter("id");
    String classname = request.getParameter("classname");
    String subject = request.getParameter("subject");
    String teachername = request.getParameter("teachername");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String link = request.getParameter("link");
%>

<div class="container">
    <h2>Update Class</h2>
    <form action="../UpdateClass" method="post">
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" id="id" name="id" value="<%=id%>" readonly>
        </div>

        <div class="form-group">
            <label for="classname">Class Name</label>
            <select id="classname" name="classname" required>
                <option value="Grade 1" <%= classname.equals("Grade 1") ? "selected" : "" %>>Grade 1</option>
                <option value="Grade 2" <%= classname.equals("Grade 2") ? "selected" : "" %>>Grade 2</option>
                <option value="Grade 3" <%= classname.equals("Grade 3") ? "selected" : "" %>>Grade 3</option>
                <option value="Grade 4" <%= classname.equals("Grade 4") ? "selected" : "" %>>Grade 4</option>
                <option value="Grade 5" <%= classname.equals("Grade 5") ? "selected" : "" %>>Grade 5</option>
                <option value="Grade 6" <%= classname.equals("Grade 6") ? "selected" : "" %>>Grade 6</option>
                <option value="Grade 7" <%= classname.equals("Grade 7") ? "selected" : "" %>>Grade 7</option>
                <option value="Grade 8" <%= classname.equals("Grade 8") ? "selected" : "" %>>Grade 8</option>
                <option value="Grade 9" <%= classname.equals("Grade 9") ? "selected" : "" %>>Grade 9</option>
                <option value="Grade 10" <%= classname.equals("Grade 10") ? "selected" : "" %>>Grade 1</option>
                <option value="Grade 11" <%= classname.equals("Grade 11") ? "selected" : "" %>>Grade 2</option>
                <option value="Grade 12" <%= classname.equals("Grade 12") ? "selected" : "" %>>Grade 12</option>
            </select>
        </div>

        <div class="form-group">
            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" value="<%=subject%>" required>
        </div>

        <div class="form-group">
            <label for="teachername">Teacher Name</label>
            <input type="text" id="teachername" name="teachername" value="<%=teachername%>" required>
        </div>

        <div class="form-group">
            <label for="date">Date</label>
            <input type="date" id="date" name="date" value="<%=date%>" required>
        </div>

        <div class="form-group">
            <label for="time">Time</label>
            <input type="time" id="time" name="time" value="<%=time%>" required>
        </div>

        <div class="form-group">
            <label for="link">Link</label>
            <input type="text" id="link" name="link" value="<%=link%>" required>
        </div>

        <button type="submit">Update Class</button>
    </form>
</div>

</body>
</html>
