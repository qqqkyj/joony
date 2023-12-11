package day0629;

class point{
	int x;
	int y;
	
	//디폴트 생성자
	public point() {
		System.out.println("super_디폴트 생성자");
	}
	
	//명시적 생성자
	public point(int x, int y) {
		System.out.println("super_명시적 생성자");
		this.x=x;
		this.y=y;
	}
	
	//메서드
	public void write() {
		System.out.println("super_메소드");
		System.out.println("x좌표="+x);
		System.out.println("y좌표="+y);
	}
}

class SubPoint extends point{
	
	String msg;
	
	public SubPoint(int x, int y,String msg) {
		super(x, y);
		this.msg=msg;
		System.out.println("sub_명시적 생성자");
	}
	
	public SubPoint() {
		//super();는 디폴트로 생략되어있음
		System.out.println("sub_디폴트 생성자");
	}
	
	//오버라이딩=>부모의 메서드를 재정의
	@Override
	public void write() {
		super.write();
		System.out.println("sub_메서드");
		System.out.println("메세지:"+msg);
	}
	
}

public class ExObTest_05 {

	public static void main(String[] args) {
		SubPoint sp = new SubPoint();
		sp.write();
		System.out.println("---------------------");
		SubPoint sp2 = new SubPoint(1,2,"This is test");
		sp2.write();
		
	}

}
