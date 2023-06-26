package day0622;

import java.util.Scanner;

public class ScanGugu_05 {

	public static void main(String[] args) {
		//단을 입력해서 해당단 출력하기
		//0을 입력하면 종료
		
		//생성
		Scanner sc = new Scanner(System.in);
		
		//변수
		int dan;
		
		//조건
		while(true) {
			//입력
			System.out.println("단을 입력(0은 종료):");
			dan=sc.nextInt();
			
			//종료(break)먼저 설정
			if(dan==0) {
				System.out.println("종료");
				break;
				}
			
			//2~9단까지만 출력		
			if(dan<2||dan>9) {
				System.out.println("단을 다시 입력하세요.");
				continue;
			}
			
			//구구단 출력
			System.out.println("["+dan+"단]");
			for(int j=1; j<=9; j++) {
				//System.out.println(dan+"X"+j+"="+dan*j);
				System.out.printf("%d X %d = %2d\n", dan, j, dan*j);
			}
				
			
		}
		System.out.println();
		
	}

}
