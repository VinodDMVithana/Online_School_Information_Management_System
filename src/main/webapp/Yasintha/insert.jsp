<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details Form</title>

<!-- Add some CSS for styling -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-top: 30px;
        font-size: 28px;
    }

    form {
        background-color: #fff;
        border-radius: 8px;
        max-width: 500px;
        margin: 20px auto;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    table {
        width: 100%;
    }

    td {
        padding: 10px;
    }

    input[type="text"], input[type="email"], select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    tr:nth-child(odd) {
        background-color: #f9f9f9;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
    td:first-child {
        font-weight: bold;
        color: #555;
    }
</style>

<script>
// Form validation part
function validateForm() {
    var regNo = document.forms["studentForm"]["registrationno"].value;
    var email = document.forms["studentForm"]["emailaddress"].value;
    var birthday = document.forms["studentForm"]["birthday"].value;
    var contactNo = document.forms["studentForm"]["contactno"].value;
    
    var regNoPattern = /^[A-Za-z0-9]+$/;  // Allow alphanumeric characters
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;  // Simple email pattern
    var birthdayPattern = /^\d{4}-\d{2}-\d{2}$/;  // YYYY-MM-DD format
    var contactNoPattern = /^[0-9]{10}$/;  // Exactly 10 digits for phone number

    if (!regNoPattern.test(regNo)) {
        alert("Please enter a valid Registration No (alphanumeric).");
        return false;
    }
    
    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }
    
    if (!birthdayPattern.date(birthday)) {
        alert("Please enter a valid birthday in the format YYYY-MM-DD.");
        return false;
    }
    
    if (!contactNoPattern.test(contactNo)) {
        alert("Please enter a valid 10-digit contact number.");
        return false;
    }

    return true;  // validations pass
}
</script>

</head>
<body>
  
  <h2>Enter Student Details</h2>
  <form name="studentForm" action="../InsertServlet" method="post" onsubmit="return validateForm()">
    <table>
        <tr>
            <td>Registration No:</td>
            <td><input type="text" name="registrationno" required></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td>Email Address:</td>
            <td><input type="text" name="emailaddress" required></td>
        </tr>
        <tr>
            <td>Birthday:</td>
            <td><input type="text" name="birthday" required></td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>
                <select name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Course:</td>
            <td>
                <select name="course" required>
                    <option value="">Select Course</option>
                    <option value="Computer Science">Computer Science</option>
                    <option value="Information Technology">Information Technology</option>
                    <option value="Software Engineering">Software Engineering</option>
                    <option value="Data Science">Data Science</option>
                    <option value="Cyber Security">Cyber Security</option>
                    <option value="Interactive Media">Interactive Media</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Contact No:</td>
            <td><input type="text" name="contactno" required></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>    
    
</body>
</html>
