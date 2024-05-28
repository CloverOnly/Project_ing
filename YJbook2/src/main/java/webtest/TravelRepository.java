
package webtest;

import java.util.ArrayList;


//�ڹٺ���� ����� ������ ���� Ŭ����
//T_Information.jsp�� ���� ���� �۾�
public class TravelRepository {
	private ArrayList<Travel> listOfTravel = new ArrayList<Travel>();
	
	//addArea.jsp�� ���� ���� �۾�--------------------
	private static TravelRepository instance = new TravelRepository();
	
	public static TravelRepository getInstance() {
		return instance;
	}

	//
	//��� ������ �⺻ ������ �����
	public TravelRepository() {
		Travel travel1 = new Travel("image/jp.jpg" ,"T01", "�Ϻ�(����ī,����)", 350000);	
		travel1.setCategory("Overseas Travel");
		travel1.setSubheading("����ī/���� 3�� 4�� #���� �Կ� ���� #���� ���� ����");
		travel1.setExplain("����ī ���� ���� ������� ����");
		travel1.setDescription("����ī ���� 3�� 4�� ����\n 1���� ���� �߽� ���� -> 2���� ���� ����ġ�� -> "
				 										+	"3���� ��޴� ��ó ���� -> 4���� ���ư��ϴ�.");
		
		travel1.setTravelDate("2024-06-01 ~ 2024-06-05");
		
		Travel travel2 = new Travel("image/tw.jpg", "T02", "�븸", 400000);
		
		travel2.setDescription("�븸 3�� 4�� ����\n 1���� �������� - ���󸶰�����- �����߽���(����Ļ��) - ���� -> "
				                              + "2���� ��ùڹ��� - ����(��������,��������,wujiaochuanban, ǻ���丮�Ĵ��̸� ��ÿ��� �������) - �����̿� Ȳ�����뿣��õ - �����̱�(����Ļ�) -���� - �Ǫ - ���� "
													+ "3���� �������� �ý����� - ��Ÿ����(����Ļ�) - �����ø������ + ��Ĳ�� - ���� -> "
													+ "4���� ���� üũ�ƿ� - Ÿ�����̸��ο���ó ���ϻ� ����- �ͱ� ���� 1�� 25�� Ÿ�����Ȱ������ ");
		travel2.setCategory("Overseas Travel");
		travel2.setSubheading("�븸 3�� 4�� #���� �Կ� ���� #���� ���� ����");
		travel2.setExplain("�븸 �Ƹ��ٿ� ����& �߽���");
		travel2.setTravelDate("2024-06-20 ~ 2024-06-23");
		
		Travel travel3 = new Travel("image/ta.jpg", "T03", "�±�", 623000);
		
		travel3.setDescription("�±� 3�� 4�� ����\n 1���� ���� ���ϳ������� ���� - ��Ÿ�� �̵� - ȣ�� üũ�� "
									+"2���� ��Ÿ���� ��ǥ ������ �ѷ����� -> 3����  ��ȣ�� ���� -> 4���� ��Ÿ�� ȣ�� üũ�ƿ� �������� �̵�");
		travel3.setCategory("Overseas Travel");
		travel3.setSubheading("�±� 3�� 4�� #���� �Կ� ���� #���� ���� ����");
		travel3.setExplain("�±� �������� ����/ ������ ����");
		travel3.setTravelDate("2024-05-19 ~ 2024-05-22");
		
		Travel travel4 = new Travel("image/it.jpg", "T04", "��Ż����", 2023000);	
		travel4.setDescription("��Ż����-���Ͻ�");
		travel4.setCategory("Overseas Travel");
		travel4.setSubheading("���Ͻ� 12�� #���� �Կ� ���� #���� ������");
		travel4.setExplain("���� ���� ���Ͻ� & �Ƹ��ٿ� �뷡 �Ҹ��� ��");
		travel4.setTravelDate("2024-09-10 ~ 2024-09-22");
		
		//ĳ���� Ȱ�� ����
		Travel travel10 = new Travel("image/italy.jpg", "T10", "��Ż����", 2800000);	
		travel10.setDescription("��Ż����");
		travel10.setCategory("Overseas Travel");
		travel10.setSubheading("��Ż���� 10�� #���� �Կ� ���� #���� ������");
		travel10.setExplain("��Ż���� ����");
		travel10.setDescription("1���� ����� -> 2���� ����ġ�� -> 3���� ����ġ�� �ٱ� �� -> 4���� �Ƿ�ü -> 5���� ģ���׷� -> 6���� �ƽý� -> 7���� �Ƹ����ؾ�, ����Ÿ��, �ҷ��� -> 8���� -> ������ ������ -> 9���� �θ� -> 10���� �θ�, �ͱ� ");
		travel10.setTravelDate("2024-09-10 ~ 2024-09-20");
		
		Travel travel11 = new Travel("image/hoian.jpg", "T11", "��Ʈ��", 523100);	
		travel11.setDescription("��Ʈ��");
		travel11.setCategory("Overseas Travel");
		travel11.setSubheading("��Ʈ�� #���� �Կ� ���� #���� ������");
		travel11.setExplain("��Ʈ��3��4�� ��ȥ���� ��õ");
		travel11.setDescription("1���� �� ����, ��ī��, �ٳ� ��ũ����, ���� ��ġ -> 2���� �ٳ� ��, ��� �긴��, �︮�� �߽���, �Ե���Ʈ �ٳ� -> 3���� ���༺, �õ�Ÿ��, �ҿ���, ȣ�̾� �߽��� -> 4���� �ٱ��� �� ����&��ŷ Ŭ����, �ȹ��ġ, �Ѱ� ũ���� ");
		travel11.setTravelDate("2025-04-15 ~ 2025-04-19");
		
		Travel travel12 = new Travel("image/amsterdam.jpg", "T12", "�׵�����", 5000000);	
		travel12.setDescription("�׵�����");
		travel12.setCategory("Overseas Travel");
		travel12.setSubheading("�׵����� 10�� #���� �Կ� ���� #���� ������");
		travel12.setExplain("�׵����� ����");
		travel12.setDescription("1���� -> 2����  -> 3����  -> 4����  -> 5����  -> 6����  -> 7����  -> 8���� ->  -> 9����  -> 10���� ");
		travel12.setTravelDate("2024-09-10 ~ 2024-09-20");
		
		Travel travel13 = new Travel("image/ohsaka.jpg" ,"T13", "�Ϻ�(����ī,����)", 450000);	
		travel13.setCategory("Overseas Travel");
		travel13.setSubheading("����ī/���� 3�� 4�� #���� �Կ� ���� #���� ���� ����");
		travel13.setExplain("����ī ���� ���� ������� ����");
		travel13.setDescription("����ī ���� 3�� 4�� ����\n 1���� ���� �߽� ���� -> 2���� ���� ����ġ�� -> "
				 										+	"3���� ��޴� ��ó ���� -> 4���� ���ư��ϴ�.");
		
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

	//T_Information.jsp�� ���� ���� �۾�
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

	//addArea.jsp�� ���� ���� �۾�
	public void addArea(Travel travel) {
		listOfTravel.add(travel);
	}
	
	public ArrayList<Travel> getAllTravel(){
		return listOfTravel;
	}
}
