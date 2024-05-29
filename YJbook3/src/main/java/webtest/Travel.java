package webtest;


import java.io.Serializable;

public class Travel {
	private static final long serialversionUID = -4274700572038677000L;
	
	//��� ���� ����
	private String travelId; // ����Id
	private String travelArea; // ����
	private int unitPrice; //����
	private String description; //�󼼼���
	private String explain;	//����
	private String category; //�з�
	private String subheading;	//������
	private String travelDate; //����			
	private String image;   // �̹��� 
	
	//�⺻ ������ �ۼ�
	public Travel() {
		super();
	}
	
	public Travel(String image, String travelId, String travelArea, Integer unitPrice) {
		this.image = image;
		this.travelId = travelId;
		this.travelArea = travelArea;
		this.unitPrice = unitPrice;
	}
	
	//Setter/Getter() �޼ҵ� �ۼ�
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTravelId() {
		return travelId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setTravelId(String travelId) {
		this.travelId = travelId;
	}

	public String getTravelArea() {
		return travelArea;
	}

	public void setTravelArea(String travelArea) {
		this.travelArea = travelArea;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}

	public static long getSerialversionuid() {
		return serialversionUID;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getSubheading() {
		return subheading;
	}

	public void setSubheading(String subheading) {
		this.subheading = subheading;
	}
	
	
	
}