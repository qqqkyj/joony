package day0620;

import java.util.Scanner;

public class IfMax_03 {

	public static void main(String[] args) {
		//2개의 숫자를 입력받았을 때 Max,Min값 구해보기
		
		//생성
		Scanner sc = new Scanner(System.in);
		
		//변수
		int x,y,Max;
		
		//입력
		System.out.println("**두개의 숫자를 입력하시오:");
		x=sc.nextInt();
		y=sc.nextInt();
		
		//계산
		Max = (x>y)?x:y;

		
		/*if(x>y) {
			Max=x;
		}
		else {
			Max=y;
		}*/
		
		//출력
		System.out.println("입력한 두수:"+x+","+y);
		System.out.println("두수중에서 더 큰값은 "+Max+"입니다.");
		
		//삼항연산자를 이용하여 첫번째수가 더 작다 or 더 크다 출력
		System.out.println("첫번째수가 더 "+(x>y?"크다":"작다"));
		
	}

}
