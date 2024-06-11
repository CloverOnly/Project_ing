package dto;

import java.io.Serializable;

public class Book implements Serializable {
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String bookId;		//���� ID
	private String name;		//������
	private int unitPrice;		//����
	private String author;		//����
	private String description;	//����
	private String publisher;	//���ǻ�
	private String category;	//�з�
	private int unitsInStock;	//�����
	private String releaseDate;	//������(��/��)
	private String condition;	//����ǰ or ����ǰ or ���ۺ���ǰ
	private String filename;	//�̹��� ���ϸ�
	private int quantity;		//��ٱ���
//member	
	private String id;			//ȸ�� ���̵�
	private String password;	//��й�ȣ
	private String user_name;	//�̸�
	private String gender;		//����
	private String birth;		//����
	private String mail;		//����
	private String phone;		//��ȭ��ȣ
	private String address;		//�ּ�
	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setUnitsInStock(int unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	//��ٱ��� ������
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuqntity(int quantity) {
		this.quantity = quantity;
	}
	
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