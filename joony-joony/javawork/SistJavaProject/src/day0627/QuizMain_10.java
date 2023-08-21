package day0627;
/*
 **상품입고**
 --------------
 입고된 상점:롯데마트
 --------------
 상품명:딸기
 가격:10000원
 수량:5팩
 --------------
 상품명:초코파이
 가격:5000원
 수량:10상자
 --------------
 상품명:요거트
 가격:2500원
 수량:100팩
 --------------
 */
public class QuizMain_10 {

	public static void main(String[] args) {
		
		Quiz_10[] menu = new Quiz_10[3];
		
		for(int i=0; i<3; i++) {
			menu[i] = new Quiz_10();
		}
		
		//set
		//상품명
		menu[0].setSangpum("딸기");
		menu[1].setSangpum("초코파이");
		menu[2].setSangpum("요거트");
		//가격
		menu[0].setDan(10000);
		menu[1].setDan(5000);
		menu[2].setDan(2500);
		//수량
		menu[0].setSu(5);
		menu[1].setSu(10);
		menu[2].setSu(100);
		
		//출력
		System.out.println("**상품입고**");
		System.out.println("---------------");
		System.out.println("입고된 상점:"+Quiz_10.SHOPNAME);
		System.out.println("---------------");
		
		for(int i=0; i<3; i++) {
			System.out.println("상품명: "+menu[i].getSangpum());
			System.out.println("가격: "+menu[i].getDan()+"원");
			System.out.println("수량: "+menu[i].getSu()+"개");
			System.out.println("---------------");
		}
		
		
	}

}
