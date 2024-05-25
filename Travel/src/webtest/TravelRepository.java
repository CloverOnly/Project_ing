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

	
	//��� ������ �⺻ ������ �����
	public TravelRepository() {
		Travel travel1 = new Travel("image/jp.jpg" ,"T01", "�Ϻ�(����ī,����)", 350000);	
		
		travel1.setDescription("����ī ���� 3�� 4�� ����\n 1���� ���� �߽� ���� -> 2���� ���� ����ġ�� -> "
				 										+	"3���� ��޴� ��ó ���� -> 4���� ���ư��ϴ�.");
		travel1.setCategory("Overseas Travel");
		travel1.setTravelDate("2024-06-01 ~ 2024-06-05");
		
		Travel travel2 = new Travel("image/ta.jpg", "T02", "�븸", 400000);
		
		travel2.setDescription("�븸 3�� 4�� ����\n 1���� �������� - ���󸶰�����- �����߽���(����Ļ��) - ���� -> "
				                              + "2���� ��ùڹ��� - ����(��������,��������,wujiaochuanban, ǻ���丮�Ĵ��̸� ��ÿ��� �������) - �����̿� Ȳ�����뿣��õ - �����̱�(����Ļ�) -���� - �Ǫ - ���� "
													+ "3���� �������� �ý����� - ��Ÿ����(����Ļ�) - �����ø������ + ��Ĳ�� - ���� -> "
													+ "4���� ���� üũ�ƿ� - Ÿ�����̸��ο���ó ���ϻ� ����- �ͱ� ���� 1�� 25�� Ÿ�����Ȱ������ ");
		travel2.setCategory("Overseas Travel");
		travel2.setTravelDate("2024-06-20 ~ 2024-06-23");
		
		Travel travel3 = new Travel("image/tw.jpg", "T03", "�±�", 623000);
		
		travel3.setDescription("�±� 3�� 4�� ����\n 1���� ���� ���ϳ������� ���� - ��Ÿ�� �̵� - ȣ�� üũ�� "
									+"2���� ��Ÿ���� ��ǥ ������ �ѷ����� -> 3����  ��ȣ�� ���� -> 4���� ��Ÿ�� ȣ�� üũ�ƿ� �������� �̵�");
		travel3.setCategory("Overseas Travel");
		travel3.setTravelDate("2024-05-19 ~ 2024-05-22");
		
		
		
		listOfTravel.add(travel1);
		listOfTravel.add(travel2);
		listOfTravel.add(travel3);
		
		
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