package day0629;

public interface FoodGage {
	
	//인터페이스는 상수와 추상메서드만 선언이 가능하다, 상수를 자동으로 final로 인식
	String SHOPNAME="보슬보슬";//상수
	
	public void order();//abstract method
	public void beadal();

}
