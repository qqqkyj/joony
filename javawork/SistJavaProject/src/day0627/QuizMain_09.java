package day0627;
/*
멤버: private, 디폴트 생성자
	//변수선언
	private static String SHOP="EMART";
	private String name;
	private int price;

[쇼핑 목록]

쇼핑장소: 이마트

목록1
상품명:손선풍기
가격:25000원

목록2
상품명:핸드폰 충전기
가격:30000원

 목록3
 상품명:이어폰
 가격:70000원
*/
public class QuizMain_09 {

	public static void main(String[] args) {
		
		Quiz_09[] menu = new Quiz_09[3];
		for(int i=0; i<3; i++) {
			menu[i]= new Quiz_09();
		}
				
		menu[0].SetName("손선풍기");
		menu[1].SetName("핸드폰 충전기");
		menu[2].SetName("이어폰");
		
		menu[0].SetPrice(25000);
		menu[1].SetPrice(30000);
		menu[2].SetPrice(70000);
		
		System.out.println("   [쇼핑목록]\n");
		System.out.println("쇼핑 장소: "+Quiz_09.GetShop()+"\n");
		
		for(int i=0; i<3; i++) {
			System.out.println("목록"+(i+1));
			System.out.println("상품명:"+menu[i].GetName());
			System.out.println("가격:"+menu[i].GetPrice());
			System.out.println();
		}
		
	}

}
