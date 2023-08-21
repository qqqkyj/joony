package day0622;

public class GaroGugu_06 {

	public static void main(String[] args) {
		//2~9단까지 구구단=>중첩for문
		//[2단] [3딘] .... [9단]
		
		for(int dan=2; dan<=9; dan++) {
			System.out.printf("["+dan+"단]\t");
		}
		
		System.out.println();
		
		for(int i=1; i<=9; i++) {// 가로출력
			for(int dan=2; dan<=9; dan++) {
					
				System.out.printf(dan+"X"+i+"="+dan*i+"\t");//printf는 옆으로 출력됨
				}
				
			System.out.println(" ");
		}
		
	}

}
