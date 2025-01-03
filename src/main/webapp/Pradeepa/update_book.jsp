<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page

import="service.BookService"
import="model.Book"

%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' media='screen' href='../css/add_book.css'>
</head>
<body>
<div class="registration_form">

	<%
	
	String id = request.getParameter("id");
	BookService bookService = new BookService(request,response);
	Book b = bookService.getBook(Integer.parseInt(id));
	
	%>

            <h1>Update Book</h1>
            <form action="../UpdateBook" method="POST">
            	<input type="hidden" name="id" value="<%=id%>"/>
                <p>Book Name:</p>
                <input type="text" name="bookName" placeholder="book name" value="<%= b.getBookName() %>" required>
                <p>ISBN Number:</p>
                <input type="text" name="isbnNumber" placeholder="ISBN number" value="<%= b.getISBNNumber() %>" required>
                <p>Author:</p>
                <input type="text" name="author" placeholder="author"  value="<%= b.getAuthor() %>" required>
                <p>Publisher:</p>
                <input type="text" name="publisher" placeholder="publisher"  value="<%= b.getPublisher() %>" required>
                <p>Type:</p>
                <select id="type" name="type" size="1">
                    <option value="novel">Novel</option>
                    <option value="mystery">Mystery</option>
                    <option value="fantasy">Fantasy</option>
                 </select>
                <input type="submit" class="button" name="submit" value="Update Book"/>
            </form>

        </div>

</body>
</html>