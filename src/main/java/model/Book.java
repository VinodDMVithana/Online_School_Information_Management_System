package model;

public class Book {

	private String id = null;
	private String bookName, ISBNNumber, author, publisher, type;

	public Book(String bookName, String ISBNNumber, String author, String publisher, String type) {
		this.bookName = bookName;
		this.ISBNNumber = ISBNNumber;
		this.author = author;
		this.publisher = publisher;
		this.type = type;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getISBNNumber() {
		return ISBNNumber;
	}

	public void setISBNNumber(String iSBNNumber) {
		ISBNNumber = iSBNNumber;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	} 
	
}
