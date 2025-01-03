package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import app.DatabaseConnection;
import model.Book;

public class BookService {
	
	HttpServletRequest request;
	HttpServletResponse response;
	Connection dbConn;
	
	public BookService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		
		try {
			dbConn = DatabaseConnection.initializeConnection();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}
	
	public void addBook(Book book) {
		
		try {
			
			PreparedStatement st1 = dbConn.prepareStatement("INSERT INTO book(book_name,isbn_number,author,publisher,type) VALUES(?,?,?,?,?)");
			
			st1.setString(1, book.getBookName());
			st1.setString(2, book.getISBNNumber());
			st1.setString(3, book.getAuthor());
			st1.setString(4, book.getPublisher());
			st1.setString(5, book.getType());
	
			st1.executeUpdate();
			st1.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Message - "+e.getMessage());
		}
		
	}
	
	public void deleteBook(int itemId) {
		
		try {
			
			PreparedStatement st1 = dbConn.prepareStatement("DELETE FROM book WHERE id=?");
			st1.setInt(1, itemId);
			
			st1.execute();
			st1.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Message - "+e.getMessage());
		}
		
	}
	
	public void updateBook(Book book) {
		
		
		try {
			
			PreparedStatement st1 = dbConn.prepareStatement("UPDATE book SET book_name=?, isbn_number=?, author=?, publisher=?, type=? WHERE id=?");
			
			st1.setString(1, book.getBookName());
			st1.setString(2, book.getISBNNumber());
			st1.setString(3, book.getAuthor());
			st1.setString(4, book.getPublisher());
			st1.setString(5, book.getType());
			st1.setString(6, book.getId());
			
			st1.executeUpdate();
			st1.close();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public Book getBook(int id){
	
		Book b = null;
		
		try {
		
			
			PreparedStatement st1 = dbConn.prepareStatement("SELECT * FROM book WHERE id=?");
			st1.setInt(1, id);
			ResultSet rs = st1.executeQuery();
			rs.next();
			
			int idDb = rs.getInt(1);
			String bookName = rs.getString(2);
			String isbnNumber = rs.getString(3);
			String author = rs.getString(4);
			String publisher = rs.getString(5);
			String type = rs.getString(6);
			
			b = new Book(bookName,isbnNumber,author,publisher,type);
			b.setId(String.valueOf(idDb));

			rs.close();
			st1.close();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return b;
	}


	public List<Book> getBooks(){
		
		List<Book> bookItemList = new ArrayList<>();
		
		try {
		
			PreparedStatement st1 = dbConn.prepareStatement("SELECT * FROM book ORDER by id DESC");
			ResultSet resultSet = st1.executeQuery();
			while(resultSet.next()) {
				
				int id = resultSet.getInt(1);
				String bookName = resultSet.getString(2);
				String isbnNumber = resultSet.getString(3);
				String author = resultSet.getString(4);
				String publisher = resultSet.getString(5);
				String type = resultSet.getString(6);
				
				Book b = new Book(bookName,isbnNumber,author,publisher,type);
				b.setId(String.valueOf(id));
				
				bookItemList.add(b);
				
			}

			resultSet.close();
			st1.close();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bookItemList;
	}

}
