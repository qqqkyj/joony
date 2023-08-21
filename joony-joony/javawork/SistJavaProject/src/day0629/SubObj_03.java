package day0629;

import day0629_1.SuperObj;

//자식패키지
public class SubObj_03 extends SuperObj{
	
	String addr;
	
	//부모생성자 가져와야됨
	public SubObj_03(String name, int age, String addr) {
		super(name, age);//클래스 상속시 super는 의무적으로 사용
		//상속 후에 인자값을 추가할 수 있음, 그 전에 수행시 에러발생
		this.addr =addr;
	}

	public void write() {
		System.out.println("이름: "+this.name);
		System.out.println("나이: "+this.age);
		System.out.println("주소: "+this.addr);
	}

}
