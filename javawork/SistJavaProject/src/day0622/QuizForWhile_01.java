package day0622;

public class QuizForWhile_01 {
	
	//오버로딩: 메소드 이름만 같고 매개변수,타입이 다르다(리턴타입은 상관없음)
	//오버라이딩: 메소드 이름, 매개변수, 타입, 리턴타입까지 동일해 주로 상위틀래스의 동작을 상속받은 하위클래스에서 변경하기 위해 사용
	public static void quiz1() {//static은 객체 생성없이 사용가능, 클래스 변수로 heap이 아닌 memory에 저장
		//가로로 출력 _ for _ 1,2,3,4,5 그리고 다음줄에 종료라고 출력하시오
		
		for(int i=1; i<=5; i++) {
			System.out.printf(i+" ");
		}
		System.out.println("\n종료");
	}
	
	public static void quiz2() {
		//가로로 출력 _for_ 1 2 4 5 7 8 10 _continue사용할 것
		
		for(int i=1; i<=10; i++) {
			if(i%3==0)
				continue;//continue 뒤의 식은 생략됨
			System.out.printf(i+" ");
		}
		System.out.println("\n종료");
	}
	
	public static void quiz3() {
		//안녕 을 가로로 3번 출력
		for(int i=0; i<3; i++) {
			System.out.printf("안녕 ");
		}
	}
	
	public static void quiz4() {
		//1부터 10까지 중 짝수만 가로 출력
		for(int i=1; i<=10; i++) {
			if(i%2==0)
				System.out.printf(i+" ");
		}
	}
	
	public static void quiz5() {
		//1부터 10까지의 합은 55입니다
		int sum=0;
		int i;
		for(i=1; i<=10; i++) {
			sum+=i;
		}
		System.out.println("1부터 "+(i-1)+"까지의 합은: "+sum);
	}
	
	public static void main(String[] args) {
		//quiz1();
		//quiz2();
		//quiz3();
		//quiz4();
		quiz5();
		
	}

}
