package dao;

import java.util.ArrayList;
import dto.Book;

public class BookRepository {
	
	public ArrayList<Book> getAllbooks(){
    	return listOfBooks;
    }
	
	//���� �� ������ �������� �޼ҵ� �����
		public Book getBookById(String bookId) {
			Book bookById = null;
			
			for(int i = 0; i< listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i);
				if(book != null && book.getBookId() != null &&
						book.getBookId().equals(bookId)) {
					bookById = book;
					break;
				}
			}
			return bookById;
		}
	
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	//�ű� ���� �����͸� �����ϴ� �޼ҵ�
	private static BookRepository instance =new BookRepository();
	public static BookRepository getInstance() {
		return instance;
	}
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
	
	public BookRepository() {
	    Book book1 = new Book("ISBN1234", "C# ���α׷���", "���糲", "�Ѻ���ī����", "IT�����", "2022/10/06", 1000, 27000);
	    book1.setDescription("C#�� ó�� ���ϴ� ���ڸ� ������� �ϴ��� ����ó�� �ڼ��� ������ å�̴�. "
	            + "�� �˾ƾ� �� �ٽ� ������ �⺻ ������ �ִ��� ���� ����������, �߿��� ������ "
	            + "���� ����, ����, ���� ���͵�, ���� �������� �ѹ� �� ������ �� �ִ�.");
	    book1.setFilename("box1.jpg");
	    
	    Book book2 = new Book("ISBN1235", "�ڹٸ�����", "�۹̿�", "�Ѻ���ī����", "IT�����", "2023/01/01", 1000, 30000);
	    book2.setDescription("�ڹٸ� ó�� ���� �л��� ���� �ڹ��� �⺻ ����� �ǽ� ������ �׸��� �̿��Ͽ� "
	            + "���� �����մϴ�. �ڹ��� �̷��� ���� -> �⺻ ���� -> ������Ʈ ������ �ܰ躰 �н��� �����ϸ�, "
	            + "�� é���� ������Ʈ�� �ǽ��ϸ鼭 �¶��� ������ �ϼ��� �� �ֵ��� �����Ͽ����ϴ�.");
	    book2.setUnitsInStock(1000);
	    book2.setFilename("box2.jpg");
	    
	    Book book3 = new Book("ISBN1236", "���̽� ���α׷���", "�ּ�ö", "�Ѻ���ī����", "IT�����", "2023/01/01", 1000, 30000);
	    book3.setDescription("���̽����� ���α׷����� �����ϴ� �Թ��ڰ� ���� ������ �� �ֵ��� �⺻ ������ ���ϰ� "
	            + "�����ϸ�, �پ��� ������ �����մϴ�. ���� ���α׷����� ���� ������ �����ϸ鼭 ���̽����� �����͸� ó���ϴ� ����� ���ϴ�.");
	    book3.setUnitsInStock(1000);
	    book3.setFilename("box3.jpg");
	    
	    listOfBooks.add(book1);
	    listOfBooks.add(book2);
	    listOfBooks.add(book3);
	}
	
}