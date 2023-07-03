package day0628;

/*
메서드 작성요령
접근제한자(public)+지정예약어(static)+결과리턴형(void, String, int 등)+메서드명(인자값){} => 지정예약어와 인자값은 의무적으로 사용할 필요는 없음
1.반복적인 코드를 줄여서 코드의 관리가 용이
2.하나의 메서드는 한가지 기능만을 수행하도록 작성
 */

public class Method_11 {

	public static boolean aaa() {
		return false;
	}
	
	public static int bbb() {
		return 34;
	}
	
	public static int ccc(int x, int y) {
		
		int z = x+y;
		return z;
	}
	
	public static void main(String[] args) {
		boolean a = aaa();
		System.out.println(a);
		
		int b = bbb();
		System.out.println(b);
		
		int c =ccc(10, 20);
		System.out.println(c);
	}

}
