
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

	//
	//멤버 변수와 기본 생성자 만들기
	public TravelRepository() {
		Travel travel1 = new Travel("image/jp.jpg" ,"T01", "일본(오사카,교토)", 350000);	
		travel1.setCategory("Overseas Travel");
		travel1.setSubheading("오사카/교토 3박 4일 #사진 촬영 서비스 #투어 버스 포함");
		travel1.setExplain("오사카 교토 여행 투어버스 포함");
		travel1.setDescription("오사카 교토 3박 4일 일정\n 1일차 난바 중심 관광 -> 2일차 교토 당일치기 -> "
				 										+	"3일차 우메다 근처 관광 -> 4일차 돌아갑니다.");
		
		travel1.setTravelDate("2024-06-01 ~ 2024-06-05");
		
		Travel travel2 = new Travel("image/tw.jpg", "T02", "대만", 400000);
		
		travel2.setDescription("대만 3박 4일 일정\n 1일차 중정기념당 - 마라마관람차- 스린야시장(저녁식사겸) - 숙소 -> "
				                              + "2일차 고궁박물원 - 점심(오각선반,五角船板,wujiaochuanban, 퓨전요리식당이며 고궁에서 가까워요) - 스파이역 황츠원취엔온천 - 마라훠궈(저녁식사) -용산사 - 까르푸 - 숙소 "
													+ "3일차 예스진지 택시투어 - 딩타이펑(저녁식사) - 쓰무시망고빙수 + 용캉제 - 숙소 -> "
													+ "4일차 숙소 체크아웃 - 타이페이메인역근처 지하상가 구경- 귀국 오후 1시 25분 타오위안공항출발 ");
		travel2.setCategory("Overseas Travel");
		travel2.setSubheading("대만 3박 4일 #사진 촬영 서비스 #투어 버스 포함");
		travel2.setExplain("대만 아름다운 연등& 야시장");
		travel2.setTravelDate("2024-06-20 ~ 2024-06-23");
		
		Travel travel3 = new Travel("image/ta.jpg", "T03", "태국", 623000);
		
		travel3.setDescription("태국 3박 4일 일정\n 1일차 방콕 수완나폼공항 도착 - 파타야 이동 - 호텔 체크인 "
									+"2일차 파타야의 대표 관광지 둘러보기 -> 3일차  산호섬 투어 -> 4일차 파타야 호텔 체크아웃 방콕으로 이동");
		travel3.setCategory("Overseas Travel");
		travel3.setSubheading("태국 3박 4일 #사진 촬영 서비스 #투어 버스 포함");
		travel3.setExplain("태국 자유일정 포함/ 마시지 포함");
		travel3.setTravelDate("2024-05-19 ~ 2024-05-22");
		
		Travel travel4 = new Travel("image/it.jpg", "T04", "이탈리아", 2023000);	
		travel4.setDescription("이탈리아-베니스");
		travel4.setCategory("Overseas Travel");
		travel4.setSubheading("베니스 12일 #사진 촬영 서비스 #전신 마사지");
		travel4.setExplain("물의 도시 베니스 & 아름다운 노래 소리는 덤");
		travel4.setTravelDate("2024-09-10 ~ 2024-09-22");
		
		//캐러셀 활용 라인
		Travel travel10 = new Travel("image/italy.jpg", "T10", "이탈리아", 2800000);	
		travel10.setDescription("이탈리아");
		travel10.setCategory("Overseas Travel");
		travel10.setSubheading("이탈리아 10일 #사진 촬영 서비스 #전신 마사지");
		travel10.setExplain("이탈리아 여행");
		travel10.setDescription("1일차 말라노 -> 2일차 베네치아 -> 3일차 베네치아 근교 섬 -> 4일차 피렌체 -> 5일차 친퀘테레 -> 6일차 아시시 -> 7일차 아말피해안, 포지타노, 소렌토 -> 8일차 -> 폼페이 나폴리 -> 9일차 로마 -> 10일차 로마, 귀국 ");
		travel10.setTravelDate("2024-09-10 ~ 2024-09-20");
		
		Travel travel11 = new Travel("image/hoian.jpg", "T11", "베트남", 523100);	
		travel11.setDescription("베트남");
		travel11.setCategory("Overseas Travel");
		travel11.setSubheading("베트남 #사진 촬영 서비스 #전신 마사지");
		travel11.setExplain("베트남3박4일 신혼여행 추천");
		travel11.setDescription("1일차 한 시장, 콩카페, 다낭 핑크성당, 미케 비치 -> 2일차 바나 힐, 골든 브릿지, 헬리오 야시장, 롯데마트 다낭 -> 3일차 오행성, 올드타운, 소원배, 호이안 야시장 -> 4일차 바구니 배 투어&쿠킹 클래스, 안방비치, 한강 크루즈 ");
		travel11.setTravelDate("2025-04-15 ~ 2025-04-19");
		
		Travel travel12 = new Travel("image/amsterdam.jpg", "T12", "네델란드", 5000000);	
		travel12.setDescription("네델란드");
		travel12.setCategory("Overseas Travel");
		travel12.setSubheading("네델란드 10일 #사진 촬영 서비스 #전신 마사지");
		travel12.setExplain("네델란드 여행");
		travel12.setDescription("1일차 -> 2일차  -> 3일차  -> 4일차  -> 5일차  -> 6일차  -> 7일차  -> 8일차 ->  -> 9일차  -> 10일차 ");
		travel12.setTravelDate("2024-09-10 ~ 2024-09-20");
		
		Travel travel13 = new Travel("image/ohsaka.jpg" ,"T13", "일본(오사카,교토)", 450000);	
		travel13.setCategory("Overseas Travel");
		travel13.setSubheading("오사카/교토 3박 4일 #사진 촬영 서비스 #투어 버스 포함");
		travel13.setExplain("오사카 교토 여행 투어버스 포함");
		travel13.setDescription("오사카 교토 3박 4일 일정\n 1일차 난바 중심 관광 -> 2일차 교토 당일치기 -> "
				 										+	"3일차 우메다 근처 관광 -> 4일차 돌아갑니다.");
		
		travel1.setTravelDate("2024-06-01 ~ 2024-06-05");
		
		
		
		//add
		listOfTravel.add(travel1);
		listOfTravel.add(travel2);
		listOfTravel.add(travel3);
		listOfTravel.add(travel4);
		
		listOfTravel.add(travel10);
		listOfTravel.add(travel11);
		listOfTravel.add(travel12);
		listOfTravel.add(travel13);
		
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
