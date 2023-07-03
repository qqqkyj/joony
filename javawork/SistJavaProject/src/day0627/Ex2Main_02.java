package day0627;

//class Sist{//public은 클래스 안에서 하나만 존재해야하며 해당 클래스명은 파일이름과 같아야 됨
//	
//}

public class Ex2Main_02 {

	public static void main(String[] args) {
		
		System.out.println(Ex2Object_02.width);
		System.out.println(Ex2Object_02.height);
		
		//클래스 변수
		Ex2Object_02.width=10;//final은 객체생성 필요없이 바로 호출가능 but instance변수는 객체생성 후 호출가능
		Ex2Object_02.height=20;
		
		System.out.println(Ex2Object_02.width);
		System.out.println(Ex2Object_02.height);
		
		//인스턴스 생성 후 변수 호출가능
		Ex2Object_02 card1 = new Ex2Object_02();

		System.out.println(card1.kind);
		System.out.println(card1.number);
		
		card1.kind="Heart";
		card1.number=4;
		
		System.out.println(card1.kind);
		System.out.println(card1.number);
		
		//인스턴스 변수 생성후 변경후 출력
		Ex2Object_02 card2 = new Ex2Object_02();
		card2.kind="space";
		card2.number=10;
		
		System.out.println(card2.kind);
		System.out.println(card2.number);
	}

}
