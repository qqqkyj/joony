package day0629;

//class가 class: extends(상속)
//class가 interface: implements(구현)=>추상메서드를 가져와서 완성해 주기위해 사용(사용할 메서드들을 가시적으로 볼 수 있음)=>체계적 업무처리가능
//implements는 클래스와 달리 다중구현이 가능, 여러개의 인터페이스를 같이 구현할 수 있음
//interface가 interface: extends

public class Food implements FoodGage{

	@Override
	public void order() {
		System.out.println(SHOPNAME);
		//SHOPNAME="돈까스집";(final이라 변경안됨)
		System.out.println("음식을 주문합니다.");
	}

	@Override
	public void beadal() {
		System.out.println(SHOPNAME);
		System.out.println("음식을 배달합니다.");
	}
	
	
}
