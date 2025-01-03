<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Information</title>

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

    form {
        width: 40%; /* Smaller form width */
        margin: 20px auto;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    table {
        width: 100%;
    }

    td {
        padding: 10px;
    }

    input[type="text"],
    select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        color: #333;
    }

    input[type="submit"] {
        padding: 10px 15px;
        background-color: #4CAF50; /* Green color */
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        width: 100%; /* Full width for submit button */
    }

    input[type="submit"]:hover {
        background-color: #45a049; /* Darker green on hover */
    }
</style>

<!-- JavaScript validation -->
<script>
    function validateForm() {
        // Get the form elements
        var name = document.getElementById("name").value.trim();
        var email = document.getElementById("emailaddress").value.trim();
        var birthday = document.getElementById("birthday").value.trim();
        var contactNo = document.getElementById("contactno").value.trim();
        var emailPattern = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;  // Regular expression for email validation
        var contactPattern = /^[0-9]{10}$/;  // Regular expression for 10-digit phone number
        
        // Check if the name is empty
        if (name === "") {
            alert("Name is required.");
            return false;
        }

        // Validate email format
        if (!emailPattern.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }

        // Validate birthday (simple check if it's empty)
        if (birthday === "") {
            alert("Birthday is required.");
            return false;
        }

        // Validate contact number to be 10 digits
        if (!contactPattern.test(contactNo)) {
            alert("Please enter a valid 10-digit contact number.");
            return false;
        }

        return true;  // If all validations pass
    }
</script>

</head>
<body>

<h2>Update Student Information</h2>

<%
  String id = request.getParameter("id");
  String registrationno = request.getParameter("registrationno");
  String name = request.getParameter("name");
  String emailaddress = request.getParameter("emailaddress");
  String birthday = request.getParameter("birthday");
  String gender = request.getParameter("gender");
  String course = request.getParameter("course");
  String contactno = request.getParameter("contactno");
%>

<form action="../UpdateServlet" method="post" onsubmit="return validateForm()">
    <table>
        <tr>
            <td>ID:</td>
            <td><input type="text" id="id" name="id" value="<%=id%>" readonly></td>
        </tr>
        <tr>
            <td>Registration No:</td>
            <td><input type="text" id="registrationno" name="registrationno" value="<%=registrationno%>" required></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" id="name" name="name" value="<%=name%>" required></td>
        </tr>
        <tr>
            <td>Email Address:</td>
            <td><input type="text" id="emailaddress" name="emailaddress" value="<%=emailaddress%>" required></td>
        </tr>
        <tr>
            <td>Birthday:</td>
            <td><input type="text" id="birthday" name="birthday" value="<%=birthday%>" required></td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>
                <select id="gender" name="gender" required>
                    <option value="" disabled>Select Gender</option>
                    <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= gender.equals("Other") ? "selected" : "" %>>Other</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Course:</td>
            <td>
                <select id="course" name="course" required>
                    <option value="" disabled>Select Course</option>
                    <option value="Computer Science" <%= course.equals("Computer Science") ? "selected" : "" %>>Computer Science</option>
                    <option value="Information Technology" <%= course.equals("Information Technology") ? "selected" : "" %>>Information Technology</option>
                    <option value="Software Engineering" <%= course.equals("Software Engineering") ? "selected" : "" %>>Software Engineering</option>
                    <option value="Data Science" <%= course.equals("Data Science") ? "selected" : "" %>>Data Science</option>
                    <option value="Cyber Security" <%= course.equals("Cyber Security") ? "selected" : "" %>>Cyber Security</option>
                    <option value="Interactive Media" <%= course.equals("Interactive Media") ? "selected" : "" %>>Interactive Media</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Contact No:</td>
            <td><input type="text" id="contactno" name="contactno" value="<%=contactno%>" required></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>    

</body>
</html>
