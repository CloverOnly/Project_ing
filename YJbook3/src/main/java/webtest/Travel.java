package webtest;


import java.io.Serializable;

public class Travel {
	private static final long serialversionUID = -4274700572038677000L;
	
	//멤버 변수 선언
	private String travelId; // 여행Id
	private String travelArea; // 나라
	private int unitPrice; //가격
	private String description; //상세설명
	private String explain;	//설명
	private String category; //분류
	private String subheading;	//소제목
	private String travelDate; //일정			
	private String image;   // 이미지 
	
	//기본 생성자 작성
	public Travel() {
		super();
	}
	
	public Travel(String image, String travelId, String travelArea, Integer unitPrice) {
		this.image = image;
		this.travelId = travelId;
		this.travelArea = travelArea;
		this.unitPrice = unitPrice;
	}
	
	//Setter/Getter() 메소드 작성
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