package webtest;

import java.util.ArrayList;


//자바빈즈로 사용할 데이터 접근 클래스
//T_Information.jsp를 쓰기 위한 작업
public class TravelRepository {
	private ArrayList<Travel> listOfTravel = new ArrayList<Travel>();
	
	//addArea.jsp를 쓰기 위한 작업--------------------
	private static TravelRepository instance = new TravelRepository();
	
	public static TravelRepository getInstance() {
		return instance;
	}

	
	//멤버 변수와 기본 생성자 만들기
	public TravelRepository() {
		Travel travel1 = new Travel("image/jp.jpg" ,"T01", "일본(오사카,교토)", 350000);	
		
		travel1.setDescription("오사카 교토 3박 4일 일정\n 1일차 난바 중심 관광 -> 2일차 교토 당일치기 -> "
				 										+	"3일차 우메다 근처 관광 -> 4일차 돌아갑니다.");
		travel1.setCategory("Overseas Travel");
		travel1.setTravelDate("2024-06-01 ~ 2024-06-05");
		
		Travel travel2 = new Travel("image/ta.jpg", "T02", "대만", 400000);
		
		travel2.setDescription("대만 3박 4일 일정\n 1일차 중정기념당 - 마라마관람차- 스린야시장(저녁식사겸) - 숙소 -> "
				                              + "2일차 고궁박물원 - 점심(오각선반,五角船板,wujiaochuanban, 퓨전요리식당이며 고궁에서 가까워요) - 스파이역 황츠원취엔온천 - 마라훠궈(저녁식사) -용산사 - 까르푸 - 숙소 "
													+ "3일차 예스진지 택시투어 - 딩타이펑(저녁식사) - 쓰무시망고빙수 + 용캉제 - 숙소 -> "
													+ "4일차 숙소 체크아웃 - 타이페이메인역근처 지하상가 구경- 귀국 오후 1시 25분 타오위안공항출발 ");
		travel2.setCategory("Overseas Travel");
		travel2.setTravelDate("2024-06-20 ~ 2024-06-23");
		
		Travel travel3 = new Travel("image/tw.jpg", "T03", "태국", 623000);
		
		travel3.setDescription("태국 3박 4일 일정\n 1일차 방콕 수완나폼공항 도착 - 파타야 이동 - 호텔 체크인 "
									+"2일차 파타야의 대표 관광지 둘러보기 -> 3일차  산호섬 투어 -> 4일차 파타야 호텔 체크아웃 방콕으로 이동");
		travel3.setCategory("Overseas Travel");
		travel3.setTravelDate("2024-05-19 ~ 2024-05-22");
		
		
		
		listOfTravel.add(travel1);
		listOfTravel.add(travel2);
		listOfTravel.add(travel3);
		
		
	}

	//T_Information.jsp를 쓰기 위한 작업
	public Travel getTravelById(String travelId) {
		Travel travelById = null;
		
		for(int i = 0; i < listOfTravel.size(); i++) {
			Travel travel = listOfTravel.get(i);
			if(travel != null && travel.getTravelId() != null && travel.getTravelId().equals(travelId)) {
				travelById = travel;
				break;
			}
		}
		return travelById;
	}

	//addArea.jsp를 쓰기 위한 작업
	public void addArea(Travel travel) {
		listOfTravel.add(travel);
	}
	
	public ArrayList<Travel> getAllTravel(){
		return listOfTravel;
	}
}