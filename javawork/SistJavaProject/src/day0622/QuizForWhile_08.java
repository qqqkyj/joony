package day0622;

import java.util.Scanner;

public class QuizForWhile_08 {

	public static void quiz1() {
		/*
		 나이를 반복해서 입력받는다
		 0이 되면 빠져나와서 출력한다
		 나이가 50이상일 경우 a변수 증가
		 나이가 30이상일 경우 b변수 증가
		 그 나머지는 c변수 증가
		 
		 =========================
		 50세이상: 3명
		 30세이상: 2명
		 그외: 1명
		 */
		
		Scanner sc = new Scanner(System.in);
		
		int age,a=0,b=0,c=0;
		
		while(true) {
			System.out.printf("나이 입력:");
			age=sc.nextInt();
			
			//break
			if(age==0) {
				System.out.println("종료");
				break;
			}
			
			if(age<0) {
				System.out.println("나이를 잘못입력했습니다.");
				continue;
			}
		
			//조건
			if(age<30) {
				c+=1;
			}else if(age<50) {
				b+=1;
			}else {
				a+=1;
			}
		}
		
		System.out.println("***********");
		System.out.println("50세이상:"+a+"명");
		System.out.println("30세이상:"+b+"명");
		System.out.println("그외:"+c+"명");
	}
	
	public static void quiz2() {
		//Q. 총 10개의 다양한 숫자(양수, 음수)를 입력받아 양수의 개수와 음수의 개수를 구하시오
		
		Scanner sc = new Scanner(System.in);
		
		double num;
		int yang=0, um=0;
		
		for(int i=1; i<=10; i++) {
			System.out.println(i+"번 숫자 입력:");
			num=sc.nextDouble();
			
			if(num>0)
				yang++;
			
			else if(num<0)
				um++;			
		}
		
		System.out.println("================");
		System.out.println("양수의 개수:"+yang);
		System.out.println("음수의 개수:"+um);
		
	}
	
	public static void main(String[] args) {
		quiz2();
		
	}

}
