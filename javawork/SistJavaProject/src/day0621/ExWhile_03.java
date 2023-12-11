package day0621;

public class ExWhile_03 {

	public static void main(String[] args) {
		//while for 비교
		//10 9 8 7 .. 0
		int i =10;
		
		while(i>=0) {
			System.out.println(i--+" ");
			i--;
		}
		
		System.out.println();
		
		//for
		for(i=10; i>=0; i--) {
			System.out.println(i+" ");
		}
		
	}

}
