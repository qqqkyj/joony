package spring.di.ex2;

public class Person {

	String schoolName;
	Myinfo info;
	
	public Person(Myinfo info) {
		super();//super()는 써줘도 되고 안써줘도 된다. 쓰지 않았다면 그냥 생략되어있는 것이다.
		this.info=info;
	}

	//setter
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
	//출력
	public void writeData() {
		
		System.out.println("**학생 정보 출력**");
		System.out.println("학교명: "+schoolName);
		System.out.println("학생명: "+info.name);
		System.out.println("나이: "+info.age);
		System.out.println("주소: "+info.addr);
	}
	
}
