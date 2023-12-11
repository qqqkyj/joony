package day0629;
/*
 추상 클래스는 new로 생성못함
 추상메서드가 하나라도 존재하는 클래스를 추상 클래스라고 한다
 추상클래스-일반메서드,추상메서드 둘다 존재 가능
 */
abstract class Fruit{
	
	static final String MESSAGE="오늘은 비가 많이 오는날";
	
	//일반메서드
	public void getTitle() {
		System.out.println("우리는 추상클래스 공부중!!!");
	}
	
	//추상메서드(미완의 메서드, 선언문만 있고 구현부인 몸통이 없다)
	abstract public void showMessage();//오버라이딩
	
}

class Apple extends Fruit{//추상클래스를 상속받을시 new 생성없이 사용가능

	@Override
	public void showMessage() {
		System.out.println("Apple_Message");
		System.out.println(Fruit.MESSAGE);
	}
	
}

class Banana extends Fruit{

	@Override
	public void showMessage() {
		System.out.println("Banana_Message");
	}
	
}

class Orange extends Fruit{

	@Override
	public void showMessage() {
		System.out.println("Orange_Message");
	}
	
}

public class ExAbstract_08 {

	public static void main(String[] args) {
		//일반적 생성 메서드 호출
		Apple apple = new Apple();
		Banana banana = new Banana();
		Orange orange = new Orange();
		
		/*apple.showMessage();
		banana.showMessage();
		orange.showMessage();*/
		
		//다형성, 같은 부모로부터 상속받은 자식클래스가 많을 때 하나의 변수로 여러가지 일을 처리가능
		//다형성은 하나의 변수로 여러가지 일을 처리할때 이용
		//부모클래스명 변수명 = new 자식클래스명();
		
		Fruit fruit;
		
		fruit = new Apple();
		fruit.showMessage();
		
		fruit = new Banana();
		fruit.showMessage();
		
		fruit = new Orange();
		fruit.showMessage();
		
		fruit.getTitle();
		
	}

}
