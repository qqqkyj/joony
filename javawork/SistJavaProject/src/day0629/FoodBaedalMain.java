package day0629;

public class FoodBaedalMain {

	public static void main(String[] args) {
		Food food = new Food();
		food.order();
		food.beadal();
		System.out.println();
		
		//다형성, 부모클래스 참조변수 = new 자식클래스(); 인터페이스명 참조변수 = new 클래스명(); => super를 기반으로 상속(extends) 또는 구현(implements)을 하기때문에 
		FoodGage gage = new Food();
		gage.order();
		gage.beadal();
		
	}

}
