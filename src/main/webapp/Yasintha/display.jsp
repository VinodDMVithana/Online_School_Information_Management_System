<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Table</title>

<!-- CSS for styling -->
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        margin-top: 30px;
        font-size: 28px;
        color: #333;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 12px 20px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #e1f5c4;
    }

    td {
        font-size: 14px;
        color: #555;
    }

    .button-container {
        display: flex;
        justify-content: center;
        gap: 10px;
    }

    button {
        padding: 8px 15px;
        background-color: #4CAF50;
        border: none;
        color: white;
        font-size: 14px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #45a049;
    }

    form {
        display: inline;
    }

    input[type="hidden"] {
        display: none;
    }

    /* CSS for search bar and button */
    .search-bar {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    #searchInput {
        padding: 10px;
        width: 60%;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    .search-button {
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        margin-left: 10px;
    }

    .search-button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<h2>Student Table</h2>

<!-- Search bar -->
<div class="search-bar">
    <input type="text" id="searchInput" placeholder="Search..." />
    <button class="search-button" onclick="filterTable()">Search</button>
</div>

<table>
   <tr>
     <th>ID</th>
     <th>Registration No</th>
     <th>Name</th>
     <th>Email Address</th>
     <th>Birthday</th>
     <th>Gender</th>
     <th>Course</th>
     <th>Contact No</th>
     <th>Action</th>
   </tr>
   <c:forEach var="student" items="${allstudents}">
   <tr>
     <td>${student.id}</td>
     <td>${student.registrationno}</td>
     <td>${student.name}</td>
     <td>${student.emailaddress}</td>
     <td>${student.birthday}</td>
     <td>${student.gender}</td>
     <td>${student.course}</td>
     <td>${student.contactno}</td>
     
     <td>
       <div class="button-container">
           <a href="Yasintha/update.jsp?id=${student.id}&registrationno=${student.registrationno}&name=${student.name}&emailaddress=${student.emailaddress}&birthday=${student.birthday}&gender=${student.gender}&course=${student.course}&contactno=${student.contactno}">
               <button>Update</button>
           </a>
           
           <form action="DeleteStudentServlet" method="post">
               <input type="hidden" name="id" value="${student.id}"/>
               <button type="submit">Delete</button>
           </form>
       </div>
     </td>
   </tr>
   </c:forEach>
</table>

<script>
function filterTable() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.querySelector("table");
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length; i++) {
        tr[i].style.display = "none"; // Hide all rows initially
        td = tr[i].getElementsByTagName("td");
        for (var j = 0; j < td.length; j++) {
            if (td[j]) {
                txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                    break;
                }
            }
        }
    }
}

document.getElementById("searchInput").addEventListener("input", filterTable);
</script>

</body>
</html>
