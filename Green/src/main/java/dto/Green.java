package dto;

import java.io.Serializable;

public class Green implements Serializable {
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String greenId;		//채소 ID
	private String name;		//채소명
	private int unitPrice;		//가격
	private String author;		//심은 사람
	private String description;	//설명
	private String category;	//분류
	private int unitsInStock;	//재고개수
	private String releaseDate;	//재배일(월/년)
	private String filename;	//이미지 파일명
	private int quantity;		//장바구니
	
	//기본 생성자 
	public Green() {
		super();
	}
	
	//getter setter
	public String getGreenId() {
		return greenId;
	}

	public void setGreenId(String greenId) {
		this.greenId = greenId;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(int unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Green(String greenId, String name, String author, String category, String releaseDate, int unitPrice, int unitsInStock) {
        this.greenId = greenId;
        this.name = name;
        this.author = author;
        this.category = category;
        this.releaseDate = releaseDate;
        this.unitPrice = unitPrice;
        this.unitsInStock = unitsInStock;
    }
}