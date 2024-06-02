package dto;

import java.io.Serializable;

public class Book implements Serializable {
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String bookId;		//도서 ID
	private String name;		//도서명
	private int unitPrice;		//가격
	private String author;		//저자
	private String description;	//설명
	private String publisher;	//출판사
	private String category;	//분류
	private int unitsInStock;	//재고개수
	private String releaseDate;	//출판일(월/년)
	private String condition;	//신제품 or 구제품 or 리퍼브제품
	private String filename;	//이미지 파일명
	
	public Book() {
		super();
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(Integer unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Book(String bookId, String name, String author, String publisher, String category, String releaseDate, int unitPrice, int unitsInStock) {
        this.bookId = bookId;
        this.name = name;
        this.author = author;
        this.publisher = publisher;
        this.category = category;
        this.releaseDate = releaseDate;
        
        this.unitPrice = unitPrice;
        this.unitsInStock = unitsInStock;
    }
}