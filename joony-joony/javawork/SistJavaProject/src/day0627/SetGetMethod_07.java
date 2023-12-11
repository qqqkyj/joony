package day0627;

import java.util.Scanner;

class Student{//같은 패키지 안에 있을 때 클래스명이 같으면 오류발생
	private String name;
	private int age;//변수는 보호하고 사용시 메서드를 가져다 수정
	
	//setter_method(pameter)
	//인스턴스변수에 저장된데이터를 수정할목적(set변수명)
	//저장수정용도 이므로 리턴값(결과값)이 없다(void)=>명확
	//넘겨줄 parameter(인자값)이 필요
	
	public void setName(String name) {
		this.name=name;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	//getter_method
	//인스턴스변수에 저장된 데이터를 조회할 목적으로 사용(get변수명)
	//데이터를 얻는 목적이므로 호출데이터를 넘겨줄 필요가 없으므로 인자값(파라미터값)이 필요없음
	//실행결과를 돌려주므로 "return 결과값" 으로 지정
	
	public String getName() {
		return this.name;
	}
	
	public int getAge() {
		return this.age;
	}
}

public class SetGetMethod_07 {

	public static void main(String[] args) {
		
		//1.객체생성
		Student stu1 = new Student();//객체생성
		System.out.println("이름: "+stu1.getName());
		System.out.println("나이: "+stu1.getAge());
		
		//2.참조변수명으로 set메서드 호출
		stu1.setName("홍길동");//참조변수(stu1)을 통해서 객체수정(setter), 인자값(parameter)값을 넣어줌
		stu1.setAge(23);
		
		//3.get메서드를 통한 값얻기
		int age=stu1.getAge();
		String name=stu1.getName();
		System.out.println("이름: "+name);//객체 가져오기(getter)
		System.out.println("나이: "+age);
		
		
		//stu2, Scanner로 입력후 setter and getter사용
		Scanner sc = new Scanner(System.in);
		
		String name1;
		int age1;
		
		Student stu2 = new Student();
		System.out.println("이름 입력:");
		name1 = sc.nextLine();
		System.out.println("나이 입력:");
		age1 = sc.nextInt();
		
		stu2.setName(name1);
		stu2.setAge(age1);
		
		System.out.println("이름:"+stu2.getName());
		System.out.println("나이:"+stu2.getAge());
		
		
	}

}
