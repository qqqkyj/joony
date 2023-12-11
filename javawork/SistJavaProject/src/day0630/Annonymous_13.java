package day0630;
//익명 내부클래스란? 이름없는 클래스로서 이벤트 발생시 생성 후 이벤트 종료 후 메모리에서 자동제거=>event 차원의 활동
//메모리의 효율적 관리때문에 주로 모바일에서 이벤트 방식으로 많이 사용
//인터페이스나 추상클래스를 생성하는 과정에서 바로 나타남 =>메서드를 오러라이딩 하기위해서 사용

abstract class AbstEx{
	abstract public void show();
}

class OuterEx{
	AbstEx ab = new AbstEx() {
		
		@Override
		public void show() {
			System.out.println("익명내부 클래스");
		}
	};
}


public class Annonymous_13 {

	public static void main(String[] args) {
		
		
	}

}
