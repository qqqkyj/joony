package day0627;

class obTestA{
	private int x;
	private static int y;
	
	//x에 대한 getter and setter
	public void setX(int x) {
		this.x=x;
		//x=xx; //이름이 다를땐 this 생략가능
	}
	
	public void getX() {//get메서드는 값을 받아오는 용도로 쓰기 때문에 인자값이 필요없음
		System.out.println("X="+this.x);
	}

	//y에 대한 getter and setter
	public static void setY(int y) {//static에서 일반변수, 멤버변수 호출 불가... static변수만 호출가능
		//this.y=y;(X) 참조변수 this를 가지고 있지 않음 so 에러발생
		obTestA.y=y;
	}
	
	public static void getY() {
		System.out.println("Y="+y);//obTestA.y로도 호출가능
	}
	
	
}



public class ExObTest_06 {
	
	public static void main(String[] args) {
		
		//x는 생성.. private 붙이는 순간 에러발생... 메서드로 접근가능
		/*obTestA a = new obTestA();
		System.out.println(a.x);
		
		//y는 클래스명으로 호출
		System.out.println(obTestA.y);*/
		
		//private변수 이므로 메서드를 만들어서 호출가능.. 변수에 직접 접근불가(private)
		obTestA oa1 = new obTestA();
		oa1.setX(20);
		oa1.getX();
		
		//obTestA.y=20; private이므로 멤버y에 접근 불가
		oa1.setY(10);
		oa1.getY();
				
		
	}

}
