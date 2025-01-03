<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Class</title>
    
    <!-- Google Fonts for modern look -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }

        label, input, select {
            display: block;
            width: 100%;
        }

        select, input[type="text"], input[type="date"], input[type="time"], input[type="submit"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
            font-size: 1rem;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        @media (max-width: 600px) {
            form {
                padding: 15px;
            }

            td {
                padding: 5px;
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
            dateInput.value = todayDate;
            dateInput.min = todayDate;
        }

        window.onload = setTodayDate;
    </script>
</head>
<body>
    <form action="../InsertServelet" method="post">
        <h2>Schedule Class</h2>
        <table>
            <tr>
                <td>
                    <label for="classname">Class Name</label>
                    <select id="classname" name="classname" required>
                        <option selected disabled>Select Grade</option>
                        <option>Grade 1</option>
                        <option>Grade 2</option>
                        <option>Grade 3</option>
                        <option>Grade 4</option>
                        <option>Grade 5</option>
                        <option>Grade 6</option>
                        <option>Grade 7</option>
                        <option>Grade 8</option>
                        <option>Grade 9</option>
                        <option>Grade 10</option>
                        <option>Grade 11</option>
                        <option>Grade 12</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="subject">Subject</label>
                    <input type="text" id="subject" name="subject" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="teachername">Teacher Name</label>
                    <input type="text" id="teachername" name="teachername" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="date">Date</label>
                    <input type="date" id="date" name="date" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="time">Time</label>
                    <input type="time" id="time" name="time" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="link">Class Link</label>
                    <input type="text" id="link" name="link" required>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
