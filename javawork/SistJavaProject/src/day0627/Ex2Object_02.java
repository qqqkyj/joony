package day0627;

public class Ex2Object_02 {

	//2개의 인스턴스변수 + 2개의 static변수(클래스변수)변수_총 4개의 멤버변수를 가진 클래스
	//instance멤머, new연산자를 거쳐서 메모리에 할당을 받음
	String kind;//카드의 무늬
	int number;//카드 숫자
	
	//클래스변수-같은 클래스의 모든 인스턴스들이 공유
	//인스턴스 생성없이 클래스 이름, 클래스변수명으로 접근 가능
	//클래스가 로딩될때 생성 종료하면 소멸
	static int width;//카드의 폭
	static int height;//카드의 높이
	
}
