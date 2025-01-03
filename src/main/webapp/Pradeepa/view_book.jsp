<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page

import="service.BookService"
import="model.Book"
import="java.util.List"

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' media='screen' href='../css/view_book.css'>
</head>
<body>

	<h1 class="header">Manage Books</h1>
    <div class="table-container">
        <table class="book-table">
            <thead class="head">
                <tr>
                    <th>Book Name</th>
                    <th>ISBN Number</th>
                    <th>Author</th>
                    <th>Publisher</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                
                <%
	
				BookService bookService = new BookService(request,response);
				List<Book> bookList = bookService.getBooks();
				
				for(int i = 0; i < bookList.size(); i++){
				
					Book b = bookList.get(i);
					
				%>
				
				  <tr>
                        <td><%= b.getBookName() %></td>
                        <td><%= b.getISBNNumber() %></td>
                        <td><%= b.getAuthor() %></td>
                        <td><%= b.getPublisher() %></td>
                        <td><%= b.getType() %></td>
                        <td>
                            <div style="display: flex;">
                            
                            	<a href="update_book.jsp?id=<%= b.getId() %>">
                            		<button class="button-ud">UPDATE</button>
                            	</a>
	                            
	                           
	                            <form style="margin-left: 15px;" method="POST" action="../DeleteBook">
	                            	<input type="hidden" value="<%= b.getId() %>" name="id"/>
	                            	<button type="submit" class="button-ud">DELETE</button>
	                            </form>
	                            
                            </div>
                        </td>
                    </tr>
                    
				<%
				
				}
				
				%>
                
            </tbody>
        </table>
    </div>

</body>
</html>