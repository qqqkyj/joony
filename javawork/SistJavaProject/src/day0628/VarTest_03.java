package day0628;

class Test2{
	int n=0;//매번 객체를 생성할 때 마다 새롭게 생김
	static int cnt=0;//모든 클래스가 공용으로 사용
	
	public Test2() {//디폴트 생성자
		System.out.println("생성자 호출");
		n++;
		cnt++;
	}
	
	public void write() {
		System.out.println("cnt="+cnt+"\tn="+n);
	}
}

public class VarTest_03 {

	public static void main(String[] args) {
		
		Test2 t1 =new Test2();
		
		t1.write();
		
		Test2 t2 =new Test2();
		
		t2.write();
		
		Test2 t3 =new Test2();
		
		t3.write();
		
		
	}

}
