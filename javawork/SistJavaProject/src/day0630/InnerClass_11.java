package day0630;

//내부 클래스-특정클래스 내에 또 다른 클래스가 정의됨
//하나의 멤버처럼 사용가능(외부의 모든 멤버들을 자신의 멤버처럼 사용가능)
//단일상속의 단점을 어느정도 보완해줌

class OuterObj{
		
	
	class InnerObj{
		
		public void write() {
			System.out.println("내부클래스 메소드");
		}
		
	}
	
	public void showMsg() {//외부메소드는 내부메소드 호출가능
		System.out.println("외부클래스의 메서드");
		System.out.println("외부에서 내부클래스 메서드 호출");
		
		InnerObj inObj = new InnerObj();
		inObj.write();
	}
	
	
}

public class InnerClass_11 {

	public static void main(String[] args) {
		
		OuterObj outObj = new OuterObj();//외부클래스로 객체를 생성 후 
		outObj.showMsg();//외부메소드를 호출하면, 내부메서드를 호출받은 외부메소드가 호출됨
		
		//내부클래스의 메서드 선언=>외부클래스를 통해서만 가능,즉 바깥 클래스부터 내부 클래스로 순차적 호출이 가능
		OuterObj.InnerObj obj = new OuterObj().new InnerObj();//outObj.new InnerObj();
		obj.write();
		
	}

}
