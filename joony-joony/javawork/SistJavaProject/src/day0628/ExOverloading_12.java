package day0628;

public class ExOverloading_12 {
	
	public static int sum(int a, int b) {
		System.out.println("1번째 함수호출");
		return a+b;
	}
	
	public static double sum(int a, double b) {
		System.out.println("2번째 함수호출");
		return a+b;
	}
	
	public static double sum(double a, int b) {
		System.out.println("3번째 함수호출");
		return a+b;
	}
	
	public static double sum(double a, double b) {
		System.out.println("4번째 함수호출");
		return a+b;
	}
	
	//인자타입(parameter)에 따라서 자동으로 중복함수가 호출된다.
	public static void main(String[] args) {
		
		sum(1,3);
		sum(2,3.0);
		sum(4.5,3);
		sum(1.0,9.3);
		
	}

}
