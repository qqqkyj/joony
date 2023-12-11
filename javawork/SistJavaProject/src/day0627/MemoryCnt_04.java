package day0627;

public class MemoryCnt_04 {

	static int count = 0;
	
	//생성자
	public MemoryCnt_04() {
		// default constructor
		count++;
		System.out.println(count);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MemoryCnt_04 mem1 = new MemoryCnt_04();//각각의 생성자 but static이면 한 클래스의 인스턴스를 공유함
		MemoryCnt_04 mem2 = new MemoryCnt_04();

	}

}
