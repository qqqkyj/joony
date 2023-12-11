package day0628;

class Test{
	
	public Test() {//default constructor
		System.out.println("디폴트 생성자");
	}
	
	//생성자 대신에 인스터스를 반환해주는 메서드 만듦, static메소드와 instance메소드의 차이는 참조변수 사용의 유무(인스턴스메소드는 참조변수 필요)
	public static Test getInstance() {
		return new Test();
	}
	
	//일반메서드
	public void writeMessage() {
		System.out.println("안녕");
	}
}

public class ConstGetInstance_02 {

	public static void main(String[] args) {
		
		Test t1 = new Test();
		t1.writeMessage();
		
		//인스터스사용한 생성자 만듦
		Test t2 = Test.getInstance();
		t2.writeMessage();
		
	}

}
