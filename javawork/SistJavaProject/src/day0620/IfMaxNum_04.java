package day0620;

import java.util.Scanner;

public class IfMaxNum_04 {

	public static void main(String[] args) {
		/*
		 3개의 수 입력
		 5
		 7
		 8
		 
		 ***if문
		 가장 큰 수:8
		 ***삼항연산자
		  가장 큰 수:8
		 */
		
		//생성
		Scanner sc = new Scanner(System.in);
		
		//변수
		int a,b,c,Max;
		
		//입력
		System.out.println("3개의 수를 입력하세요:");
		a=sc.nextInt();
		b=sc.nextInt();
		c=sc.nextInt();
		
		//계산
		/*if(a<b&&c<b) {
			Max=b;
		}
		else if(a>b&&a>c) {
			Max=a;
		}
		else {
			Max=c;
		}*/
		
		Max = (a<b&&c<b)?b:(a>b&&a>c)?a:c;
		
		//출력
		System.out.println("입력한 수:"+a+","+b+","+c);
		System.out.println("가장 큰 수:"+Max);
				
		
	}

}
