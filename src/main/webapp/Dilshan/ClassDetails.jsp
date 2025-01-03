<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scheduled Classes</title>

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
            min-height: 100vh;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        button {
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 300px;
            margin-bottom: 20px;
        }

        input[type="text"]:focus {
            border-color: #4CAF50;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }

            input[type="text"] {
                width: 100%;
                margin-bottom: 15px;
            }

            th, td {
                text-align: left;
                padding: 10px;
            }

            button {
                font-size: 14px;
                padding: 6px 10px;
            }
        }
    </style>
</head>
<body>

    <div>
        <h1>All Scheduled Classes</h1>
        <input type="text" id="searchInput" placeholder="Search..." oninput="filterTable()">
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Grade</th>
                    <th>Subject</th>
                    <th>Teacher</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Link</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="scheduleclass" items="${allClasses}">
                    <tr>
                        <td>${scheduleclass.id}</td>
                        <td>${scheduleclass.classname}</td>
                        <td>${scheduleclass.subject}</td>
                        <td>${scheduleclass.teachername}</td>
                        <td>${scheduleclass.date}</td>
                        <td>${scheduleclass.time}</td>
                        <td><a href="${scheduleclass.link}" target="_blank">Join Class</a></td>
                        <td>
                            <a href="Dilshan/update.jsp?id=${scheduleclass.id}&classname=${scheduleclass.classname}&subject=${scheduleclass.subject}&teachername=${scheduleclass.teachername}&date=${scheduleclass.date}&time=${scheduleclass.time}&link=${scheduleclass.link}">
                                <button>Update</button>
                            </a>
                        </td>
                        <td>
                            <form action="DeleteServlet" method="post">
                                <input type="hidden" name="id" value="${scheduleclass.id}">
                                <button>Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>
        function filterTable() {
            var input = document.getElementById("searchInput");
            var filter = input.value.toUpperCase();
            var table = document.querySelector("table");
            var tr = table.getElementsByTagName("tr");

            for (var i = 1; i < tr.length; i++) {
                var rowMatches = false;
                var td = tr[i].getElementsByTagName("td");

                for (var j = 0; j < td.length; j++) {
                    if (td[j]) {
                        var txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            rowMatches = true;
                            break;
                        }
                    }
                }

                tr[i].style.display = rowMatches ? "" : "none";
            }
        }
    </script>
</body>
</html>
