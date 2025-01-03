<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' media='screen' href='../css/add_book.css'>
</head>
<body>
<div class="registration_form">

            <h1>Add New Books</h1>
            <form action="../AddBook" method="POST">
                <p>Book Name:</p>
                <input type="text" name="bookName" placeholder="book name" required>
                <p>ISBN Number:</p>
                <input type="text" name="isbnNumber" placeholder="ISBN number" required>
                <p>Author:</p>
                <input type="text" name="author" placeholder="author" required>
                <p>Publisher:</p>
                <input type="text" name="publisher" placeholder="publisher" required>
                <p>Type:</p>
                <select id="type" name="type" size="1">
                    <option value="novel">Novel</option>
                    <option value="mystery">Mystery</option>
                    <option value="fantasy">Fantasy</option>
                  </select>
                <input type="submit" class="button" name="submit" value="Add Book"/>
            </form>

        </div>

</body>
</html>