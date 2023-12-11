package day0628;

class MyInfo{
	
	private String name;
	private int age;
	private String hp;
	public static final String ADDR = "Seoul";//final은 절대불가
	
	public MyInfo() {//디폴트 생성자
		
	}
	
	public MyInfo(String name, int age, String hp) {//명시적 생성자, 3개의 파라메터값(인자값)을 생성과 동시에 같이 넘겨줌
		this.name=name;
		this.age=age;
		this.hp=hp;
	}
	
	//각각의 setter,getter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	
	//3개의 멤버를 한 번에 변경할 메서드
	public void setData(String name, int age, String hp) {
		this.name=name;
		this.age=age;
		this.hp=hp;
	}
	
	//3개의 멤버를 출력
	public void getData() {
		System.out.println("이름:"+this.name);
		System.out.println("나이:"+this.age);
		System.out.println("핸드폰:"+this.hp);
		System.out.println("주소:"+ADDR);
	}
}

public class ExObject_04 {
	public static void main(String[] args) {

		MyInfo in1 = new MyInfo();
		//setter
		in1.setName("홍길순");
		in1.setAge(25);
		in1.setHp("010-8956-4658");
		//getter
		System.out.println("이름:"+in1.getName());
		System.out.println("나이:"+in1.getAge());
		System.out.println("핸드폰:"+in1.getHp());
		System.out.println("주소:"+MyInfo.ADDR);
		
		//메서드를 이용해 3개의 멤버를 한 번에 처리
		MyInfo in2 = new MyInfo();
		in2.setData("홍길동", 23, "010-2656-4567");
		in2.getData();
		
		//명시적 생성자로 3개의 파라메터값을 한 번에 처리
		MyInfo in3 = new MyInfo("강연주",27,"010-8946-5623");
		in3.getData();
	}

}
