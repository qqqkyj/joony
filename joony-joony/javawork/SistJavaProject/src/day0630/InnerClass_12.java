package day0630;
//익명내부클래스=>이벤트 한 번 발생 후 종료됨(안드로이드에서 많이 사용)

class Outer{
	
	String name="이민규";
	int age = 22;
	
	
	class Inner{
		//내부에서는 외부클래스 사용가능
		public void disp() {
			System.out.println("**Inner내부 클래스**");
			System.out.println("이름: "+name+",나이: "+age);
		}
	}
	
	class Inner2{
		//내부에서는 외부클래스 사용가능
		public void disp2() {
			System.out.println("**Inner2내부 클래스**");
			System.out.println("이름: "+name+",나이: "+age);
		}
	}
	
	//외부의 메서드 추가
	public void write() {
		//외부에서 내부클래스 선언
		Inner in1 = new Inner();
		in1.disp();
		Inner2 in2 = new Inner2();
		in2.disp2();
	}
}

public class InnerClass_12 {

	public static void main(String[] args) {
		
		Outer outer = new Outer();
		outer.write();
		
		System.out.println("====================");
		
		System.out.println("다른클래스 통하지 않고 직접 내부클래스 메소드를 호출하려면?");
		Outer.Inner in1 = new Outer().new Inner();
		in1.disp();
		Outer.Inner2 in2 = new Outer().new Inner2();
		in2.disp2();
		
	}

}
